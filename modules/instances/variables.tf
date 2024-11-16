variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "qwiklabs-gcp-03-dfe3a8005674"
}

variable "region" {
  description = "The region of the project in which to provision resources."
  type        = string
  default     = "us-east4"
}

variable "zone" {
  description = "The zone of the project in which to provision resources."
  type        = string
  default     = "us-east4-a"
}