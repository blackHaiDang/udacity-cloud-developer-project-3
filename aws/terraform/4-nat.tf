resource "aws_eip" "project3_nat" {
  vpc = true

  tags = {
    Name = "project3_nat"
  }
}

resource "aws_nat_gateway" "project3_nat" {
  allocation_id = aws_eip.project3_nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "project3_nat"
  }

  depends_on = [aws_internet_gateway.project3_igw]
}
