VERSION := $(shell git tag | tail -n1)
PACKAGE := vim-onoff
RELEASE_DIR := build
RELEASE_FILE := $(PACKAGE)-$(VERSION).zip
RELEASE := $(RELEASE_DIR)/$(RELEASE_FILE)

define HELP
Use make <target> where target one of
  clean		to cleanup latest build
  zip		to create a zipball from package
endef


all: help

export HELP
help:
	@echo "$$HELP"


zip: clean
	@mkdir -p $(RELEASE_DIR)
	@echo "creating zipball..."
	@cd ..; \
	zip -r $(PACKAGE)/$(RELEASE) $(PACKAGE) \
	-x "$(PACKAGE)/.*" \
	-x "$(PACKAGE)/*~" \
	-x "$(PACKAGE)/$(RELEASE_DIR)/*" \
	-x "$(PACKAGE)/[Mm]akefile" \
	-x "$(PACKAGE)/doc/tags"
	@chmod 755 $(RELEASE)
	@echo "well done."
	@ls -l $(RELEASE)


clean:
	@if test -f $(RELEASE); then \
		rm $(RELEASE); \
	fi
