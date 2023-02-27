# Create an IAM role with the specified name and policies
resource "aws_iam_role" "this" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  # Attach policies
  for_each = toset(var.policy_arns)
  policy {
    policy_arn = each.key
  }
}

# Output the IAM role ARN
output "arn" {
  value = aws_iam_role.this.arn
}
