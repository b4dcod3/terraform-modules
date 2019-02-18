
resource "aws_instance" "b4dcod3-test" {
  ami = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t1.micro"
  tags {
    Name = "b4dcod3"
  }
}