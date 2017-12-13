terraform {
  backend "gcs" {
    bucket = "terraform-sponsoroo"
    # path = "provided at runtime"
  }
}

variable "env" {}
variable "dns_prefix" {}

provider "google" {
  version = "~> 1.0"
  region  = "australia-southeast1"
  project = "sponsoroo-182723" 
}

module "dns" {
  /*
  trailing dot required on dns_prefix var because of prod case, where we want
  sponsoroo.thoughtworks-labs.net as result instead of .sponsoroo.thoughtworks-labs.net
  */
  source = "modules/dns"
  prefix = "${var.dns_prefix}"
  env = "${var.env}"
}
