variable "name" {
  type        = string
  description = "The name of the role."
}

variable "policy" {
  type        = string
  description = "The policy document. This is a JSON formatted string."
}

variable "path" {
  default     = "/"
  type        = string
  description = "Path in which to create the role and the policy."
}

variable "description" {
  default     = ""
  type        = string
  description = "The description of the role and the policy."
}

variable "max_session_duration" {
  default     = "3600"
  type        = string
  description = "The maximum session duration (in seconds) that you want to set for the specified role."
}

variable "force_detach_policies" {
  default     = false
  type        = bool
  description = "Specifies to force detaching any policies the role has before destroying it."
}

variable "create_instance_profile" {
  type        = bool
  default     = false
  description = "Specify whether to create instance profile for the role."
}

variable "identifiers" {
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
  description = "Specify list of trust identifiers"
}
