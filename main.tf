variable "domain_name" {
  description = "The name of the domain for our website."
  default = "theorbiter.top"
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.domain_name}/*"]
  }
}

resource "aws_s3_bucket" "theorbiter" {
  bucket = "theorbiter.top"
  acl    = "public-read"

  website {
    index_document = "index.htm"
    error_document = "error.htm"
  }

  policy = data.aws_iam_policy_document.s3_policy.json

}

output "bucket_url" {
  value = aws_s3_bucket.theorbiter.website_endpoint
}