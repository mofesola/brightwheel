resource "aws_iam_group_membership" "this" {
  group = var.group_name
  users = var.user_names
}
