#!/usr/bin/env node
import "source-map-support/register";
import * as cdk from "@aws-cdk/core";
import { RailsVue } from "../lib/rails-vue";

const env = process.env;

const app = new cdk.App();
new RailsVue(app, "RailsVue", {
  certArn: env.CERT_ARN!,
  dbName: "railsvue",
  dbUser: "railsvue",
  dbPassParamName: env.PASS_PARAM_NAME!,
  repoName: env.REPO_NAME!,
  appSecretParamName: env.APP_SECRET_PARAM_NAME!,
});
