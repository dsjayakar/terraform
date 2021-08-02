terraform {
  source = "../../../modules/eks"
}
include {
  path = "${find_in_parent_folders()}"
}

inputs = {
  ################################################################################
  # Environment Definition
  ################################################################################
  region         = "ap-southeast-1"
  profile        = "nsldr-profile"
  ################################################################################
  # EKS vars
  ################################################################################
  eks_cluster_name    = "nsldr-eks-1"
  eks_key_name        = "terraform"
  eks_pre_userdata    = "echo '{ \"log-driver\": \"json-file\", \"log-opts\": { \"max-size\": \"20m\", \"max-file\": \"2\" }}' > /etc/docker/daemon.json && systemctl restart docker"
  eks_ami_id          = "ami-03094f3697947d7fb"
  eks_instance_type   = "t3.medium"
  eks_cluster_version = "1.16"
  cluster_endpoint_public_access = "true"
  cluster_endpoint_private_access = "false"
  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "scheduler"
  ]
  ################################################################################
  # Provided from "terragunt output" in infra module
  ################################################################################
  private_subnets   = [
       "subnet-0e249c49d98e357dd",
       "subnet-0fad1510c0a891d07",
       "subnet-00bb3280fa9b70bcd"
      ]
  public_subnets    = [  "subnet-0a0743dca981656d8",
  "subnet-0a60d67175b886721",
  "subnet-00030c26ae013564f"
  ]
  vpc_id            = "vpc-00264146e9e52fe75"

  ################################################################################
  # Tags
  ################################################################################
  tags = {
      "terraform" = "true"
      "env" = "DR"
  }
}

