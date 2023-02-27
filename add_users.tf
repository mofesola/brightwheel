# Add users to the IAM groups
module "frontend_group_membership" {
  source = "./iam-group-membership"
  group_name = module.frontend_group.name
  user_names = ["user1", "user2"]
}

module "backend_group_membership" {
  source = "./iam-group-membership"
  group_name = module.backend_group.name
  user_names = ["user3", "user4"]
}

module "data_group_membership" {
  source = "./iam-group-membership"
  group_name = module.data_group.name
  user_names = ["user5", "user6"]
}

module "admin_group_membership" {
  source = "./iam-group-membership"
  group_name = module.admin_group.name
  user_names = ["admin1", "admin2"]
}
