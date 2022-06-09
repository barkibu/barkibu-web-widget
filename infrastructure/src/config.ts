import { Config, Output } from "@pulumi/pulumi"

type Configuration = {
  envName: string
  bucket: {
    name: string
  }
}

const pulumiConfig = new Config()

export const environment = pulumiConfig.get("environment")
export const config: Configuration =
  environment == "dev"
    ? {
        envName: environment,
        bucket: {
          name: ("vetinsight-web-widgets-configurations-dev")
        }
      }
    : environment == "production"
    ? {
        envName: environment,
        bucket: {
          name: ("vetinsight-web-widgets-configurations-production")
        }
      }
    : environment == "staging"
    ? {
        envName: environment,
        bucket: {
          name: ("vetinsight-web-widgets-configurations-staging")
        }
      }
    : ({} as Configuration)

export const awsTags = {
  managed_by: "Pulumi",
  env: `${environment}`,
  application: "vetinsight",
}
