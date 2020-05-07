import * as cdk from "@aws-cdk/core";
import * as ec2 from "@aws-cdk/aws-ec2";
import * as elbv2 from "@aws-cdk/aws-elasticloadbalancingv2";
import * as ecs from "@aws-cdk/aws-ecs";
import * as ecr from "@aws-cdk/aws-ecr";
import * as iam from "@aws-cdk/aws-iam";

export class CdkStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const { vpc, sgALB, sgApp, sgDB, sgRedis, sgRepository } = this.createVpc();

    this.createALB(
      vpc,
      sgALB,
      vpc.selectSubnets({ subnetGroupName: "Ingress" })
    );

    const repository = this.createECR(
      vpc,
      sgRepository,
      vpc.selectSubnets({ subnetGroupName: "App" })
    );

    this.createECS(vpc, sgApp, repository);
  }

  createVpc(): {
    vpc: ec2.Vpc;
    sgALB: ec2.SecurityGroup;
    sgApp: ec2.SecurityGroup;
    sgDB: ec2.SecurityGroup;
    sgRedis: ec2.SecurityGroup;
    sgRepository: ec2.SecurityGroup;
  } {
    const vpc = new ec2.Vpc(this, "VPC", {
      cidr: "10.0.0.0/24",
      maxAzs: 2,
      subnetConfiguration: [
        {
          name: "Ingress",
          subnetType: ec2.SubnetType.PUBLIC,
        },
        {
          name: "Data",
          subnetType: ec2.SubnetType.ISOLATED,
        },
        {
          name: "App",
          subnetType: ec2.SubnetType.ISOLATED,
        },
      ],
    });

    const sgALB = new ec2.SecurityGroup(this, "sgALB", { vpc });
    sgALB.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(80));
    sgALB.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(443));

    const sgApp = new ec2.SecurityGroup(this, "sgApp", { vpc });
    sgApp.addIngressRule(sgALB, ec2.Port.tcp(80));

    const sgDB = new ec2.SecurityGroup(this, "sgDB", { vpc });
    sgDB.addIngressRule(sgApp, ec2.Port.tcp(3306));

    const sgRedis = new ec2.SecurityGroup(this, "sgRDS", { vpc });
    sgRedis.addIngressRule(sgApp, ec2.Port.tcp(3306));

    const sgRepository = new ec2.SecurityGroup(this, "sgRepository", { vpc });
    sgRepository.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(443));

    return { vpc, sgALB, sgApp, sgDB, sgRedis, sgRepository };
  }

  createALB(vpc: ec2.Vpc, sg: ec2.SecurityGroup, subnets: ec2.SubnetSelection) {
    const alb = new elbv2.ApplicationLoadBalancer(this, "ALB", {
      vpc,
      vpcSubnets: subnets,
      internetFacing: true,
      securityGroup: sg,
    });
    alb
      .addListener("albListner80", { port: 80 })
      .addRedirectResponse("albListener80RedirectResponse", {
        protocol: "HTTPS",
        port: "443",
        statusCode: "HTTP_301",
      });
    alb
      .addListener("albListner443", {
        port: 443,
        certificateArns: [
          new cdk.CfnParameter(this, "certArnParam", {
            type: "String",
            description: "ALB certficate arn",
          }).valueAsString,
        ],
      })
      .addTargetGroups("albListener443TargetGroups", {
        targetGroups: [
          new elbv2.ApplicationTargetGroup(this, "albtgApp", {
            vpc,
            targetType: elbv2.TargetType.IP,
            protocol: elbv2.ApplicationProtocol.HTTP,
            port: 80,
            // NOTE: no default targets
          }),
        ],
      });
  }

  createECR(
    vpc: ec2.Vpc,
    sg: ec2.SecurityGroup,
    subnets: ec2.SubnetSelection
  ): ecr.Repository {
    const repository = new ecr.Repository(this, "ecrRepository");
    // For Fargate in isolated subnet, ECR_DOCKER and S3 private endpoint are needed.
    // refs https://docs.aws.amazon.com/AmazonECR/latest/userguide/vpc-endpoints.html
    vpc.addInterfaceEndpoint("vpcEcrEndpoint", {
      service: ec2.InterfaceVpcEndpointAwsService.ECR_DOCKER,
      subnets: vpc.selectSubnets({ subnetGroupName: "App" }),
      securityGroups: [sg],
    });
    vpc.addS3Endpoint("vpcS3Endpoint", [subnets]);

    return repository;
  }

  createECS(vpc: ec2.Vpc, sg: ec2.SecurityGroup, repository: ecr.Repository) {
    const cluster = new ecs.Cluster(this, "Cluster", { vpc });
    const taskDefinition = new ecs.TaskDefinition(this, "ecsTaskDef", {
      compatibility: ecs.Compatibility.FARGATE,
      cpu: "256",
      memoryMiB: "512",
      executionRole: new iam.Role(this, "roleTaskExecution", {
        assumedBy: new iam.ServicePrincipal("ecs-tasks.amazonaws.com"),
        managedPolicies: [
          iam.ManagedPolicy.fromAwsManagedPolicyName(
            "service-role/AmazonECSTaskExecutionRolePolicy"
          ),
        ],
      }),
    });
    taskDefinition
      .addContainer("ecsContanerApp", {
        image: ecs.ContainerImage.fromEcrRepository(repository),
      })
      .addPortMappings({ containerPort: 80 });
    new ecs.FargateService(this, "ecsFargateService", {
      cluster,
      taskDefinition,
      vpcSubnets: vpc.selectSubnets({ subnetGroupName: "App" }),
      securityGroup: sg,
    });
  }
}
