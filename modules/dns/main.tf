variable "env" {}
variable "prefix" {}

resource "google_compute_global_address" "sponsoroo-static-ip" {
  name = "sponsoroo-${var.env}"
}

resource "google_dns_record_set" "sponsoroo-record" {
  name = "${var.prefix}sponsoroo.thoughtworks-labs.net."
  type = "A"
  ttl  = 300

  managed_zone = "sponsoroo"
  rrdatas = ["${google_compute_global_address.sponsoroo-static-ip.address}"]
}
