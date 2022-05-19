# Provisioning AWS with Terraform
## Variables, Security Groups, SSH, EC2, S3, and DynamoDB 

### FILES STRUCTURE
remote-state.tf - creates and saves a new versioned repository in a remote back-end every time when configs have changed and applied.

security-group.tf - It provides two SSH connections into a security group and a bridge between Zones with the host.

main.tf - It contains all Instances of the project. There is a counter, who up how many instances are necessary and two instances separately, dependents of S3 and DynamoDB to be deployed.

vars.tf - Allows sharing modules across different Terraform configuration files, making the module composable and reusable.

output.tf - Expose information about the configurations to create Custom Condition Checks. Ex: if outputs are different from expected results, notify the provider.

### DIAGRAM OF THE INFRAESTRUCTRE AND THE CONFIGURATION FILES

![terraform_sg_ec2_s3_dynamodb (1)](https://user-images.githubusercontent.com/105178616/168957788-57fe26a2-020b-4fe3-841a-7e292ecd0168.jpg)
