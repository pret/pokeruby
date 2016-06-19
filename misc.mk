MENUGFXDIR := graphics/interface
INTROGFXDIR := graphics/intro

$(MENUGFXDIR)/menu.gbapal: $(MENUGFXDIR)/menu_0.gbapal $(MENUGFXDIR)/menu_1.gbapal

	@cat $(MENUGFXDIR)/menu_0.gbapal $(MENUGFXDIR)/menu_1.gbapal >$@
	
$(INTROGFXDIR)/intro.4bpp: $(INTROGFXDIR)/intro1.4bpp $(INTROGFXDIR)/intro2.4bpp

	@cat $(INTROGFXDIR)/intro1.4bpp $(INTROGFXDIR)/intro2.4bpp >$@
