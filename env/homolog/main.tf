module "Homolog" {
    source = "../../infra"
    maxSize = 3
    nome = "homolog"
    descricao = "aplicacao-de-holog"
    regiao = "us-east-1"
    maquina = "t2.micro"
    ambiente = "ambiente-holog"
}