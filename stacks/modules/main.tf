module "test-modules" {
    source = "../../modules/master"

    client_name = "Azamon"
    instance_type = "t2.small"
    master_cidr_block = "172.31.1.0/24"
}