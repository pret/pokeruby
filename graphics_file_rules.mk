CASTFORMGFXDIR := graphics/pokemon/castform

$(CASTFORMGFXDIR)/back.4bpp: $(CASTFORMGFXDIR)/back_normal_form.4bpp \
                             $(CASTFORMGFXDIR)/back_sunny_form.4bpp \
                             $(CASTFORMGFXDIR)/back_rainy_form.4bpp \
                             $(CASTFORMGFXDIR)/back_snowy_form.4bpp
	@cat $(CASTFORMGFXDIR)/back_normal_form.4bpp $(CASTFORMGFXDIR)/back_sunny_form.4bpp $(CASTFORMGFXDIR)/back_rainy_form.4bpp $(CASTFORMGFXDIR)/back_snowy_form.4bpp >$@

$(CASTFORMGFXDIR)/front.4bpp: $(CASTFORMGFXDIR)/front_normal_form.4bpp \
                              $(CASTFORMGFXDIR)/front_sunny_form.4bpp \
                              $(CASTFORMGFXDIR)/front_rainy_form.4bpp \
                              $(CASTFORMGFXDIR)/front_snowy_form.4bpp
	@cat $(CASTFORMGFXDIR)/front_normal_form.4bpp $(CASTFORMGFXDIR)/front_sunny_form.4bpp $(CASTFORMGFXDIR)/front_rainy_form.4bpp $(CASTFORMGFXDIR)/front_snowy_form.4bpp >$@

$(CASTFORMGFXDIR)/normal.gbapal: $(CASTFORMGFXDIR)/normal_form.gbapal \
                                 $(CASTFORMGFXDIR)/sunny_form.gbapal \
                                 $(CASTFORMGFXDIR)/rainy_form.gbapal \
                                 $(CASTFORMGFXDIR)/snowy_form.gbapal
	@cat $(CASTFORMGFXDIR)/normal_form.gbapal $(CASTFORMGFXDIR)/sunny_form.gbapal $(CASTFORMGFXDIR)/rainy_form.gbapal $(CASTFORMGFXDIR)/snowy_form.gbapal >$@

$(CASTFORMGFXDIR)/shiny.gbapal: $(CASTFORMGFXDIR)/normal_form_shiny.gbapal \
                                $(CASTFORMGFXDIR)/sunny_form_shiny.gbapal \
                                $(CASTFORMGFXDIR)/rainy_form_shiny.gbapal \
                                $(CASTFORMGFXDIR)/snowy_form_shiny.gbapal
	@cat $(CASTFORMGFXDIR)/normal_form_shiny.gbapal $(CASTFORMGFXDIR)/sunny_form_shiny.gbapal $(CASTFORMGFXDIR)/rainy_form_shiny.gbapal $(CASTFORMGFXDIR)/snowy_form_shiny.gbapal >$@
