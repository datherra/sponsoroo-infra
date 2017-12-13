# Sponsoroo Cloud Resources Provisioning (IaC)

This repo contains infrastructure as code (IaC) for Sponsoroo cloud resources dependencies like:

  - DNS record on GCP DNS under **sponsoroo.thoughtworks-labs.net** zone
  - GCP static public IP address

## Provisioning

- To provision the infra, use:
```
make build env=dev
make provision env=dev
```

- where `env` is expected to be: `preprod`, `dev`, `stg` or `prod`

## Cleaning up

- To destroy everything:
```
make destroy env=dev
```
PS: Make sure you first delete your kubernetes deployments that might be using resources destroyed by this repo, like the static IP address, otherwise the destroy steps may not succeed.

## Terraform

This repo uses Terraform to provision infrastructure.

To make it easier to share the code and state of Terraform runs, the `entrypoint.sh` script takes care of setting up a [remote backend](https://www.terraform.io/docs/backends/index.html) on GCS before running `terraform`.

## BuildPack Container

To make this code execution easier in different computers, including CI, all dependencies are packed on a buildpack container from where terraform is then executed.

To better troubleshoot the code when needed, use `make shell` to start an interactive session on the buildpack container.
