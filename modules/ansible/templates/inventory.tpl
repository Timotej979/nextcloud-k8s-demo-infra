[control_plane]
${control_plane_ip} ansible_host=${control_plane_ip} ansible_user=root ansible_ssh_private_key_file=${control_plane_ssh_key_path} ansible_ssh_common_args='-o ForwardAgent=yes -o StrictHostKeyChecking=no'

[workers]
%{ for ip in worker_ips }
${ip} ansible_host=${ip} ansible_user=root ansible_ssh_private_key_file=${worker_ssh_key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'
%{ endfor }

[db_server]
${db_ip} ansible_host=${db_ip} ansible_user=root ansible_ssh_private_key_file=${db_ssh_key_path} ansible_ssh_common_args='-o ProxyJump=control_plane -o StrictHostKeyChecking=no'

[redis_server]
${redis_ip} ansible_host=${redis_ip} ansible_user=root ansible_ssh_private_key_file=${redis_ssh_key_path} ansible_ssh_common_args='-o ProxyJump=control_plane -o StrictHostKeyChecking=no'