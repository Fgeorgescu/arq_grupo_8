module "test-modules" {
    source = "../../modules/master"

    instance_name = "testname"
    instance_type = "t2.small"
    master_cidr_block = "10.0.1.0/24"
}