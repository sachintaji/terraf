variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instance."
  type        = string
  default     = ""
}

variable "type" {
  description = "The type of the EC2 instance."
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Name of the SSH key pair."
  type        = string
  default     = ""
}



