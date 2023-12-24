# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/gpic

FILES=$(wildcard gpic)
DOC_FILES=$(wildcard *.rst)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install: install-scripts install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-scripts:

	install -vDm 755 gpic/gpic "$(BIN_DIR)/gpic"

.PHONY: check install install-doc install-scripts shellcheck
