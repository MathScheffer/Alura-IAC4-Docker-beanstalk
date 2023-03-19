resource "aws_s3_bucket" "beanstalk_deploy" {
  bucket = "matty-us-east-1-123456789-beanstalk-deploy-${var.nome}-deploys"
}

resource "aws_s3_bucket_object" "docker" {
  depends_on = [
    aws_s3_bucket.beanstalk_deploy
  ]
  bucket = "matty-us-east-1-123456789-beanstalk-deploy-${var.nome}-deploys"
  key    = "producao.zip"
  source = "producao.zip"
  etag = filemd5("producao.zip")
}