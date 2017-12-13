env ?= dev

### Infra for API Gateway
INFRA_BUILDPACK_RUN =	ENV=$(env) \
	docker-compose -f docker-compose.yml run --rm buildpack-infra

build:
	docker-compose build

provision:
	$(INFRA_BUILDPACK_RUN) \
		"terraform apply \
		-var-file="vars/$(env).tfvars""

destroy:
	$(INFRA_BUILDPACK_RUN) \
		"terraform destroy \
		-var-file="vars/$(env).tfvars" -force"

shell:
	$(INFRA_BUILDPACK_RUN) "bash"
