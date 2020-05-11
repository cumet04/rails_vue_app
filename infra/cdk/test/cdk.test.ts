import {
  expect as expectCDK,
  matchTemplate,
  MatchStyle,
} from "@aws-cdk/assert";
import * as cdk from "@aws-cdk/core";
import * as Cdk from "../lib/rails-vue";

test("Empty Stack", () => {
  const app = new cdk.App();
  // WHEN
  const env = process.env;
  const stack = new Cdk.RailsVue(app, "MyTestStack", {
    // FIXME: tmp params
    certArn: env.CERT_ARN!,
    dbName: "railsvue",
    dbUser: "railsvue",
    dbPassParamName: env.PASS_PARAM_NAME!,
    appRepoName: env.APP_REPO_NAME!,
    webRepoName: env.WEB_REPO_NAME!,
    appSecretParamName: env.APP_SECRET_PARAM_NAME!,
  });
  // THEN
  expectCDK(stack).to(
    matchTemplate(
      {
        Resources: {},
      },
      MatchStyle.EXACT
    )
  );
});
