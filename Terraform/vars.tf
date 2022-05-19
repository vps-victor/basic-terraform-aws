variable "amis" {
   type = map(string)

   default = {
      "us-east-1" = "ami-xxxxxxxxxxxxxxxxx",
	"us-east-2" = "ami-xxxxxxxxxxxxxxxxx"
   }
}

variable "cdirs_acesso_remoto" {
  type    = list
  default = ["0.0.0.0/0", "0.0.0.0/0"]
}

variable "key_name" {
  default = "terraform-aws"
}

