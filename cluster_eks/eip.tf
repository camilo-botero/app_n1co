resource "aws_eip" "eip1" {
  domain = "vpc"

  tags = {
        Name = "${local.project}-eip1"
        project = local.project
  }
}
