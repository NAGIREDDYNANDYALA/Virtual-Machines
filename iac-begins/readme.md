**To create multiple instnaces with list variables**
resource "aws_instance" "terraform" {
  count         = length(var.instance_names)
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  key_name      = "aws"

  tags = {
    Name = "${var.instance_names[count.index]}"
  }
}
variable "instance_names" {
  description = "list of names for the instances"
  type        = list(string)
  default     = ["Amazon_Prime", "Aha", "Netflix"]
}
=============================================================
**Map variables**
resource "aws_instance" "terraform" {
  count         = length(var.instance_names)
  ami           = lookup(var.AMI, var.aws_regions)
  instance_type = "t2.micro"
  key_name      = "aws"

  tags = {
    Name = "${var.instance_names[count.index]}"
  }
}
# aws regions
variable "aws_regions" {
  default = "us-east-1"
}
# variables for AMI's
variable "AMI" {
  type = map
  default = {
    us-east-1      = "ami-0b0ea68c435eb488d"
    us-east-2      = "ami-0b76100074ce446d4"
    ap-southeast-1 = "ami-0025119d1d957b7aa"
    ap-southeast-2 = "ami-0672b175139a0f8f4"
  }
}
----------------------------------------------
