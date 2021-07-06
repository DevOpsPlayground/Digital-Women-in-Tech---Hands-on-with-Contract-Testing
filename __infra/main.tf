locals {
    stack = "dpg-wit2"
    ssh_key_name = "dpgwit2key"
}
module "vpc" {
    source = "git::ssh://git@github.ecs-digital.co.uk/ECSD/playground-frame.git?ref=v0.8.1-beta//modules/vpc"
    name = "${local.stack}"
}

module "animal" {
    source = "git::ssh://git@github.ecs-digital.co.uk/ECSD/playground-frame.git?ref=v0.8.1-beta//modules/animal_names"
    count = "${var.count}"
}

resource "tls_private_key" "ssh_keypair" {
    count     = 1
    algorithm = "RSA"
}

resource "aws_key_pair" "ssh_key" {
    key_name   = "${local.ssh_key_name}"
    public_key = "${tls_private_key.ssh_keypair.public_key_openssh}"

    provisioner "local-exec" {
        command = "echo \"${tls_private_key.ssh_keypair.private_key_pem}\" > ${local.ssh_key_name}.pem && chmod 400 ${local.ssh_key_name}.pem"
    }

    provisioner "local-exec" {
        when    = "destroy"
        command = "rm -f ${local.ssh_key_name}.pem"
    }
}

module "windows" {
    source = "git::ssh://git@github.ecs-digital.co.uk/ECSD/playground-frame.git?ref=v2//modules/windows_instance"

    count = "${var.count}"
    rdp_user = "playground"
    rdp_password = "WhyDo3s3very1LOVEG0T"
    custom_install_scripts = "${data.template_file.extra_install_scripts.rendered}"
    animal_names = "${module.animal.names}"
    vpc_id = "${module.vpc.vpc_id}"
    subnet_ids                = "${module.vpc.public_subnets}"
    default_security_group_id = "${module.vpc.default_security_group_id}"
    instance_type = "t2.large"
    stack_name = "${local.stack}"
    ssh_key_name = "${local.ssh_key_name}"
}

data "template_file" "extra_install_scripts" {
    template = "${file("template/install_scripts.ps1.tpl")}"
}