variable "config_info" {
  type = object({
    config_path    = string
    config_context = string
  })
}
