# Define workspaces
workspace "dev" {
  # Set variables for dev environment
  variables = {
    region = "us-west-2"
  }
}

workspace "qa" {
  # Set variables for qa environment
  variables = {
    region = "us-west-2"
  }
}

workspace "prod" {
  # Set variables for prod environment
  variables = {
    region = "us-west-2"
  }
}
