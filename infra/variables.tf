variable "yc_token" {
  type      = string
  sensitive = true
  default   = null
}

variable "cloud_id" {
  type        = string
  description = "yc config get cloud-id"
}

variable "folder_id" {
  type        = string
  description = "yc config get folder-id"
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_name" {
  type    = string
  default = "lab-vm"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}
