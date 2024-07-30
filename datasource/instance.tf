resource "aws_instance" "datasource" {
  ami = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"

  tags = {
    Name = "datainstance"
  }
}

data "aws_instance" "datasource" {

  filter {
    name   = "tag:Name"
    values = ["datainstance"]
  }
  depends_on = [ "aws_instance.datasource" ]
}
output "data_from_instance" {
  value = data.aws_instance.datasource.public_ip
}
