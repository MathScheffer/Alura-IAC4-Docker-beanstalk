module "Producao" {
    source = "../../infra"
    maxSize = 5
    nome = "prod"
    descricao = "aplicacao-de-prod"
    maquina = "t2.micro"
    regiao = "us-east-1"
    ambiente = "ambiente-prod"
}