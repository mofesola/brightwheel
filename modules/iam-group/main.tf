# Create an IAM group
resource "aws_iam_group" "this" {
  name = var.group_name
}

# Output the IAM group name
output "name" {
  value = aws_iam_group.this.name
}
