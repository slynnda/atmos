GIT_REPO_DIR := $(shell git rev-parse --show-prefix)
GIT_ORG := therealslynnda
GIT_REL_DIR := $(shell basename -a ${GIT_REPO_DIR})
GIT_REMOTE_ORIGIN := $(shell git config --get remote.origin.url)

DOCKER_IMAGE_OS := archlinux
DOCKER_BASE_IMAGE := ${GIT_ORG}:${DOCKER_IMAGE_OS}.base
DOCKER_IMAGE_TAG := ${GIT_ORG}:${DOCKER_IMAGE_OS}.${GIT_REL_DIR}
DOCKER_HOSTNAME := ${GIT_REL_DIR}
DOCKER_CONTAINER_NAME := ${DOCKER_HOSTNAME}
DOCKER_OS_LANG := en_US.utf-8
DOCKER_OS_LC_ALL := en_US.utf-8

APP_NAME := ${GIT_REL_DIR}
APP_VERSION := 0.11.11
APP_BINARY := "https://releases.hashicorp.com/${APP_NAME}/${APP_VERSION}/${APP_NAME}_${APP_VERSION}_linux_amd64.zip"

build:
	docker build \
	  --build-arg DOCKER_BASE_IMAGE=${DOCKER_BASE_IMAGE} \
	  --build-arg DOCKER_OS_LANG=${DOCKER_OS_LANG} \
	  --build-arg DOCKER_OS_LC_ALL=${DOCKER_OS_LC_ALL} \
	  --build-arg APP_NAME=${APP_NAME} \
	  --build-arg APP_VERSION=${APP_VERSION} \
	  --build-arg APP_BINARY=${APP_BINARY} \
	  --label "docker_image_os=${DOCKER_IMAGE_OS}" \
	  --label "docker_base_image=${DOCKER_BASE_IMAGE}" \
	  --label "docker_os_lang=${DOCKER_OS_LANG}" \
	  --label "docker_os_lc_all=${DOCKER__OS_LC_ALL}" \
	  --label "git_remote_origin=${GIT_REMOTE_ORIGIN}" \
	  --tag ${DOCKER_IMAGE_TAG} \
	  .

run: build
	docker run \
	  --name ${DOCKER_HOSTNAME} \
	  --hostname ${DOCKER_HOSTNAME} \
	  --interactive \
	  --tty \
	  --rm \
	  ${DOCKER_IMAGE_TAG} \
	  bash
