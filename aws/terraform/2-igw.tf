resource "aws_internet_gateway" "project3_igw" {
  vpc_id = aws_vpc.project3_vpc.id

  tags = {
    Name = "project3_igw"
  }
}