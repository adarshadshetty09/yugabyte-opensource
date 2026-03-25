###### Global #########
project_id         = "project-7b6bf38a-3ad2-4d2b-bdb"
network_project_id = "default"
region             = "us-east1"
// kms_key_self_link  = "projects/project-7b6bf38a-3ad2-4d2b-bdb/locations/us-central1/keyRings/global-key-ring-en/cryptoKeys/global-kms-key-en"


yugabyte_clusters_project1 = {
  "ybdb" = {
    enable_external_ip                 = false
    enable_shielded_vm                 = true
    machine_name                       = "ybdb"
    instance_count                     = 3
    attached_disks_per_instance        = 3
    enable_yugabyte_disk               = false   ## boot disk
    enable_data1_disk                  = true
    enable_shared_disk                 = true
    enable_wal1_disk                   = true
    enable_boot_disk_snapshot_attach   = true
    enable_yugabyte_disk_snapshot_attach = false
    enable_data1_disk_snapshot_attach  = false
    enable_wal1_disk_snapshot_attach   = false
    enable_shared_disk_snapshot_attach = false
    attached_persistent_disk_sizes     = [10,10,10]
    machine_zone                       = ["us-east1-b", "us-east1-c","us-east1-d"]
    policy_name                        = "yba-snapshot-policy"
    utc_time                           = "00:00"
    retention_days                     = 7
    storage_locations                  = "us"
    enable_boot_disk                   = true
    boot_disk_size                     = 20
    boot_disk_type                     = "pd-balanced"
    instance_with_bootdisk_snapshot    = false
    snapshot_selflink                  = null
    instance_image_selflink            = "projects/project-7b6bf38a-3ad2-4d2b-bdb/global/images/ybdb-opensources-packer-2024-1773670859"
    # kms_key_self_link                  = null
    labels                             = {}
    internal_ip = [
  "10.0.0.10",
  "10.0.0.11",
  "10.0.0.12"
]
    region                             = "us-east1"
    machine_type                       = "n2-standard-2"
    vm_deletion_protection             = false
    network_tags                       = ["yugabyte","allow-ssh"]
    network                            = "vpc-yugabyte-terraform-cluster"
    subnetwork                         = "yugabyte-sub-1"
    service_account = {
      email  = "yugabyte@project-7b6bf38a-3ad2-4d2b-bdb.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {}
    local_disk_count = 0
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}




yugabyte_clusters_project1_monitor = {
  "monitor" = {
    enable_external_ip                 = false
    enable_shielded_vm                 = true
    machine_name                       = "monitor"
    instance_count                     = 1
    attached_disks_per_instance        = 1
    enable_yugabyte_disk               = false   ## boot disk
    enable_data1_disk                  = false
    enable_shared_disk                 = false
    enable_wal1_disk                   = false
    enable_boot_disk_snapshot_attach   = true
    enable_yugabyte_disk_snapshot_attach = false
    enable_data1_disk_snapshot_attach  = false
    enable_wal1_disk_snapshot_attach   = false
    enable_shared_disk_snapshot_attach = false
    attached_persistent_disk_sizes     = []
    machine_zone                       = ["us-east1-b", "us-east1-c","us-east1-d"]
    policy_name                        = "monitor-snapshot-policy-monitor"
    utc_time                           = "00:00"
    retention_days                     = 7
    storage_locations                  = "us"
    enable_boot_disk                   = true
    boot_disk_size                     = 50
    boot_disk_type                     = "pd-balanced"
    instance_with_bootdisk_snapshot    = false
    snapshot_selflink                  = null
    instance_image_selflink            = "projects/rhel-cloud/global/images/rhel-10-0-eus-v20260310"
    # kms_key_self_link                  = null
    labels                             = {}
    internal_ip = [
  "10.0.0.14",
]
    region                             = "us-east1"
    machine_type                       = "n2-standard-2"
    vm_deletion_protection             = false
    network_tags                       = ["yugabyte","allow-ssh"]
    network                            = "vpc-yugabyte-terraform-cluster"
    subnetwork                         = "yugabyte-sub-1"
    service_account = {
      email  = "yugabyte@project-7b6bf38a-3ad2-4d2b-bdb.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {}
    local_disk_count = 0
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}



yugabyte_clusters_project1_config = {
  "ansible-master-node" = {
    enable_external_ip                 = false
    enable_shielded_vm                 = true
    machine_name                       = "ansible-master-node"
    instance_count                     = 1
    attached_disks_per_instance        = 1
    enable_yugabyte_disk               = false   ## boot disk
    enable_data1_disk                  = false
    enable_shared_disk                 = false
    enable_wal1_disk                   = false
    enable_boot_disk_snapshot_attach   = true
    enable_yugabyte_disk_snapshot_attach = false
    enable_data1_disk_snapshot_attach  = false
    enable_wal1_disk_snapshot_attach   = false
    enable_shared_disk_snapshot_attach = false
    attached_persistent_disk_sizes     = []
    machine_zone                       = ["us-east1-b", "us-east1-c","us-east1-d"]
    policy_name                        = "ansible-snapshot-policy-monitor"
    utc_time                           = "00:00"
    retention_days                     = 7
    storage_locations                  = "us"
    enable_boot_disk                   = true
    boot_disk_size                     = 50
    boot_disk_type                     = "pd-balanced"
    instance_with_bootdisk_snapshot    = false
    snapshot_selflink                  = null
    instance_image_selflink            = "projects/rhel-cloud/global/images/rhel-10-0-eus-v20260310"
    # kms_key_self_link                  = null
    labels                             = {}
    internal_ip = [
  "10.0.0.15",
]
    region                             = "us-east1"
    machine_type                       = "n2-standard-2"
    vm_deletion_protection             = false
    network_tags                       = ["yugabyte","allow-ssh"]
    network                            = "vpc-yugabyte-terraform-cluster"
    subnetwork                         = "yugabyte-sub-1"
    service_account = {
      email  = "yugabyte@project-7b6bf38a-3ad2-4d2b-bdb.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {}
    local_disk_count = 0
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}


