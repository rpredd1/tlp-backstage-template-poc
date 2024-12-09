import { AuthResponse } from "aws-lambda";
import azureJWT from "azure-jwt-verify";

import generatePolicy from "../../services/generate-policy";
import { APIGatewayAuthorizerEventCustom } from "../../types/authRequestEvent";

export const handler = async (
  event: APIGatewayAuthorizerEventCustom,
): Promise<AuthResponse> => {
  // eslint-disable-next-line
  let decoded: any = {}
  try {
    const authorization = event.headers?.Authorization || "";
    const token = /[Bb]earer (.*)/.exec(authorization)?.[1] || "";

    const config = {
      JWK_URI: "https://login.microsoftonline.com/common/discovery/keys",
    };
    decoded = JSON.parse(await azureJWT.verify(token, config));
    if (decoded?.status === "success") {
      return {
        principalId: "User",
        policyDocument: generatePolicy("Allow", "*"),
      } as AuthResponse;
    }
  } catch (error) {
    console.error("An error happened during authentication", error);
  }

  return {
    principalId: "User",
    policyDocument: generatePolicy("Deny", "*"),
  } as AuthResponse;
};
