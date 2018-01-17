#
# misc.mk
#
MENUGFXDIR := graphics/interface
INTROGFXDIR := graphics/intro
MISCGFXDIR := graphics/misc

$(MENUGFXDIR)/wordgroup_frame.4bpp: $(MENUGFXDIR)/wordgroup_frame.png
	$(GBAGFX) $< $@ -num_tiles 76
$(MENUGFXDIR)/check_berry.4bpp: $(MENUGFXDIR)/check_berry.png
	$(GBAGFX) $< $@ -num_tiles 97

$(INTROGFXDIR)/copyright.4bpp: $(INTROGFXDIR)/copyright.png
	$(GBAGFX) $< $@ -num_tiles 47

$(MISCGFXDIR)/end_copyright.4bpp: $(MISCGFXDIR)/end_copyright.png
	$(GBAGFX) $< $@ -num_tiles 92

#
# tilesets.mk
#
TILESETDIR := data/tilesets

$(TILESETDIR)/secondary/shop/tiles.4bpp: $(TILESETDIR)/secondary/shop/tiles.png
	$(GBAGFX) $< $@ -num_tiles 503
