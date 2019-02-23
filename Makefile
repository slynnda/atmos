export GIT.REPO.OWNER.ALIAS ?= GIT_REPO_OWNER_ALIAS
export GIT.REPO.OWNER.NAME ?= GIT_REPO_OWNER_NAME
export GIT.REPO.OWNER.EMAIL := GIT_REPO_OWNER_EMAIL
export GIT.REMOTE.ORIGIN.URL := $(shell git config --get remote.origin.url)
export GIT.LOCAL.ROOT.DIR := $(shell git rev-parse --show-toplevel)
export GIT.LOCAL.REL.PATH := ${GIT.LOCAL.ROOT.DIR}

SUBDIRS := docker

$(SUBDIRS):
	$(info GIT.LOCAL.ROOT.DIR := ${GIT.LOCAL.ROOT.DIR})
	$(info GIT.LOCAL.REL.PATH := ${GIT.LOCAL.REL.PATH})
	$(MAKE) -C ${GIT.LOCAL.REL.PATH}/$@

.PHONY: $(SUBDIRS)
