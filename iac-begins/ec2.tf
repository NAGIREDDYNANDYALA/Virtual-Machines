/*resource "aws_instance" "terraform" {
  count         = length(var.instance_names)
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  key_name      = "aws"

  tags = {
    Name = "${var.instance_names[count.index]}"
  }
}*/