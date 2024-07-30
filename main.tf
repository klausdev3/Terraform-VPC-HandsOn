resource "aws_instance" "terraform-aws-example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}