
module "sg" {
    source = "../../modules/global"
    
    client_name = "client-1"
}

module "master-module" {
    source = "../../modules/master"

    client_name = "client-1"
    instance_type = "t2.small"
    master_cidr_block = "172.31.160.0/20"
    master_sg_id = module.sg.master_sg_id
    slave_sg_id = module.sg.slave_sg_id
}

module "slave-module" {
    source = "../../modules/slave"

    client_name = "client-1-rer"
    instance_type = "t2.micro"
    slave_cidr_block = "172.31.96.0/20"
    master_sg_id = module.sg.master_sg_id
    slave_sg_id = module.sg.slave_sg_id
    desired_capacity = 4
    min_size = 4
    max_size = 4
}