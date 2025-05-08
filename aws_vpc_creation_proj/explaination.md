Project Structure

The project consists of four Terraform files organized as follows:
.
├── main.tf              # Root configuration: Sets up the AWS provider, calls the VPC module, and creates the EC2 instance
├── aws_vpc/             # Module directory for VPC and subnet
│   ├── main.tf          # Defines the VPC and subnet resources
│   ├── outputs.tf       # Defines outputs for VPC ID and subnet ID
│   └── variables.tf     # Defines variables for VPC and subnet CIDR blocks
├── README.md            # This file (project documentation)

![Screenshot 2025-05-08 165115](https://github.com/user-attachments/assets/fca0b8d7-b69a-4a18-b47b-4d0a9d5b0f88)

