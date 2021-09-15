PREFIX    ?= $(shell pwd)/dotfiles
BUILD_DIR  = ./build
SRC_DIR    = ./src

SRCS      := $(shell cd $(SRC_DIR); find . -type f)
BUILDS    := $(SRCS:%=$(BUILD_DIR)/%)

.PHONY: all install clean dstclean

all: $(BUILDS)

$(BUILDS): 
	mkdir -p $(dir $@)
	sed '/^[[:blank:]]*\(#.*\)\?$$/d' $(subst $(BUILD_DIR),$(SRC_DIR),./$@) >$@

install: all
	install -m 750 -d $(PREFIX)
	@cd $(BUILD_DIR) && \
	for f in $(SRCS); do \
		install -m 640 -D $$f $(PREFIX)/$$f; \
	done
	
clean:
	rm -rf $(BUILD_DIR)

dstclean: clean
	rm -rf $(PREFIX)

