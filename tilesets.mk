TILESETDIR := data/tilesets

$(TILESETDIR)/secondary/petalburg/tiles.4bpp: GFX_OPTS := -num_tiles 159
$(TILESETDIR)/secondary/rustboro/tiles.4bpp: GFX_OPTS := -num_tiles 498
$(TILESETDIR)/secondary/dewford/tiles.4bpp: GFX_OPTS := -num_tiles 343
$(TILESETDIR)/secondary/slateport/tiles.4bpp: GFX_OPTS := -num_tiles 504
$(TILESETDIR)/secondary/mauville/tiles.4bpp: GFX_OPTS := -num_tiles 450
$(TILESETDIR)/secondary/lavaridge/tiles.4bpp: GFX_OPTS := -num_tiles 348
$(TILESETDIR)/secondary/fallarbor/tiles.4bpp: GFX_OPTS := -num_tiles 374
$(TILESETDIR)/secondary/fortree/tiles.4bpp: GFX_OPTS := -num_tiles 493
$(TILESETDIR)/secondary/mossdeep/tiles.4bpp: GFX_OPTS := -num_tiles 499
$(TILESETDIR)/secondary/pacifidlog/tiles.4bpp: GFX_OPTS := -num_tiles 504
$(TILESETDIR)/secondary/sootopolis/tiles.4bpp: GFX_OPTS := -num_tiles 180
$(TILESETDIR)/primary/building/tiles.4bpp: GFX_OPTS := -num_tiles 502
$(TILESETDIR)/secondary/shop/tiles.4bpp: GFX_OPTS := -num_tiles 502
$(TILESETDIR)/secondary/pokemon_center/tiles.4bpp: GFX_OPTS := -num_tiles 478
$(TILESETDIR)/secondary/cave/tiles.4bpp: GFX_OPTS := -num_tiles 420
$(TILESETDIR)/secondary/pokemon_school/tiles.4bpp: GFX_OPTS := -num_tiles 278
$(TILESETDIR)/secondary/pokemon_fan_club/tiles.4bpp: GFX_OPTS := -num_tiles 319
$(TILESETDIR)/secondary/unused_1/tiles.4bpp: GFX_OPTS := -num_tiles 17
$(TILESETDIR)/secondary/meteor_falls/tiles.4bpp: GFX_OPTS := -num_tiles 422
$(TILESETDIR)/secondary/oceanic_museum/tiles.4bpp: GFX_OPTS := -num_tiles 319
$(TILESETDIR)/secondary/cable_club/unknown_tiles.4bpp: GFX_OPTS := -num_tiles 120
$(TILESETDIR)/secondary/seashore_house/tiles.4bpp: GFX_OPTS := -num_tiles 312
$(TILESETDIR)/secondary/pretty_petal_flower_shop/tiles.4bpp: GFX_OPTS := -num_tiles 345
$(TILESETDIR)/secondary/pokemon_day_care/tiles.4bpp: GFX_OPTS := -num_tiles 355
$(TILESETDIR)/secondary/facility/tiles.4bpp: GFX_OPTS := -num_tiles 503
$(TILESETDIR)/secondary/secret_base/brown_cave/tiles.4bpp: GFX_OPTS := -num_tiles 83
$(TILESETDIR)/secondary/secret_base/tree/tiles.4bpp: GFX_OPTS := -num_tiles 83
$(TILESETDIR)/secondary/secret_base/shrub/tiles.4bpp: GFX_OPTS := -num_tiles 83
$(TILESETDIR)/secondary/secret_base/blue_cave/tiles.4bpp: GFX_OPTS := -num_tiles 83
$(TILESETDIR)/secondary/secret_base/yellow_cave/tiles.4bpp: GFX_OPTS := -num_tiles 83
$(TILESETDIR)/secondary/secret_base/red_cave/tiles.4bpp: GFX_OPTS := -num_tiles 83
$(TILESETDIR)/secondary/inside_of_truck/tiles.4bpp: GFX_OPTS := -num_tiles 62
$(TILESETDIR)/secondary/contest/tiles.4bpp: GFX_OPTS := -num_tiles 430
$(TILESETDIR)/secondary/lilycove_museum/tiles.4bpp: GFX_OPTS := -num_tiles 431
$(TILESETDIR)/secondary/lab/tiles.4bpp: GFX_OPTS := -num_tiles 500
$(TILESETDIR)/secondary/underwater/tiles.4bpp: GFX_OPTS := -num_tiles 500
$(TILESETDIR)/secondary/generic_building/tiles.4bpp: GFX_OPTS := -num_tiles 509
$(TILESETDIR)/secondary/mauville_game_corner/tiles.4bpp: GFX_OPTS := -num_tiles 469
$(TILESETDIR)/secondary/unused_2/tiles.4bpp: GFX_OPTS := -num_tiles 150
$(TILESETDIR)/secondary/rustboro_gym/tiles.4bpp: GFX_OPTS := -num_tiles 94
$(TILESETDIR)/secondary/dewford_gym/tiles.4bpp: GFX_OPTS := -num_tiles 88
$(TILESETDIR)/secondary/lavaridge_gym/tiles.4bpp: GFX_OPTS := -num_tiles 70
$(TILESETDIR)/secondary/fortree_gym/tiles.4bpp: GFX_OPTS := -num_tiles 84
$(TILESETDIR)/secondary/mossdeep_gym/tiles.4bpp: GFX_OPTS := -num_tiles 122
$(TILESETDIR)/secondary/sootopolis_gym/tiles.4bpp: GFX_OPTS := -num_tiles 484
$(TILESETDIR)/secondary/trick_house_puzzle/tiles.4bpp: GFX_OPTS := -num_tiles 255
$(TILESETDIR)/secondary/ship/tiles.4bpp: GFX_OPTS := -num_tiles 342
$(TILESETDIR)/secondary/elite_four/tiles.4bpp: GFX_OPTS := -num_tiles 505

# reproduce overflow quirk
$(TILESETDIR)/secondary/pokemon_school/tiles.4bpp.lz: $(TILESETDIR)/secondary/pokemon_school/tiles.4bpp
	$(GBAGFX) $< $@ -overflow 10

$(TILESETDIR)/secondary/pokemon_fan_club/tiles.4bpp.lz: $(TILESETDIR)/secondary/pokemon_fan_club/tiles.4bpp
	$(GBAGFX) $< $@ -overflow 12

$(TILESETDIR)/secondary/pretty_petal_flower_shop/tiles.4bpp.lz: $(TILESETDIR)/secondary/pretty_petal_flower_shop/tiles.4bpp
	$(GBAGFX) $< $@ -overflow 8

$(TILESETDIR)/secondary/pokemon_day_care/tiles.4bpp.lz: $(TILESETDIR)/secondary/pokemon_day_care/tiles.4bpp
	$(GBAGFX) $< $@ -overflow 14

$(TILESETDIR)/secondary/inside_of_truck/tiles.4bpp.lz: $(TILESETDIR)/secondary/inside_of_truck/tiles.4bpp
	$(GBAGFX) $< $@ -overflow 10

$(TILESETDIR)/secondary/battle_tower/tiles.4bpp.lz: $(TILESETDIR)/secondary/battle_tower/tiles.4bpp
	$(GBAGFX) $< $@ -overflow 16

# unused copies of secret base tiles

$(TILESETDIR)/secondary/secret_base/brown_cave/unused_tiles.4bpp: $(TILESETDIR)/secondary/secret_base/brown_cave/tiles.png
	$(GBAGFX) $< $@ -num_tiles 82

$(TILESETDIR)/secondary/secret_base/tree/unused_tiles.4bpp: $(TILESETDIR)/secondary/secret_base/tree/tiles.png
	$(GBAGFX) $< $@ -num_tiles 82

$(TILESETDIR)/secondary/secret_base/shrub/unused_tiles.4bpp: $(TILESETDIR)/secondary/secret_base/shrub/tiles.png
	$(GBAGFX) $< $@ -num_tiles 82

$(TILESETDIR)/secondary/secret_base/blue_cave/unused_tiles.4bpp: $(TILESETDIR)/secondary/secret_base/blue_cave/tiles.png
	$(GBAGFX) $< $@ -num_tiles 82

$(TILESETDIR)/secondary/secret_base/yellow_cave/unused_tiles.4bpp: $(TILESETDIR)/secondary/secret_base/yellow_cave/tiles.png
	$(GBAGFX) $< $@ -num_tiles 82

$(TILESETDIR)/secondary/secret_base/red_cave/unused_tiles.4bpp: $(TILESETDIR)/secondary/secret_base/red_cave/tiles.png
	$(GBAGFX) $< $@ -num_tiles 82
