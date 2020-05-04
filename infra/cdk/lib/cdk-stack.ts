import * as cdk from "@aws-cdk/core";
import * as ec2 from "@aws-cdk/aws-ec2";
import * as elbv2 from "@aws-cdk/aws-elasticloadbalancingv2";
import * as ecs from "@aws-cdk/aws-ecs";

export class CdkStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // --- VPC ---
    const vpc = new ec2.Vpc(this, "VPC", {
      cidr: "10.0.0.0/24",
      maxAzs: 2,
      subnetConfiguration: [
        {
          name: "Ingress",
          subnetType: ec2.SubnetType.PUBLIC,
          cidrMask: 28,
        },
        {
          name: "Data",
          subnetType: ec2.SubnetType.ISOLATED,
          cidrMask: 28,
        },
        {
          name: "App",
          subnetType: ec2.SubnetType.ISOLATED,
          cidrMask: 26,
        },
        // rest: one of 27
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

    // --- ALB ---
    const alb = new elbv2.ApplicationLoadBalancer(this, "ALB", {
      vpc,
      internetFacing: true,
    });
    alb
      .addListener("albListner80", { port: 80 })
      .addRedirectResponse("albListener80RedirectResponse", {
        port: "443",
        statusCode: "HTTP_301",
      });

    const certArnParam = new cdk.CfnParameter(this, "certArnParam", {
      type: "String",
      description: "ALB certficate arn",
    });
    alb
      .addListener("albListner443", {
        port: 443,
        certificateArns: [certArnParam.valueAsString],
      })
      .addTargetGroups("albListener443TargetGroups", {
        targetGroups: [
          new elbv2.ApplicationTargetGroup(this, "albtgApp", {
            vpc,
            protocol: elbv2.ApplicationProtocol.HTTP,
            port: 80,
            // MEMO: no default targets
          }),
        ],
      });

    // --- ECS ---
    const cluster = new ecs.Cluster(this, "Cluster", { vpc });
    const taskDefinition = new ecs.TaskDefinition(this, "ecsTaskDef", {
      compatibility: ecs.Compatibility.FARGATE,
      cpu: "256",
      memoryMiB: "512",
      // executionRole: for using ECR
    });
    taskDefinition.addContainer("ecsContanerApp", {
      image: ecs.RepositoryImage.fromRegistry("httpd"),
    });
    new ecs.FargateService(this, "ecsFargateService", {
      cluster,
      taskDefinition,
    });
  }
}
