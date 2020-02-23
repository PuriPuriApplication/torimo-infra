data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }
}

## SSH Key
resource "aws_key_pair" "bastion" {
  key_name   = var.prefix
  public_key = var.torimo-pub

  tags = {
    Name = format("%s-bastion", var.prefix)
  }
}

resource "aws_instance" "bastion" {
  ami               = data.aws_ami.amazon_linux.id
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.bastion.id
  availability_zone = "ap-northeast-1a"
  security_groups   = [aws_security_group.bastion-sg.id]
  subnet_id         = aws_subnet.public.0.id
  user_data         = templatefile("${path.module}/template/user_data.tmpl", { port = var.ssh_port })

  root_block_device {
    volume_type = "gp2"
    volume_size = 32
  }

  tags = {
    Name = format("%s-bastion", var.prefix)
  }

  lifecycle {
    ignore_changes = [
      ami,
      security_groups,
    ]
  }
}

resource "aws_eip" "bastion_eip" {
  vpc = true
}

resource "aws_eip_association" "monitor-svr_eip_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion_eip.id
}
