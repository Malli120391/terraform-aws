subnet_cidr_block = "10.0.40.0/24"
vpc_cidr_block = "10.0.20.0/24"
environment = "deployment"
cidr_blocks = [
    {cidr_block = "10.0.0.0/16", name = "development-vpc"},
    {cidr_block = "10.0.20.0/24", name = "dev_sebnet-1"}
    ]