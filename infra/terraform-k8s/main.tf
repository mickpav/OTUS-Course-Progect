terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kubernetes_cluster" "k8s_cluster" {
  name                    = var.cluster_name

  master {
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
    version               = var.k8s_version
    public_ip             = true
  }

  network_id              = var.network_id

  service_account_id      = var.cluster_svc_account_id
  node_service_account_id = var.node_group_svc_account_id

  release_channel         = "RAPID"
  network_policy_provider = "CALICO"
}


resource "yandex_kubernetes_node_group" "k8s-test-group" {
  cluster_id  = yandex_kubernetes_cluster.k8s_cluster.id

  version     = var.k8s_version
  count       = var.node_count
  name        = "worker_node-${count.index}"
  
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat                = true
      subnet_ids         = [var.subnet_id]
    }

    resources {
      memory = var.node_memsize
      cores  = var.node_VCPU_count
    }

    boot_disk {
      type = "network-ssd"
      size = var.node_HDD_size
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }

}