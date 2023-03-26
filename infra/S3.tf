resource "aws_s3_bucket" "beanstalk_deploy" {
  bucket = "matty-us-east-1-123456789-beanstalk-deploy-${var.nome}-deploys"
}

resource "aws_s3_bucket_object" "docker" {
  depends_on = [
    aws_s3_bucket.beanstalk_deploy
  ]
  bucket = "matty-us-east-1-123456789-beanstalk-deploy-${var.nome}-deploys"
  key    = "prod.zip"
  source = "prod.zip"
  etag = filemd5("prod.zip")
}