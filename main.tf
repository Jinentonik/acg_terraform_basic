# Configure the AWS Provider
variable "region" {
  type    = string
  default = "us-east-1" # Replace with the default region you want to use
}
variable "windows_ami" {
  type    = string
  default = "ami-0ea6a9ded5194e937"
}

variable "linux_ami" {
  type = string
  default = "ami-01c647eace872fc02"
}

provider "aws" {
  profile                  = "acloudguru"
  shared_credentials_files = ["C:/Users/jinkang.tan/.aws/credentials"]
  region                   = var.region
}


resource "aws_kms_key" "this_project" {
  description = "KMS key for ${var.project_name}-${var.env}"
}

resource "aws_kms_alias" "this_project" {
  name          = "alias/${var.project_name}-${var.env}-encryption"
  target_key_id = aws_kms_key.this_project.key_id
}

resource "aws_kms_key_policy" "default_for_this_project" {
  key_id = aws_kms_key.this_project.id

  policy = jsonencode({
    Id      = "key-consolepolicy-3",
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Enable IAM User Permissions",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:root"
        },
        Action   = "kms:*",
        Resource = "*"
      },
      {
        Sid       = "Allow access for Key Administrators",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion"
        ],
        Resource = "*"
      },
      {
        Sid       = "Allow use of the key",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        Resource = "*",
        Condition = {
          "StringLike" : {
            "aws:PrincipalArn" : [
              "arn:aws:iam::${var.account_id}:role/*",
            ]
          }
        }
      },
      {
        Sid       = "Allow attachment of persistent resources",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ],
        Resource = "*",
        Condition = {
          Bool = {
            "kms:GrantIsForAWSResource" : "true"
          }
        }
      }
    ]
  })
}