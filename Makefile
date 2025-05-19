DOCSDIR = docs
SRC = src

SCHEMA_DIR = $(SRC)/schema
ASTI_SCHEMA = $(SCHEMA_DIR)/asti_schema.yaml
ASTI_DOCS_DIR = $(DOCSDIR)/asti

# --- linkml products --- #
asti-jsonschema: $(ASTI_SCHEMA)
	gen-json-schema $< > jsonschema/asti_schema.json

asti-owl: $(ASTI_SCHEMA)
	gen-owl $< > temp/asti.tmp.ttl 
	src/scripts/pun-annotations-to-ttl.py $< > temp/pun.tmp.ttl 
	robot merge -i temp/asti.tmp.ttl -i temp/pun.tmp.ttl -o owl/asti.ttl 

## remove products
clean-products:
# don't delete README files
	find jsonschema/ -type f -not -name 'README.md' -delete     
	find jsonld/ -type f -not -name 'README.md' -delete     
	find jsonld-context/ -type f -not -name 'README.md' -delete     
	find shacl/ -type f -not -name 'README.md' -delete     
	find owl/ -type f -not -name 'README.md' -delete     

# --- schema documentation --- #
gendoc: $(DOCSDIR)
# copy existing files (if they exist) 
# note: there is no space after the ',' in ($(wildcard src/docs/*.md),)
# condition is the true if the wildcard returns non-empty content (i.e, not equal)
ifneq ($(wildcard src/docs/*.md),)
	cp src/docs/*.md docs/
endif
ifneq ($(wildcard src/docs/images/*.*),)
	cp src/docs/images/*.* docs/images
endif
# generate documentation
	gen-doc -d $(DOCSDIR) -o asti_schema.md $(ASTI_SCHEMA)

## remove docs
clean-docs:
# don't delete README files
	find docs/ -type f -not -name 'README.md' -delete     
	find docs/images/ -type f -not -name 'README.md' -delete  