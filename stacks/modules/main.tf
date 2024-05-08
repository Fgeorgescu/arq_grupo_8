module "test-modules" {
    source = "../../modules/master"

    instance_name = "testname"
    instance_type = "t2.small"
}