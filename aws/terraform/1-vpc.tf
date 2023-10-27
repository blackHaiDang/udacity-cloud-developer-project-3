
resource "aws_vpc" "project3_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "project3_vpc"
  }
}