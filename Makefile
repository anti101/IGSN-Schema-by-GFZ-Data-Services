SCHEMA := IGSN_Core_by_GFZ_DataServices.xsd
DOCS_DIR := docs
DIAGRAM_DIR := $(DOCS_DIR)/diagrams
DOCS_INDEX := $(DOCS_DIR)/index.html

ARCHIVE_DIR := .archive
XSDVI_DIR := xsdvi
XS3P_DIR := xsl

XERCES_VERSION := 2.12.2
XSDVI_VERSION := 1.0
XS3P_VERSION := 3.0

XERCES_URL := https://downloads.apache.org/xerces/j/binaries/Xerces-J-bin.$(XERCES_VERSION).tar.gz
XSDVI_URL := https://github.com/metanorma/xsdvi/releases/download/v$(XSDVI_VERSION)/xsdvi-$(XSDVI_VERSION).jar
XS3P_URL := https://github.com/metanorma/xs3p/archive/refs/tags/v$(XS3P_VERSION).tar.gz

XERCES_ARCHIVE := $(ARCHIVE_DIR)/Xerces-J-bin.$(XERCES_VERSION).tar.gz
XSDVI_ARCHIVE := $(ARCHIVE_DIR)/xsdvi-$(XSDVI_VERSION).jar
XS3P_ARCHIVE := $(ARCHIVE_DIR)/xs3p-v$(XS3P_VERSION).tar.gz

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
	cp $(ARCHIVE_DIR)/xerces-2_12_2/xercesImpl.jar $@

$(XS3P_PATH): $(XS3P_ARCHIVE)
	mkdir -p $(XS3P_DIR)
	tar -xzf $< -C $(ARCHIVE_DIR)
	cp -R $(ARCHIVE_DIR)/xs3p-$(XS3P_VERSION)/xsl/. $(XS3P_DIR)/

$(ARCHIVE_DIR):
	mkdir -p $@

$(XSDVI_ARCHIVE): | $(ARCHIVE_DIR)
	curl -fsSL -o $@ $(XSDVI_URL)

$(XERCES_ARCHIVE): | $(ARCHIVE_DIR)
	curl -fsSL -o $@ $(XERCES_URL)

$(XS3P_ARCHIVE): | $(ARCHIVE_DIR)
	curl -fsSL -o $@ $(XS3P_URL)

clean:
	rm -rf $(DOCS_DIR)

distclean: clean
	rm -rf $(ARCHIVE_DIR) $(XSDVI_DIR) $(XS3P_DIR)
