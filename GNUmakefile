# vim: ts=8 noet sw=2 sts=2

RST2HTML ?=	$(call first_in_path,rst2html.py rst2html)

htmlfiles = README.html REST.html overview.html

html: $(htmlfiles)

%.html: %.rest
	$(RST2HTML) $< $@

define first_in_path
  $(firstword $(wildcard \
    $(foreach p,$(1),$(addsuffix /$(p),$(subst :, ,$(PATH)))) \
  ))
endef

MAKEFLAGS =	--no-print-directory \
		--no-builtin-rules \
		--no-builtin-variables

.PHONY: html
