SCHEMA := IGSN_Core_by_GFZ_DataServices.xsd
DOCS_DIR := docs
DIAGRAM_DIR := $(DOCS_DIR)/diagrams
DOCS_INDEX := $(DOCS_DIR)/index.html

ARCHIVE_DIR := .archive
XSDVI_DIR := xsdvi
XS3P_DIR := xsl
CURL_FLAGS := -fsSL --retry 3 --retry-delay 2 --retry-all-errors

XERCES_VERSION := 2.12.2
XSDVI_VERSION := 1.0
XS3P_VERSION := 3.0

XERCES_SHA256 := 1ad48949b2c7f0df91668f058d6ec773871adb5527b0b5c73dc2160ab5d162e2
XSDVI_SHA256 := b763fa80a5f8b621ad1f3d5ee19b1ca9dbcde74a7a6d788fe45ee0be78f7cc7f
XS3P_SHA256 := 985ed0d5673e71307f19d4a8851ee1acf8b0cfb708bcb33bd2bc408f26d72fad

XERCES_URL := https://archive.apache.org/dist/xerces/j/binaries/Xerces-J-bin.$(XERCES_VERSION).tar.gz
XSDVI_URL := https://github.com/metanorma/xsdvi/releases/download/v$(XSDVI_VERSION)/xsdvi-$(XSDVI_VERSION).jar
XS3P_URL := https://github.com/metanorma/xs3p/archive/refs/tags/v$(XS3P_VERSION).tar.gz

XERCES_ARCHIVE := $(ARCHIVE_DIR)/Xerces-J-bin.$(XERCES_VERSION).tar.gz
XSDVI_ARCHIVE := $(ARCHIVE_DIR)/xsdvi-$(XSDVI_VERSION).jar
XS3P_ARCHIVE := $(ARCHIVE_DIR)/xs3p-v$(XS3P_VERSION).tar.gz
XERCES_EXTRACTED_DIR := $(ARCHIVE_DIR)/xerces-$(subst .,_,$(XERCES_VERSION))

XERCES_PATH := $(XSDVI_DIR)/xercesImpl.jar
XSDVI_PATH := $(XSDVI_DIR)/xsdvi.jar
XS3P_PATH := $(XS3P_DIR)/xs3p.xsl

.PHONY: all docs setup clean distclean

all: docs

docs: $(DOCS_INDEX)

setup: $(XSDVI_PATH) $(XERCES_PATH) $(XS3P_PATH)

$(DOCS_INDEX): $(SCHEMA) $(XSDVI_PATH) $(XERCES_PATH) $(XS3P_PATH)
	mkdir -p $(DIAGRAM_DIR)
	java -jar $(XSDVI_PATH) $(SCHEMA) -rootNodeName all -oneNodeOnly -outputPath $(DIAGRAM_DIR)
	xsltproc --nonet --param title "'IGSN Core Schema documentation'" --output $@ $(XS3P_PATH) $(SCHEMA)
	touch $(DOCS_DIR)/.nojekyll

$(XSDVI_PATH): $(XSDVI_ARCHIVE)
	mkdir -p $(XSDVI_DIR)
	cp $< $@

$(XERCES_PATH): $(XERCES_ARCHIVE)
	mkdir -p $(XSDVI_DIR)
	tar -xzf $< -C $(ARCHIVE_DIR)
	cp $(XERCES_EXTRACTED_DIR)/xercesImpl.jar $@

$(XS3P_PATH): $(XS3P_ARCHIVE)
	mkdir -p $(XS3P_DIR)
	tar -xzf $< -C $(ARCHIVE_DIR)
	cp -R $(ARCHIVE_DIR)/xs3p-$(XS3P_VERSION)/xsl/. $(XS3P_DIR)/

$(ARCHIVE_DIR):
	mkdir -p $@

$(XSDVI_ARCHIVE): | $(ARCHIVE_DIR)
	curl $(CURL_FLAGS) -o $@.tmp $(XSDVI_URL)
	printf '%s  %s\n' '$(XSDVI_SHA256)' '$@.tmp' | sha256sum --check --status
	mv $@.tmp $@

$(XERCES_ARCHIVE): | $(ARCHIVE_DIR)
	curl $(CURL_FLAGS) -o $@.tmp $(XERCES_URL)
	printf '%s  %s\n' '$(XERCES_SHA256)' '$@.tmp' | sha256sum --check --status
	mv $@.tmp $@

$(XS3P_ARCHIVE): | $(ARCHIVE_DIR)
	curl $(CURL_FLAGS) -o $@.tmp $(XS3P_URL)
	printf '%s  %s\n' '$(XS3P_SHA256)' '$@.tmp' | sha256sum --check --status
	mv $@.tmp $@

clean:
	rm -rf $(DOCS_DIR)

distclean: clean
	rm -rf $(ARCHIVE_DIR) $(XSDVI_DIR) $(XS3P_DIR)
