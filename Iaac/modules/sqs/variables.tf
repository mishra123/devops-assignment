variable "content_based_deduplication" {
  type        = bool
  default     = false
  description = "Enables content-based deduplication for FIFO queues"
}

variable "create" {
  type        = bool
  default     = true
  description = "Whether to create SQS queue"
}
variable "deduplication_scope" {
  type        = string
  default     = ""
  description = "Specifies whether message deduplication occurs at the message group or queue level"
}
variable "delay_seconds" {
  type        = number
  default     = 0
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)"
}
variable "fifo_queue" {
  type        = bool
  default     = false
  description = "Boolean designating a FIFO queue"
}
variable "fifo_throughput_limit" {
  type        = string
  default     = ""
  description = "Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group	"
}
variable "kms_data_key_reuse_period_seconds" {
  type        = number
  default     = 300
}

variable "kms_master_key_id" {
  type        = string
  default     = ""
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK"
}

variable "message_retention_seconds" {
  type        = number
  default     = 345600
  description = "The number of seconds Amazon SQS retains a message"
}
variable "max_message_size" {
  type        = number
  default     = 262144
  description = "How many bytes a message can contain"
}
variable "name"{
    type       = string
    default    = ""
    description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
}

variable "name_prefix"{
    type       = string
    default    = ""
    description = "A unique name beginning with the specified prefix."
}

variable "policy"{
    type       = string
    default    = ""
    description = "The JSON policy for the SQS queue"
}
variable "tags"{
    type       = map(string)
    default    = {}
    description = "A mapping of tags to assign to all resources"
}
variable "visibility_timeout_seconds"{
    type       = number
    default    = 30
    description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
}