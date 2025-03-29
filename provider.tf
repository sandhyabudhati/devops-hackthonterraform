terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.93.0"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.17.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
