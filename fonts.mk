RSFONT := tools/rsfont/rsfont

graphics/fonts/font0_jpn.1bpp: graphics/fonts/font0_jpn.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 240 1

graphics/fonts/font1_jpn.1bpp: graphics/fonts/font1_jpn.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 256 0

graphics/fonts/font3_jpn.4bpp: graphics/fonts/font3_jpn.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 252 2

graphics/fonts/font4_jpn.4bpp: graphics/fonts/font4_jpn.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 220 0

graphics/fonts/font0_lat.1bpp: graphics/fonts/font0_lat.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 256 1

graphics/fonts/font1_lat.1bpp: graphics/fonts/font1_lat.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 256 0

graphics/fonts/font3_lat.4bpp: graphics/fonts/font3_lat.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 254 1

graphics/fonts/font3_lat_rev1.4bpp: graphics/fonts/font3_lat_rev1.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 254 1

graphics/fonts/font4_lat.4bpp: graphics/fonts/font4_lat.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 220 0

graphics/fonts/font4_lat_rev1.4bpp: graphics/fonts/font4_lat_rev1.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 220 0

graphics/fonts/font6_braille.1bpp: graphics/fonts/font6_braille.png
	@echo "RSFONT	$<"
	$(QUIET) $(RSFONT) $< $@ 192 0
