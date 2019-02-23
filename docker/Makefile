GIT.LOCAL.REL.DIR := $(shell basename -a ${GIT.LOCAL.ROOT.DIR})
GIT.LOCAL.REL.PATH := $(shell git rev-parse --show-prefix)

SUBDIRS := dockerfiles

$(SUBDIRS):
	$(MAKE) -C ${GIT.LOCAL.ROOT.DIR}/${GIT.LOCAL.REL.PATH}$@
	
.PHONY: $(SUBDIRS)
