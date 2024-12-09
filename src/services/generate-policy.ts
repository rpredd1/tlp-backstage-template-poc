import { PolicyDocument } from "aws-lambda";

/*
Sample of function return
{
  "principalId": "User",
  "policyDocument": {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "execute-api:Invoke",
        "Effect": "Deny",
        "Resource": "*"
      }
    ]
  }
}
*/

export default (Effect: string, Resource: string): PolicyDocument =>
  ({
    Version: "2012-10-17",
    Statement: [
      {
        Action: "execute-api:Invoke",
        Effect,
        Resource,
      },
    ],
  }) as PolicyDocument;
