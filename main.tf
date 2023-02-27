provider "aws" {
  region = var.region
}

# Define IAM groups
module "frontend_iam_group" {
  source = "./modules/iam-group"
  group_name = "frontend-engineering"
}

module "backend_iam_group" {
  source = "./modules/iam-group"
  group_name = "backend-engineering"
}

module "data_iam_group" {
  source = "./modules/iam-group"
  group_name = "data-engineering"
}

module "sre_iam_group" {
  source = "./modules/iam-group"
  group_name = "sre"
}

# Define IAM roles and policies for CloudFront
module "frontend_cloudfront_iam_role" {
  source = "./modules/iam-role"
  role_name = "frontend_cloudfront"
  policy_arns = [
    "arn:aws:iam::aws:policy/CloudFrontReadOnlyAccess"
  ]
}

# Define IAM roles and policies for EKS
module "backend_eks_iam_role" {
  source = "./modules/iam-role"
  role_name = "backend_eks"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  ]
}

# Define IAM roles and policies for Redshift
module "data_redshift_iam_role" {
  source = "./modules/iam-role"
  role_name = "data_redshift"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonRedshiftReadOnlyAccess"
  ]
}

# Define IAM policies for SRE
module "sre_iam_policy" {
  source = "./modules/iam-policy"
  policy_name = "sre_policy"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Assign roles to IAM groups
module "frontend_iam_group_membership" {
  source = "./modules/iam-group-membership"
  group_name = module.frontend_iam_group.name
  role_arns = [
    module.frontend_cloudfront_iam_role.arn
  ]
}

module "backend_iam_group_membership" {
  source = "./modules/iam-group-membership"
  group_name = module.backend_iam_group.name
  role_arns = [
    module.backend_eks_iam_role.arn
  ]
}

module "data_iam_group_membership" {
  source = "./modules/iam-group-membership"
  group_name = module.data_iam_group.name
  role_arns = [
    module.data_redshift_iam_role.arn
  ]
}

module "sre_iam_group_membership" {
  source = "./modules/iam-group-membership"
  group_name = module.sre_iam_group.name
  role_arns = [
    module.frontend_cloudfront_iam_role.arn,
    module.backend_eks_iam_role.arn,
    module.data_redshift_iam_role.arn,
    module.sre_iam_policy.arn
  ]
}
