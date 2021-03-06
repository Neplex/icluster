# SHELL
SHELL = /bin/sh

# COMMAND
CHECK = R CMD check
BUILD = R CMD build
INSTALL = R CMD INSTALL
MEMORY = R -d valgrind
R = Rscript

# Directory
SRC_DIR = src/
DOC_DIR = man/
TESTS_DIR = tests/

# File to clean
TRASH = $(SRC_DIR)*.so $(SRC_DIR)*.o *.tar.gz $(DOC_DIR)

# == MAKE COMMAND ==============================================================

all: build

help:
	@echo "Available:"
	@echo "- config"
	@echo "- check"
	@echo "- build"
	@echo "- install"
	@echo "- test"
	@echo "- doc"
	@echo "- clean"

config: clean
	autoconf
	./configure

check: doc
	$(R) -e devtools::check\(\)

build: doc
	$(R) -e devtools::build\(\)

install: doc
	$(R) -e devtools::install\(\)

test: doc
	$(R) -e devtools::test\(\)

doc: config
	$(R) -e devtools::document\(\)

.PHONY: clean
clean:
	rm -rf $(TRASH)
	./cleanup
