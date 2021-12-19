resource "aws_iam_role" "default" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  path        = var.path
  description = var.description
  max_session_duration  = var.max_session_duration
  force_detach_policies = var.force_detach_policies
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_policy" "default" {
  name   = var.name
  policy = var.policy
  path        = var.path
  description = var.description
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_instance_profile" "default" {
  count = var.create_instance_profile ? 1 : 0
  name  = var.name
  path  = var.path
  role  = aws_iam_role.default.name
  lifecycle {
    create_before_destroy = true
  }
}
