resource "aws_iam_role" "project3_role" {
  name = "project3-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "project3-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.project3_role.name
}

resource "aws_eks_cluster" "project3_eks_cluster" {
  name     = "project3_eks_cluster"
  role_arn = aws_iam_role.project3_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-1a.id,
      aws_subnet.private-us-east-1b.id,
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id
    ]
  }
  
  tags = {
    KubernetesCluster = "project3_eks_cluster"
  }

  depends_on = [aws_iam_role_policy_attachment.project3-AmazonEKSClusterPolicy]
}
