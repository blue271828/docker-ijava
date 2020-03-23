# -*- coding: utf-8 -*-

PJTDIR := $(dir $(lastword $(MAKEFILE_LIST)))
UID := $(shell id -u)
GID := $(shell id -g)
DOCKER_IMAGE := ijava


# $1: docker run options
# $2: commands
define run-interactively
	# 100 is jovyan's group id.
	# juvyan is the user of jupyter/base-notebook image.
	@ docker run --rm -it -u $(UID):$(GID) --group-add 100 \
		-w /work -v $(realpath $(PJTDIR)):/work $1 $(DOCKER_IMAGE) $2
endef


.PHONY: build console ijava notebook clean

build:
	@ docker build -t $(DOCKER_IMAGE) .

console:
	@ $(call run-interactively, -u root, bash)

ijava:
	@ $(call run-interactively, -u root, jupyter console --kernel=java)

notebook:
	@ $(call run-interactively, -p 8888:8888 -e NB_UID=$(UID) -e NB_GID=$(GID), jupyter-lab)

clean:
	$(eval CONTAINER_IDS = $(shell docker ps -aq -f ancestor=$(DOCKER_IMAGE)))
	$(eval IMAGE_IDS = $(shell docker images -aq -f reference=$(DOCKER_IMAGE)))
	@ [ -z "$(CONTAINER_IDS)" ] || docker rm $(CONTAINER_IDS)
	@ [ -z "$(IMAGE_IDS)" ] || docker rmi ${IMAGE_IDS}
