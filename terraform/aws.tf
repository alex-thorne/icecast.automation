resource "aws_instance" "icecast" {
  provider = aws.aws
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu Server 20.04 LTS
  instance_type = "t2.micro"
  key_name      = var.aws_key_name

  tags = {
    Name = "icecast-server"
  }

  count = var.provider == "aws" ? 1 : 0
}

resource "aws_instance" "nginx" {
  provider = aws.aws
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu Server 20.04 LTS
  instance_type = "t2.micro"
  key_name      = var.aws_key_name

  tags = {
    Name = "nginx-server"
  }

  count = var.provider == "aws" ? 1 : 0
}

output "icecast_ip" {
  value = aws_instance.icecast[0].public_ip
  count = var.provider == "aws" ? 1 : 0
}

output "nginx_ip" {
  value = aws_instance.nginx[0].public_ip
  count = var.provider == "aws" ? 1 : 0
}
