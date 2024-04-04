variable "cloud_id" {
  description = "Cloud"
}
variable "token_id" {
  description = "Token"
}

variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "network_id" {
  description = "Network ID"
}

variable "subnet_id" {
  description = "Subnet ID"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "private_key_path" {
  description = "Path to private key"
}
variable "vm_count" {
  description = "VM instance count"
  type        = number
  default     = 1
}
variable "cluster_name" {
  description = "k8s cluster name"  
}
variable "k8s_version" {
  description = "Kubernetes version"
}
variable "node_group" {
  description = "k8s node group name"
}
variable "node_count" {
  description = "k8s node count"
  type        = number
  default     = 2
}
variable "node_VCPU_count" {
  description = "CPU cores count"
}
variable "node_memsize" {
  description = "node RAM"
}
variable "node_HDD_size" {
  description = "HDD size"
  type = number
  default = 64
}
variable "cluster_svc_account_id" {
  description = "Service account for cluster"
}
variable "node_group_svc_account_id" {
  description = "Service account for node group in cluster"
}