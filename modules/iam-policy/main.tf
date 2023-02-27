# Create an IAM policy with the specified name and ARN
resource "aws_iam_policy" "this" {
  name = var.policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "*"
      }
    ]
  })
}

# Attach the specified policy ARN to the IAM policy
resource "aws_iam_policy_attachment" "this" {
  policy_arn = var.policy_arn
  roles = []
  groups = []
  users = []
}

# Output the IAM policy ARN
output "arn" {
  value = aws_iam_policy.this.arn
}
