"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const index_1 = require("./index");
(0, index_1.handler)({
    body: "",
    headers: {},
    httpMethod: "GET",
    isBase64Encoded: false,
    multiValueHeaders: {},
    multiValueQueryStringParameters: {},
    path: "/",
    pathParameters: {},
    queryStringParameters: {},
    resource: "",
    stageVariables: {},
    requestContext: {
        accountId: "",
        apiId: "",
        authorizer: {},
        domainName: "",
        domainPrefix: "",
        extendedRequestId: "",
        httpMethod: "",
        identity: {
            accessKey: "",
            accountId: "",
            apiKey: "",
            apiKeyId: "",
            caller: "",
            cognitoAuthenticationProvider: "",
            cognitoAuthenticationType: "",
            cognitoIdentityId: "",
            cognitoIdentityPoolId: "",
            principalOrgId: "",
            sourceIp: "",
            user: "",
            userAgent: "",
            userArn: "",
            clientCert: null,
        },
        path: "",
        protocol: "",
        requestId: "",
        requestTime: "",
        requestTimeEpoch: 0,
        resourceId: "",
        resourcePath: "",
        stage: "",
    },
}).then((x) => console.log(x));