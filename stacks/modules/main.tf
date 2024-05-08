
module "sg" {
    source = "../../modules/global"
    
    client_name = "Azamon"
}

module "master-module" {
    source = "../../modules/master"

    client_name = "Azamon"
    instance_type = "t2.small"
    master_cidr_block = "172.31.96.0/20"
    master_sg_id = module.sg.master_sg_id
    slave_sg_id = module.sg.slave_sg_id
}