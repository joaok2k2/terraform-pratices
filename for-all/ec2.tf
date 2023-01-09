data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "amzn-ami-hvm"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "this" {
  for_each = {
    web = {
      name = "Web server"
      type = "t2.medium"
    }
    ci_cd = {
      name = "CI/CD server"
      type = "t2.micro"
    }
  }
  ami           = data.aws_ami.ubuntu.id
  instance_type = lookup(each.value, "type", null)

  tags = {
    Project = "Pratices Terraform"
    Name    = "${each.key} : ${lookup(each.value, "name", null)}"
    Lesson  = "Foreach, for, Splat"
  }
}