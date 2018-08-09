module "api_gateway_stage" {
  source = "../api_gateway_stage"

  stage_name  = "test"
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  depends_on  = ["${aws_api_gateway_integration.mock.id}"]
}

resource "aws_api_gateway_rest_api" "api" {
  name        = "test-api"
  description = ""
}

resource "aws_api_gateway_method" "mock" {
  rest_api_id   = "${aws_api_gateway_rest_api.api.id}"
  resource_id   = "${aws_api_gateway_rest_api.api.root_resource_id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "mock" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_rest_api.api.root_resource_id}"
  http_method = "${aws_api_gateway_method.mock.http_method}"
  type        = "MOCK"
}
