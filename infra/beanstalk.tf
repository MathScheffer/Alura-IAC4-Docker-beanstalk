resource "aws_elastic_beanstalk_application" "aplicacao_beanstalk" {
  name        = var.nome
  description = var.descricao
}

resource "aws_elastic_beanstalk_environment" "ambiente_beanstalk" {
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.aplicacao_beanstalk.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.5 running Docker"

    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      #tipo de maquina que ele vai rodar (ec2, etc)
      name      = "InstanceType"
      value     = var.maquina
    }
    setting {
      namespace = "aws:autoscaling:asg"
      #limite que ele vai escalar (qtd de maquinas)
      name      = "MaxSize"
      value     = var.maxSize
    }
    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      #este valor vem do arquivo role.tf
      value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
    }

}

resource "aws_elastic_beanstalk_application_version" "default" {
  depends_on = [
    aws_elastic_beanstalk_application.aplicacao_beanstalk,
    aws_elastic_beanstalk_environment.ambiente_beanstalk,
    aws_s3_bucket_object.docker
  ]
  name        = var.ambiente
  application = var.nome
  description = var.descricao
  bucket      = aws_s3_bucket.beanstalk_deploy.id
  key         = aws_s3_bucket_object.docker.id
}
