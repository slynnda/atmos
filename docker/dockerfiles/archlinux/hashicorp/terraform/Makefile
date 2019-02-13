DIR := $(shell git rev-parse --show-toplevel)
ORG := therealslynnda
NAME := $(shell basename -a ${DIR})

DOCKER_BASE_IMAGE := archlinux/base
DOCKER_HOSTNAME := ${NAME}
DOCKER_OS_LANG := en_US.utf-8
DOCKER_OS_LC_ALL := en_US.utf-8

TERRAFORM_VERSION := 0.11.11
TERRAFORM_BINARY := "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

build:
	docker build \
	  --build-arg DOCKER_BASE_IMAGE=${DOCKER_BASE_IMAGE} \
	  --build-arg DOCKER_OS_LANG=${DOCKER_OS_LANG} \
	  --build-arg DOCKER_OS_LC_ALL=${DOCKER_OS_LC_ALL} \
	  --build-arg TERRAFORM_VERSION=${TERRAFORM_VERSION} \
	  --build-arg TERRAFORM_BINARY=${TERRAFORM_BINARY} \
	  --build-arg PROJECT_NAME=${NAME} \
	  --tag ${ORG}:${NAME} \
	  .

run:
	docker run \
	  -e "CONTAINER_EXTERNAL_NAME=${NAME}" \
	  --name ${NAME} \
	  --hostname ${DOCKER_HOSTNAME} \
	  --interactive \
	  --tty \
	  --rm \
	  ${ORG}:${NAME} \
	  bash
