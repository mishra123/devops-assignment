output "iam_role_arn" {
  value       = aws_iam_role.default.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "iam_role_name" {
  value = aws_iam_role.default.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.default.arn
}

output "instance_profile_arn" {
  value = var.create_instance_profile == true ? aws_iam_instance_profile.default[0].arn : ""
}


output "instance_profile_name" {
  value = var.create_instance_profile == true ? aws_iam_instance_profile.default[0].name : ""
}