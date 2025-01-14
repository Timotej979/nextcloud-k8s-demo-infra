module "ansible_configuration" {
  source = "../../../modules/ansible"

  # K3s variables
  k3s_version = "v1.28.15+k3s1"

  # CIDR blocks
  cluster_cidr       = var.cluster_cidr
  public_subnet_cidr = data.terraform_remote_state.hetzner_infrastructure.outputs.public_subnet_cidr

  # IP addresses
  control_plane_ip   = data.terraform_remote_state.hetzner_infrastructure.outputs.control_plane_ip
  worker_ips         = data.terraform_remote_state.hetzner_infrastructure.outputs.worker_ips
  db_internal_ip     = data.terraform_remote_state.hetzner_infrastructure.outputs.db_internal_ip
  redis_internal_ip  = data.terraform_remote_state.hetzner_infrastructure.outputs.redis_internal_ip

  # SSH key variables
  # Control plane
  control_plane_ssh_key_name     = data.terraform_remote_state.hetzner_infrastructure.outputs.control_plane_ssh_key_name
  control_plane_ssh_key_path     = data.terraform_remote_state.hetzner_infrastructure.outputs.control_plane_ssh_key_path
  # Worker
  worker_ssh_key_name          = data.terraform_remote_state.hetzner_infrastructure.outputs.worker_ssh_key_name
  worker_ssh_key_path          = data.terraform_remote_state.hetzner_infrastructure.outputs.worker_ssh_key_path
  # Database
  db_ssh_key_name              = data.terraform_remote_state.hetzner_infrastructure.outputs.db_ssh_key_name
  db_ssh_key_path              = data.terraform_remote_state.hetzner_infrastructure.outputs.db_ssh_key_path
  db_server_root_password             = data.terraform_remote_state.hetzner_infrastructure.outputs.db_server_root_password
  # Redis
  redis_ssh_key_name           = data.terraform_remote_state.hetzner_infrastructure.outputs.redis_ssh_key_name
  redis_ssh_key_path           = data.terraform_remote_state.hetzner_infrastructure.outputs.redis_ssh_key_path
  redis_server_root_password          = data.terraform_remote_state.hetzner_infrastructure.outputs.redis_server_root_password
}