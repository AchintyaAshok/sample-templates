import { APIGatewayProxyEvent, APIGatewayProxyResultV2, Context } from "aws-lambda";

/**
 * Event can be of any type depending on Lambda Trigger
 * Types are available in @types/aws-lambda.
 * Commonly used type would be APIGatewayProxyEvent
 * */
const sampleLambdaHandler = async (event: APIGatewayProxyEvent, context: Context): Promise<APIGatewayProxyResultV2> => {

    return {
        statusCode: 200,
        body: JSON.stringify("Hello world")
    }
}

export { sampleLambdaHandler };