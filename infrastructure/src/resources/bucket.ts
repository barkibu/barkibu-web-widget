import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import { config } from "../config"

const bucket = new aws.s3.Bucket(config.bucket.name, {});
const allowAccessFromAnotherAccountPolicyDocument = aws.iam.getPolicyDocumentOutput({
    statements: [{
        principals: [{
            type: "AWS",
            identifiers: ["*"],
        }],
        actions: [
            "s3:GetObject",
        ],
        resources: [
            bucket.arn,
            pulumi.interpolate`${bucket.arn}/*`,
        ],
    }],
});
const allowAccessFromAnotherAccountBucketPolicy = new aws.s3.BucketPolicy("allowAccessFromAnotherAccountBucketPolicy", {
    bucket: bucket.id,
    policy: allowAccessFromAnotherAccountPolicyDocument.apply(allowAccessFromAnotherAccountPolicyDocument => allowAccessFromAnotherAccountPolicyDocument.json),
});

export const Bucket = {
    bucket
}
