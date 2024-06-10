resource "aws_iam_role" "role-eks-cluster" {
  name = "eks-${local.eks_name}"

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

  tags = {
    Name = "${local.project}-role-eks-cluster"
    project = local.project
  }
}

resource "aws_iam_role_policy_attachment" "amazon-eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.role-eks-cluster.name
}

resource "aws_eks_cluster" "cluster" {
  name     = local.eks_name
  version  = local.eks_version
  role_arn = aws_iam_role.role-eks-cluster.arn

  vpc_config {

    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]

    subnet_ids = [
      aws_subnet.private_subnet1.id,
      aws_subnet.private_subnet2.id,
      aws_subnet.public_subnet1.id,
      aws_subnet.public_subnet2.id
    ]
  }

  tags = {
    Name = "${local.project}-eks-cluster"
    project = local.project
  }

  depends_on = [aws_iam_role_policy_attachment.amazon-eks-cluster-policy]
}