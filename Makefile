DOCSDIR = docs
SRC = src

SCHEMA_DIR = $(SRC)/schema
ASTI_SCHEMA = $(SCHEMA_DIR)/asti_schema.yaml
ASTI_DOCS_DIR = $(DOCSDIR)/asti
STE_SCHEMA = $(SCHEMA_DIR)/ste_schema.yaml
STE_DOCS_DIR = $(DOCSDIR)/ste
NEIS_SCHEMA = $(SCHEMA_DIR)/neis_schema.yaml
NEIS_DOCS_DIR = $(DOCSDIR)/neis
YADEN_SCHEMA = $(SCHEMA_DIR)/yaden_schema.yaml
YADEN_DOCS_DIR = $(DOCSDIR)/yaden

# --- linkml products --- #
asti-jsonschema: $(ASTI_SCHEMA)
	gen-json-schema $< > jsonschema/asti_schema.json

asti-owl: $(ASTI_SCHEMA)
	gen-owl $< > temp/asti.tmp.ttl 
	src/scripts/pun-annotations-to-ttl.py $< > temp/pun.tmp.ttl 
	robot merge -i temp/asti.tmp.ttl -i temp/pun.tmp.ttl -o owl/asti.ttl 

ste-jsonschema: $(STE_SCHEMA)
	gen-json-schema $< > jsonschema/ste_schema.json

neis-jsonschema: $(NEIS_SCHEMA)
	gen-json-schema $< > jsonschema/neis_schema.json

yaden-jsonschema: $(YADEN_SCHEMA)
	gen-json-schema $< > jsonschema/yaden_schema.json

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
	# Step 1: Backup homepage if it exists
	if [ -f $(DOCSDIR)/index.md ]; then \
		cp $(DOCSDIR)/index.md $(DOCSDIR)/_home.md; \
	fi

	# Step 2: Generate schema docs and Rename generated schema doc if needed
	gen-doc -d $(DOCSDIR) $(ASTI_SCHEMA)
	if [ -f $(DOCSDIR)/index.md ]; then \
		mv $(DOCSDIR)/index.md $(DOCSDIR)/asti_schema.md; \
	fi
	
	gen-doc -d $(DOCSDIR) $(STE_SCHEMA)
	if [ -f $(DOCSDIR)/index.md ]; then \
		mv $(DOCSDIR)/index.md $(DOCSDIR)/ste_schema.md; \
	fi

	gen-doc -d $(DOCSDIR) $(NEIS_SCHEMA)
	if [ -f $(DOCSDIR)/index.md ]; then \
		mv $(DOCSDIR)/index.md $(DOCSDIR)/neis_schema.md; \
	fi
	
	gen-doc -d $(DOCSDIR) $(YADEN_SCHEMA)
	if [ -f $(DOCSDIR)/index.md ]; then \
		mv $(DOCSDIR)/index.md $(DOCSDIR)/yaden_schema.md; \
	fi

	# Step 3: Restore homepage
	if [ -f $(DOCSDIR)/_home.md ]; then \
		mv $(DOCSDIR)/_home.md $(DOCSDIR)/index.md; \
	fi

## remove docs
clean-docs:
# don't delete README files
	find docs/ -type f -not -name 'README.md' -delete     
	find docs/images/ -type f -not -name 'README.md' -delete  