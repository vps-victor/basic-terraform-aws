terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "4.13.0"
        }
    }
}

provider "aws" {
    alias  = "xx-xxxx-x"
    region = "xx-xxx-x"
}

provider "aws" {
    alias  = "xx-xxx-x"
    region = "xx-xxx-x"
}

resource "aws_instance" "dev" {
    count           = 2
    ami             = "ami-xxxxxxxxxxxxxxxxx"
    instance_type   = "xx.size"
    key_name        = "terraform_aws"
    
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group_rule.ssh-access.id}"]
}

resource "aws_instance" "dev3" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "xx.size"
  key_name      = "terraform-aws"
  
  tags = {
    Name = "dev3"
  }

  vpc_security_group_ids = ["${aws_security_group_rule.ssh-access.id}"]
  depends_on		 = [aws_s3_bucket.dev3]
}


resource "aws_instance" "dev4" {
  provider 	    = aws.xx-xxx-x
  ami           = "${var.amis["xx-xxx-x"]}"
  instance_type = "xx.size"
  key_name      = "${var.key_name}"
  
  tags = {
    Name = "dev4"
  }

  vpc_security_group_ids = ["${aws_security_group_rule.ssh-access-xx-xxx-x.id}"]
  depends_on 		 = [aws_dynamodb_table.dynamodb-homologation]
}

resource "aws_instance" "dev5" {
  provider 	    = aws.xx-xxx-x
  ami           = "${var.amis["xx-xxx-x"]}"
  instance_type = "xx.size"
  key_name      = "${var.key_name}"
  
  tags = {
    Name = "dev7"
  }

  vpc_security_group_ids = ["${aws_security_group_rule.ssh-access-xx-xxx-x.id}"]
}


resource "aws_s3_bucket" "dev3" {
  bucket = "s3-dev3"
}

resource "aws_s3_bucket_acl" "private" {
  bucket = aws_s3_bucket.dev3.id
  acl    = "private"
}

resource "aws_dynamodb_table" "dynamodb-homologation" {
  provider       = aws.xx-xxx-x
  name           = "dbExample"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "exampleTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "exampleTitle"
    type = "S"
  }
}