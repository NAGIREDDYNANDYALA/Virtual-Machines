variable "instance_names" {
  description = "list of names for the instances"
  type        = list(string)
  default     = ["Amazon_Prime", "Aha", "Netflix"]
}