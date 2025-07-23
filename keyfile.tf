resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file("#map your keyfile or pem file here")

    tags = {
      Name = "AWS SSH Key"
    }
  
}