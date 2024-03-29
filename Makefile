-include config.mk

BUILD_DIR  = ./build
SRC_DIR    = ./src

SRCS      := $(shell cd $(SRC_DIR); find . -type f)
BUILDS    := $(SRCS:%=$(BUILD_DIR)/%)

.PHONY: all install clean dstclean

all: $(BUILDS) config.mk

$(BUILD_DIR)/%: $(SRC_DIR)/%
	@mkdir -v -p $(dir $@)
	if test "$(findstring vim, $(@D))"; then \
		perl -pe 's/^\s*(".*)?$$//s;s/^(.*)".*$$/$$1\n/s' <$< >$@; \
	elif test "$(findstring Xresources, $@)"; then \
		perl -pe 's/^\s*(!.*)?$$//s;s/^(.*)!.*$$/$$1\n/s' <$< >$@; \
	else \
		perl -pe 's/^\s*(#.*)?$$//s;s/^(.*)#\s+.*$$/$$1\n/s' <$< >$@; \
	fi

config.mk: config.def.mk
	cp $< $@

install: all
	@install -v -d -m 750 $(PREFIX)
	@for f in $(SRCS); do \
		mkdir -v -p $$(dirname $(PREFIX)/$$f); \
		install -v -m 640 $(BUILD_DIR)/$$f $(PREFIX)/$$f; \
	done
	
clean:
	rm -rf $(BUILD_DIR)

dstclean: clean
	rm -rf $(PREFIX)

test:
	for f in $(SRCS); do \
		echo diff -y --color $(SRC_DIR)/$$f $(BUILD_DIR)/$$f; \
	done

