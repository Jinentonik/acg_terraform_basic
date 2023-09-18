resource "aws_iam_role" "SSM_Role" {
  name = "SSM_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "SSM Role"
  }
}

resource "aws_iam_role_policy_attachment" "SSM_Role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.SSM_Role.name
}
resource "aws_iam_role_policy_attachment" "S3_Access_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.SSM_Role.name
}

resource "aws_iam_instance_profile" "SSM_profile" {
  name = "SSM_profile"

  role = aws_iam_role.SSM_Role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

