import { APIGatewayProxyEventV2 } from "aws-lambda";

import { handler } from "./index";

describe("Handler", () => {
  it("returns a response with status code 200 and a message", async () => {
    const event = {} as APIGatewayProxyEventV2;

    const response = await handler(event);

    expect(response.statusCode).toBe(200);
    expect(JSON.parse(response.body)).toEqual({
      message: "tlp-backstage-template-poc 10!!",
    });
  });
});
