import { APIGatewayRequestAuthorizerEvent } from "aws-lambda";

export interface APIGatewayAuthorizerEventCustom
  extends APIGatewayRequestAuthorizerEvent {
  authorizationToken: string;
}
