High-level Overview of the Implementation:
The implementation involves creating an IAM RBAC implementation to support each of Brightwheel's engineering teams. The solution ensures that access to AWS tools and technology is restricted based on each team's requirements, thereby preventing privilege escalation attacks within IAM. The implementation uses AWS CloudFormation to create IAM roles and policies to provide granular access control to the different engineering teams. Each team is provided with access only to the AWS services required for their specific area of product focus.

How users of the system are managed:
Each team's users are managed through AWS IAM. Users are added to groups based on their role and associated policies that determine what AWS resources they can access. The implementation uses AWS CloudFormation to create IAM roles and policies that provide granular access control to the different engineering teams. The policies are attached to the roles, and each role is associated with a specific team. This allows users to assume roles associated with their teams and access only the AWS resources required for their specific area of product focus.


Assumptions made:

All users already have AWS accounts.
We will use AWS managed Policies to build the intial PoC

Next steps:
Given more time, the following would be the next steps:
Implement Custom Policies to allow better fine grained access control.
Create a CI/CD pipeline to automate the deployment of the IAM RBAC implementation.
Implement AWS Security Hub to monitor and manage security compliance across all accounts and environments.
Implement AWS Cost Explorer to monitor and manage AWS costs across all accounts and environments.
Implement AWS CloudTrail to provide governance, compliance, and audit trail across all accounts and environments.
Implement AWS Config to track and manage AWS resource inventory and changes across all accounts and environments.
Create a centralized logging solution using Amazon CloudWatch Logs to monitor, store, and analyze logs across all accounts and environments.