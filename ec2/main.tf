data "aws_ami" "amazon_linux_2_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "app_server" {
  count = var.number_of_app_instances

  ami                    = data.aws_ami.amazon_linux_2_ami.id
  instance_type          = "t2.micro"
  key_name               = var.deployer_key_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = var.security_groups
  user_data              = templatefile("${path.module}/cloud-init.sh.tpl", {
    HostName = "${var.environment}-app-${format("%02d", count.index + 1)}"
  })

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name = "${var.environment}-app-${format("%02d", count.index + 1)}"
  }
}
