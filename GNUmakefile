# vim: ts=8 noet sw=2 sts=2

SHELL =		/bin/sh
RST2HTML ?=	$(SHELL) tools/rst2html

export SHELL

htmlfiles = README.html \
	    REST.html \
	    feedback.html \
	    http-status.html \
	    overview.html \
	    resources.html \
	    resources-admin.html \
	    resources-user.html \
	    server.html

html: $(htmlfiles)

%.html: %.rest
	$(RST2HTML) $< $@

MAKEFLAGS =	--no-print-directory \
		--no-builtin-rules \
		--no-builtin-variables

.PHONY: html
