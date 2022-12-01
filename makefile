source-dirs:=$(wildcard */.)

install: $(source-dirs)
$(source-dirs):
	$(MAKE) -C `pwd`/$@

.PHONY: install $(source-dirs)
