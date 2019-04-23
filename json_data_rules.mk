# JSON files are run through jsonproc, which is a tool that converts JSON data to an output file
# based on an Inja template. https://github.com/pantor/inja

AUTO_GEN_TARGETS += src/data/items.h src/data/item_descriptions.h

src/data/item_descriptions.h: src/data/items.json src/data/item_descriptions.json.txt
	$(JSONPROC) $^ $@

src/data/items.h: src/data/items.json src/data/items.json.txt
	$(JSONPROC) $^ $@
