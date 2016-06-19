MENUGFXDIR := graphics/interface
INTROGFXDIR := graphics/intro

$(MENUGFXDIR)/menu.gbapal: $(MENUGFXDIR)/menu_0.gbapal $(MENUGFXDIR)/menu_1.gbapal

	@cat $(MENUGFXDIR)/menu_0.gbapal $(MENUGFXDIR)/menu_1.gbapal >$@
	
$(INTROGFXDIR)/intro.4bpp: $(INTROGFXDIR)/intro1_waterdrops.4bpp $(INTROGFXDIR)/intro1_gamefreak.4bpp

	@cat $(INTROGFXDIR)/intro1_waterdrops.4bpp $(INTROGFXDIR)/intro1_gamefreak.4bpp >$@
	
$(INTROGFXDIR)/introgfx.4bpp: $(INTROGFXDIR)/intro1_bg.4bpp $(INTROGFXDIR)/intro1_leaves.4bpp

	@cat $(INTROGFXDIR)/intro1_bg.4bpp $(INTROGFXDIR)/intro1_leaves.4bpp >$@
	
$(MENUGFXDIR)/map.8bpp: $(MENUGFXDIR)/map.png
	$(GFX) $< $@ -num_tiles 233
