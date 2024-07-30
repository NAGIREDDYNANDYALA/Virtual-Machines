data "aws_availability_zones" "available" {
  #above line will fetch all the availability zones which are available in AWS
}

data "aws_ami" "latest-linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????.?-x86_64-gp2"]

  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "datasource" {
  ami               = data.aws_ami.latest-linux.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "datainstance"
  }
}



#To create Security Group dynamically with help of the data source
data "aws_ip_ranges" "us_east_ip_ranges" {
  regions = ["us-east-1","us-east-1"]
  services = [ "ec2" ]
}

resource "aws_security_group" "scgdatasource" {
  name = "security-terraform"
  
  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = data.aws_ip_ranges.us_east_ip_ranges.cidr_blocks
  }

  tags = {
    CreateDate = data.aws_ip_ranges.us_east_ip_ranges.create_date
    SyncToken = data.aws_ip_ranges.us_east_ip_ranges.sync_token
  }
}
