.PHONY: build
build: 
	packer build -var "tag=`cat VERSION`" packer.json

.PHONY: docker_tag
docker_tag:
	echo "docker tagging with `cat VERSION`"
	docker tag reaandrew/devenv_base:latest reaandrew/devenv_base:latest
	docker tag reaandrew/devenv_base reaandrew/devenv_base:`cat VERSION`

.PHONY: docker_push
docker_push:
	docker push reaandrew/devenv_base:latest
	docker push reaandrew/devenv_base:`cat VERSION`

