provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  # ... (instance configuration)

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker-compose",
      "docker-compose -f /home/ubuntu/docker-compose.yml up -d"
    ]
  }
}
