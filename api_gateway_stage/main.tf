resource "aws_api_gateway_stage" "api" {
  stage_name    = "${var.stage_name}"
  rest_api_id   = "${var.rest_api_id}"
  deployment_id = "${aws_api_gateway_deployment.api.id}"

  access_log_settings {
    destination_arn = "${aws_cloudwatch_log_group.log_group.arn}"

    format = "{ \"requestId\":\"$context.requestId\", \"ip\": \"$context.identity.sourceIp\", \"caller\":\"$context.identity.caller\", \"user\":\"$context.identity.user\", \"requestTime\":\"$context.requestTime\", \"httpMethod\":\"$context.httpMethod\", \"resourcePath\":\"$context.resourcePath\", \"status\":\"$context.status\", \"protocol\":\"$context.protocol\", \"responseLength\":\"$context.responseLength\" }"
  }
}

resource "aws_api_gateway_method_settings" "api" {
  rest_api_id = "${var.rest_api_id}"
  stage_name  = "${aws_api_gateway_stage.api.stage_name}"
  method_path = "*/*"

  settings {
    metrics_enabled = true
    logging_level   = "INFO"
    data_trace_enabled = false //CLOUDWATCH IS NOT HIPPA COMPLIANT - CAN'T LOG REQUEST/RESPONSES
  }
}

resource "aws_api_gateway_deployment" "api" {
  rest_api_id = "${var.rest_api_id}"
  stage_name  = ""
  depends_on  = ["null_resource.depends_on"]
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/apigateway/${var.rest_api_id}/${var.stage_name}"
}

resource "null_resource" "depends_on" {
  triggers {
    depends_on = "${join(",", var.depends_on)}"
  }
}
