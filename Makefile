include config.mk

BUILD_DIR  = ./build
SRC_DIR    = ./src

SRCS      := $(shell cd $(SRC_DIR); find . -type f)
BUILDS    := $(SRCS:%=$(BUILD_DIR)/%)

.PHONY: all install clean dstclean

all: $(BUILDS) config.mk

$(BUILD_DIR)/%: $(SRC_DIR)/%
	@mkdir -v -p $(dir $@)
	if test "$(findstring vimrc, $@)"; then \
		perl -ne 'while(<>){s/^(".*|\s*)$$//s;s/\s*".*$$/\n/s;print}' <$< >$@; \
	elif test "$(findstring Xresources, $@)"; then \
		perl -ne 'while(<>){s/^(!.*|\s*)$$//s;s/\s*!.*$$/\n/s;print}' <$< >$@; \
	else \
		sed '/^[[:blank:]]*\(#.*\)\?$$/d' $< >$@; fi

config.mk: config.def.mk
	cp $< $@

install: all
	@install -v -m 750 -d $(PREFIX)
	for f in $(SRCS); do \
		install -v -m 640 -D $(BUILD_DIR)/$$f $(PREFIX)/$$f; \
	done
	
clean:
	rm -rf $(BUILD_DIR)

dstclean: clean
	rm -rf $(PREFIX)

