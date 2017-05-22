MENUGFXDIR := graphics/interface
TRADEGFXDIR := graphics/trade
INTROGFXDIR := graphics/intro
PSSGFXDIR := graphics/pokemon_storage
MISCGFXDIR := graphics/misc
PKNAVGFXDIR := graphics/pokenav
UNKNOWNGFXDIR := graphics/unknown
UNUSEDGFXDIR := graphics/unused
REELGFXDIR := graphics/slot_machine
ROULGFXDIR := graphics/roulette
BTLANMSPRGFXDIR := graphics/battle_anims/sprites
PICFRAMEGFXDIR := graphics/picture_frame
CONTESTGFXDIR := graphics/contest
MASKSGFXDIR := graphics/battle_anims/masks
BATTRANSGFXDIR := graphics/battle_transitions
TYPESGFXDIR := graphics/types
TITLEGFXDIR := graphics/title_screen

MENUGFXDIR_DE := graphics-de/interface
TRADEGFXDIR_DE := graphics-de/trade
INTROGFXDIR_DE := graphics-de/intro
PSSGFXDIR_DE := graphics-de/pokemon_storage
MISCGFXDIR_DE := graphics-de/misc
PKNAVGFXDIR_DE := graphics-de/pokenav
UNKNOWNGFXDIR_DE := graphics-de/unknown
UNUSEDGFXDIR_DE := graphics-de/unused
REELGFXDIR_DE := graphics-de/slot_machine
ROULGFXDIR_DE := graphics-de/roulette
BTLANMSPRGFXDIR_DE := graphics-de/battle_anims/sprites
PICFRAMEGFXDIR_DE := graphics-de/picture_frame
CONTESTGFXDIR_DE := graphics-de/contest
MASKSGFXDIR_DE := graphics-de/battle_anims/masks
BATTRANSGFXDIR_DE := graphics-de/battle_transitions
TYPESGFXDIR_DE := graphics-de/types
TITLEGFXDIR_DE := graphics-de/title_screen

types_1 := fight flying poison ground rock bug ghost steel
types_2 := fire water grass electric psychic ice dragon dark
contest_types := cool beauty cute smart tough

$(MENUGFXDIR)/menu.gbapal: $(MENUGFXDIR)/menu_0.gbapal $(MENUGFXDIR)/menu_1.gbapal
	@cat $(MENUGFXDIR)/menu_0.gbapal $(MENUGFXDIR)/menu_1.gbapal >$@

$(INTROGFXDIR)/intro.4bpp: $(INTROGFXDIR)/intro1_waterdrops.4bpp $(INTROGFXDIR)/intro1_gamefreak.4bpp
	@cat $(INTROGFXDIR)/intro1_waterdrops.4bpp $(INTROGFXDIR)/intro1_gamefreak.4bpp >$@

$(INTROGFXDIR)/introgfx.4bpp: $(INTROGFXDIR)/intro1_bg.4bpp $(INTROGFXDIR)/intro1_leaves.4bpp
	@cat $(INTROGFXDIR)/intro1_bg.4bpp $(INTROGFXDIR)/intro1_leaves.4bpp >$@

$(PKNAVGFXDIR)/region_map.8bpp: $(PKNAVGFXDIR)/region_map.png
	$(GFX) $< $@ -num_tiles 233

$(PSSGFXDIR)/forest_frame.4bpp: $(PSSGFXDIR)/forest_frame.png
	$(GFX) $< $@ -num_tiles 49

$(PSSGFXDIR)/forest.4bpp: $(PSSGFXDIR)/forest_frame.4bpp $(PSSGFXDIR)/forest_bg.4bpp
	@cat $(PSSGFXDIR)/forest_frame.4bpp $(PSSGFXDIR)/forest_bg.4bpp >$@

$(PSSGFXDIR)/city_frame.4bpp: $(PSSGFXDIR)/city_frame.png
	$(GFX) $< $@ -num_tiles 37

$(PSSGFXDIR)/city.4bpp: $(PSSGFXDIR)/city_frame.4bpp $(PSSGFXDIR)/city_bg.4bpp
	@cat $(PSSGFXDIR)/city_frame.4bpp $(PSSGFXDIR)/city_bg.4bpp >$@

$(PSSGFXDIR)/desert_frame.4bpp: $(PSSGFXDIR)/desert_frame.png
	$(GFX) $< $@ -num_tiles 48

$(PSSGFXDIR)/desert.4bpp: $(PSSGFXDIR)/desert_frame.4bpp $(PSSGFXDIR)/desert_bg.4bpp
	@cat $(PSSGFXDIR)/desert_frame.4bpp $(PSSGFXDIR)/desert_bg.4bpp >$@

$(PSSGFXDIR)/savanna_frame.4bpp: $(PSSGFXDIR)/savanna_frame.png
	$(GFX) $< $@ -num_tiles 40

$(PSSGFXDIR)/savanna.4bpp: $(PSSGFXDIR)/savanna_frame.4bpp $(PSSGFXDIR)/savanna_bg.4bpp
	@cat $(PSSGFXDIR)/savanna_frame.4bpp $(PSSGFXDIR)/savanna_bg.4bpp >$@

$(PSSGFXDIR)/crag_frame.4bpp: $(PSSGFXDIR)/crag_frame.png
	$(GFX) $< $@ -num_tiles 46

$(PSSGFXDIR)/crag.4bpp: $(PSSGFXDIR)/crag_frame.4bpp $(PSSGFXDIR)/crag_bg.4bpp
	@cat $(PSSGFXDIR)/crag_frame.4bpp $(PSSGFXDIR)/crag_bg.4bpp >$@

$(PSSGFXDIR)/volcano_frame.4bpp: $(PSSGFXDIR)/volcano_frame.png
	$(GFX) $< $@ -num_tiles 49

$(PSSGFXDIR)/volcano.4bpp: $(PSSGFXDIR)/volcano_frame.4bpp $(PSSGFXDIR)/volcano_bg.4bpp
	@cat $(PSSGFXDIR)/volcano_frame.4bpp $(PSSGFXDIR)/volcano_bg.4bpp >$@

$(PSSGFXDIR)/snow_frame.4bpp: $(PSSGFXDIR)/snow_frame.png
	$(GFX) $< $@ -num_tiles 46

$(PSSGFXDIR)/snow.4bpp: $(PSSGFXDIR)/snow_frame.4bpp $(PSSGFXDIR)/snow_bg.4bpp
	@cat $(PSSGFXDIR)/snow_frame.4bpp $(PSSGFXDIR)/snow_bg.4bpp >$@

$(PSSGFXDIR)/cave_frame.4bpp: $(PSSGFXDIR)/cave_frame.png
	$(GFX) $< $@ -num_tiles 57

$(PSSGFXDIR)/cave.4bpp: $(PSSGFXDIR)/cave_frame.4bpp $(PSSGFXDIR)/cave_bg.4bpp
	@cat $(PSSGFXDIR)/cave_frame.4bpp $(PSSGFXDIR)/cave_bg.4bpp >$@

$(PSSGFXDIR)/beach_frame.4bpp: $(PSSGFXDIR)/beach_frame.png
	$(GFX) $< $@ -num_tiles 48

$(PSSGFXDIR)/beach.4bpp: $(PSSGFXDIR)/beach_frame.4bpp $(PSSGFXDIR)/beach_bg.4bpp
	@cat $(PSSGFXDIR)/beach_frame.4bpp $(PSSGFXDIR)/beach_bg.4bpp >$@

$(PSSGFXDIR)/seafloor_frame.4bpp: $(PSSGFXDIR)/seafloor_frame.png
	$(GFX) $< $@ -num_tiles 45

$(PSSGFXDIR)/seafloor.4bpp: $(PSSGFXDIR)/seafloor_frame.4bpp $(PSSGFXDIR)/seafloor_bg.4bpp
	@cat $(PSSGFXDIR)/seafloor_frame.4bpp $(PSSGFXDIR)/seafloor_bg.4bpp >$@

$(PSSGFXDIR)/river_frame.4bpp: $(PSSGFXDIR)/river_frame.png
	$(GFX) $< $@ -num_tiles 57

$(PSSGFXDIR)/river.4bpp: $(PSSGFXDIR)/river_frame.4bpp $(PSSGFXDIR)/river_bg.4bpp
	@cat $(PSSGFXDIR)/river_frame.4bpp $(PSSGFXDIR)/river_bg.4bpp >$@

$(PSSGFXDIR)/sky_frame.4bpp: $(PSSGFXDIR)/sky_frame.png
	$(GFX) $< $@ -num_tiles 45

$(PSSGFXDIR)/sky.4bpp: $(PSSGFXDIR)/sky_frame.4bpp $(PSSGFXDIR)/sky_bg.4bpp
	@cat $(PSSGFXDIR)/sky_frame.4bpp $(PSSGFXDIR)/sky_bg.4bpp >$@

$(PSSGFXDIR)/polkadot_frame.4bpp: $(PSSGFXDIR)/polkadot_frame.png
	$(GFX) $< $@ -num_tiles 34

$(PSSGFXDIR)/polkadot.4bpp: $(PSSGFXDIR)/polkadot_frame.4bpp $(PSSGFXDIR)/polkadot_bg.4bpp
	@cat $(PSSGFXDIR)/polkadot_frame.4bpp $(PSSGFXDIR)/polkadot_bg.4bpp >$@

$(PSSGFXDIR)/pokecenter_bg.4bpp: $(PSSGFXDIR)/pokecenter_bg.png
	$(GFX) $< $@ -num_tiles 38

$(PSSGFXDIR)/pokecenter.4bpp: $(PSSGFXDIR)/pokecenter_frame.4bpp $(PSSGFXDIR)/pokecenter_bg.4bpp
	@cat $(PSSGFXDIR)/pokecenter_frame.4bpp $(PSSGFXDIR)/pokecenter_bg.4bpp >$@

$(PSSGFXDIR)/machine_frame.4bpp: $(PSSGFXDIR)/machine_frame.png
	$(GFX) $< $@ -num_tiles 46

$(PSSGFXDIR)/machine.4bpp: $(PSSGFXDIR)/machine_frame.4bpp $(PSSGFXDIR)/machine_bg.4bpp
	@cat $(PSSGFXDIR)/machine_frame.4bpp $(PSSGFXDIR)/machine_bg.4bpp >$@

$(PSSGFXDIR)/plain_frame.4bpp: $(PSSGFXDIR)/plain_frame.png
	$(GFX) $< $@ -num_tiles 18

$(PSSGFXDIR)/plain.4bpp: $(PSSGFXDIR)/plain_frame.4bpp $(PSSGFXDIR)/plain_bg.4bpp
	@cat $(PSSGFXDIR)/plain_frame.4bpp $(PSSGFXDIR)/plain_bg.4bpp >$@

$(PKNAVGFXDIR)/outline.4bpp: $(PKNAVGFXDIR)/outline.png
	$(GFX) $< $@ -num_tiles 43

$(REELGFXDIR)/reel_time.4bpp: $(REELGFXDIR)/reel_pikachu.4bpp $(REELGFXDIR)/reel_machine.4bpp
	@cat $(REELGFXDIR)/reel_pikachu.4bpp $(REELGFXDIR)/reel_machine.4bpp >$@

$(MISCGFXDIR)/birch_help.4bpp: $(MISCGFXDIR)/birch_bag.4bpp $(MISCGFXDIR)/birch_grass.4bpp
	@cat $(MISCGFXDIR)/birch_bag.4bpp $(MISCGFXDIR)/birch_grass.4bpp >$@

$(MISCGFXDIR)/clock_misc.4bpp: $(MISCGFXDIR)/clock_hands.4bpp $(MISCGFXDIR)/clock_ampm.4bpp
	@cat $(MISCGFXDIR)/clock_hands.4bpp $(MISCGFXDIR)/clock_ampm.4bpp >$@

$(ROULGFXDIR)/roulette_tilt.4bpp: $(ROULGFXDIR)/shroomish.4bpp $(ROULGFXDIR)/tailow.4bpp
	@cat $(ROULGFXDIR)/shroomish.4bpp $(ROULGFXDIR)/tailow.4bpp >$@

$(ROULGFXDIR)/poke_icons2.4bpp: $(ROULGFXDIR)/wynaut.4bpp $(ROULGFXDIR)/azurill.4bpp $(ROULGFXDIR)/skitty.4bpp $(ROULGFXDIR)/makuhita.4bpp
	@cat $(ROULGFXDIR)/wynaut.4bpp $(ROULGFXDIR)/azurill.4bpp $(ROULGFXDIR)/skitty.4bpp $(ROULGFXDIR)/makuhita.4bpp >$@

$(INTROGFXDIR)/intro3_misc.4bpp: $(INTROGFXDIR)/intro3_star.4bpp $(INTROGFXDIR)/intro3_attackgfx.4bpp $(INTROGFXDIR)/intro3_explosion.4bpp
	@cat $(INTROGFXDIR)/intro3_star.4bpp $(INTROGFXDIR)/intro3_attackgfx.4bpp $(INTROGFXDIR)/intro3_explosion.4bpp >$@

$(TRADEGFXDIR)/gba_affine.8bpp: $(TRADEGFXDIR)/gba_affine.png
	$(GFX) $< $@ -num_tiles 129

$(TRADEGFXDIR_DE)/menu.4bpp: $(TRADEGFXDIR_DE)/menu.png
	$(GFX) $< $@ -num_tiles 148

$(BTLANMSPRGFXDIR)/001.4bpp: $(BTLANMSPRGFXDIR)/001_0.4bpp $(BTLANMSPRGFXDIR)/001_1.4bpp
	@cat $(BTLANMSPRGFXDIR)/001_0.4bpp $(BTLANMSPRGFXDIR)/001_1.4bpp >$@

$(BTLANMSPRGFXDIR)/010.4bpp: $(BTLANMSPRGFXDIR)/010_0.4bpp $(BTLANMSPRGFXDIR)/010_1.4bpp $(BTLANMSPRGFXDIR)/010_2.4bpp $(BTLANMSPRGFXDIR)/010_3.4bpp
	@cat $(BTLANMSPRGFXDIR)/010_0.4bpp $(BTLANMSPRGFXDIR)/010_1.4bpp $(BTLANMSPRGFXDIR)/010_2.4bpp $(BTLANMSPRGFXDIR)/010_3.4bpp >$@

$(BTLANMSPRGFXDIR)/074.4bpp: $(BTLANMSPRGFXDIR)/074_0.4bpp $(BTLANMSPRGFXDIR)/074_1.4bpp
	@cat $(BTLANMSPRGFXDIR)/074_0.4bpp $(BTLANMSPRGFXDIR)/074_1.4bpp >$@

$(BTLANMSPRGFXDIR)/141.4bpp: $(BTLANMSPRGFXDIR)/141_0.4bpp $(BTLANMSPRGFXDIR)/141_1.4bpp $(BTLANMSPRGFXDIR)/141_2.4bpp $(BTLANMSPRGFXDIR)/141_3.4bpp $(BTLANMSPRGFXDIR)/141_4.4bpp
	@cat $(BTLANMSPRGFXDIR)/141_0.4bpp $(BTLANMSPRGFXDIR)/141_1.4bpp $(BTLANMSPRGFXDIR)/141_2.4bpp $(BTLANMSPRGFXDIR)/141_3.4bpp $(BTLANMSPRGFXDIR)/141_4.4bpp >$@

$(BTLANMSPRGFXDIR)/159.4bpp: $(BTLANMSPRGFXDIR)/159_0.4bpp $(BTLANMSPRGFXDIR)/159_1.4bpp
	@cat $(BTLANMSPRGFXDIR)/159_0.4bpp $(BTLANMSPRGFXDIR)/159_1.4bpp >$@

$(PICFRAMEGFXDIR)/frame5.4bpp: $(PICFRAMEGFXDIR)/frame5.png
	$(GFX) $< $@ -num_tiles 86

$(CONTESTGFXDIR)/nextturn.4bpp: $(CONTESTGFXDIR)/nextturn.png
	$(GFX) $< $@ -num_tiles 8

$(UNUSEDGFXDIR)/obi_palpak1.gbapal: $(UNUSEDGFXDIR)/old_pal1.gbapal $(UNUSEDGFXDIR)/old_pal2.gbapal $(UNUSEDGFXDIR)/old_pal3.gbapal
	@cat $(UNUSEDGFXDIR)/old_pal1.gbapal $(UNUSEDGFXDIR)/old_pal2.gbapal $(UNUSEDGFXDIR)/old_pal3.gbapal >$@

$(UNUSEDGFXDIR)/obi_palpak3.gbapal: $(UNUSEDGFXDIR)/old_pal5.gbapal $(UNUSEDGFXDIR)/old_pal6.gbapal $(UNUSEDGFXDIR)/old_pal7.gbapal
	@cat $(UNUSEDGFXDIR)/old_pal5.gbapal $(UNUSEDGFXDIR)/old_pal6.gbapal $(UNUSEDGFXDIR)/old_pal7.gbapal >$@

$(UNUSEDGFXDIR)/obi1.4bpp: $(UNUSEDGFXDIR)/old_bulbasaur.4bpp $(UNUSEDGFXDIR)/old_charizard.4bpp
	@cat $(UNUSEDGFXDIR)/old_bulbasaur.4bpp $(UNUSEDGFXDIR)/old_charizard.4bpp >$@

$(UNUSEDGFXDIR)/obi2.4bpp: $(UNUSEDGFXDIR)/old_bulbasaur2.4bpp $(UNUSEDGFXDIR)/old_battle_interface_1.4bpp $(UNUSEDGFXDIR)/old_battle_interface_2.4bpp $(UNUSEDGFXDIR)/old_battle_interface_3.4bpp
	@cat $(UNUSEDGFXDIR)/old_bulbasaur2.4bpp $(UNUSEDGFXDIR)/old_battle_interface_1.4bpp $(UNUSEDGFXDIR)/old_battle_interface_2.4bpp $(UNUSEDGFXDIR)/old_battle_interface_3.4bpp >$@

$(MENUGFXDIR)/hp_numbers.4bpp: $(MENUGFXDIR)/hpbar_anim.4bpp $(MENUGFXDIR)/numbers1.4bpp $(MENUGFXDIR)/numbers2.4bpp
	@cat $(MENUGFXDIR)/hpbar_anim.4bpp $(MENUGFXDIR)/numbers1.4bpp $(MENUGFXDIR)/numbers2.4bpp >$@

$(UNUSEDGFXDIR)/redyellowgreen_frame.bin: $(UNUSEDGFXDIR)/red_frame.bin $(UNUSEDGFXDIR)/yellow_frame.bin $(UNUSEDGFXDIR)/green_frame.bin $(UNUSEDGFXDIR)/blank_frame.bin
	@cat $(UNUSEDGFXDIR)/red_frame.bin $(UNUSEDGFXDIR)/yellow_frame.bin $(UNUSEDGFXDIR)/green_frame.bin $(UNUSEDGFXDIR)/blank_frame.bin >$@

$(UNUSEDGFXDIR)/color_frames.4bpp: $(UNUSEDGFXDIR)/color_frames.png
	$(GFX) $< $@ -num_tiles 353

$(UNUSEDGFXDIR)/old_contest.4bpp: $(UNUSEDGFXDIR)/old_contest_frame_1.4bpp $(UNUSEDGFXDIR)/old_contest_floor.4bpp $(UNUSEDGFXDIR)/old_contest_frame_2.4bpp $(UNUSEDGFXDIR)/old_contest_symbols.4bpp $(UNUSEDGFXDIR)/old_contest_meter.4bpp $(UNUSEDGFXDIR)/old_contest_classes.4bpp $(UNUSEDGFXDIR)/old_contest_numbers.4bpp
	@cat $(UNUSEDGFXDIR)/old_contest_frame_1.4bpp $(UNUSEDGFXDIR)/old_contest_floor.4bpp $(UNUSEDGFXDIR)/old_contest_frame_2.4bpp $(UNUSEDGFXDIR)/old_contest_symbols.4bpp $(UNUSEDGFXDIR)/old_contest_meter.4bpp $(UNUSEDGFXDIR)/old_contest_classes.4bpp $(UNUSEDGFXDIR)/old_contest_numbers.4bpp >$@

$(UNUSEDGFXDIR)/old_contest_2.4bpp: $(UNUSEDGFXDIR)/old_contest_2_1.4bpp $(UNUSEDGFXDIR)/old_contest_2_2.4bpp
	@cat $(UNUSEDGFXDIR)/old_contest_2_1.4bpp $(UNUSEDGFXDIR)/old_contest_2_2.4bpp >$@

$(MASKSGFXDIR)/unknown_D2EDFC.4bpp: $(MASKSGFXDIR)/unknown_D2EDFC.png
	$(GFX) $< $@ -num_tiles 14

$(BATTRANSGFXDIR)/vs_frame.4bpp: $(BATTRANSGFXDIR)/vs_frame.png
	$(GFX) $< $@ -num_tiles 16

$(MENUGFXDIR_DE)/party_menu_misc.4bpp: $(MENUGFXDIR_DE)/party_menu_misc.png
	$(GFX) $< $@ -num_tiles 116

$(TYPESGFXDIR_DE)/move_types.4bpp: $(TYPESGFXDIR)/normal.4bpp $(types_1:%=$(TYPESGFXDIR_DE)/%.4bpp) $(TYPESGFXDIR)/mystery.4bpp $(types_2:%=$(TYPESGFXDIR_DE)/%.4bpp) $(contest_types:%=$(TYPESGFXDIR_DE)/contest_%.4bpp)
	@cat $^ >$@

$(TYPESGFXDIR)/move_types.gbapal: $(TYPESGFXDIR)/move_types_1.gbapal $(TYPESGFXDIR)/move_types_2.gbapal $(TYPESGFXDIR)/move_types_3.gbapal
	@cat $(TYPESGFXDIR)/move_types_1.gbapal $(TYPESGFXDIR)/move_types_2.gbapal $(TYPESGFXDIR)/move_types_3.gbapal >$@

$(MENUGFXDIR_DE)/status_screen.4bpp: $(MENUGFXDIR_DE)/status_screen.png
	$(GFX) $< $@ -num_tiles 217

$(PKNAVGFXDIR_DE)/menu_options.4bpp: $(PKNAVGFXDIR_DE)/menu_hoennmap.4bpp $(PKNAVGFXDIR_DE)/menu_condition.4bpp $(PKNAVGFXDIR_DE)/menu_eyes.4bpp $(PKNAVGFXDIR_DE)/menu_ribbons.4bpp $(PKNAVGFXDIR_DE)/menu_off.4bpp
	@cat $(PKNAVGFXDIR_DE)/menu_hoennmap.4bpp $(PKNAVGFXDIR_DE)/menu_condition.4bpp $(PKNAVGFXDIR_DE)/menu_eyes.4bpp $(PKNAVGFXDIR_DE)/menu_ribbons.4bpp $(PKNAVGFXDIR_DE)/menu_off.4bpp >$@

$(PKNAVGFXDIR_DE)/condition_menu_misc.4bpp: $(PKNAVGFXDIR_DE)/condition_menu_misc.png
	$(GFX) $< $@ -num_tiles 41

$(PKNAVGFXDIR_DE)/condition_search.4bpp: $(PKNAVGFXDIR_DE)/condition_search_cool.4bpp $(PKNAVGFXDIR_DE)/condition_search_beauty.4bpp $(PKNAVGFXDIR_DE)/condition_search_cute.4bpp $(PKNAVGFXDIR_DE)/condition_search_smart.4bpp $(PKNAVGFXDIR_DE)/condition_search_tough.4bpp $(PKNAVGFXDIR_DE)/condition_search_cancel.4bpp
	@cat $(PKNAVGFXDIR_DE)/condition_search_cool.4bpp $(PKNAVGFXDIR_DE)/condition_search_beauty.4bpp $(PKNAVGFXDIR_DE)/condition_search_cute.4bpp $(PKNAVGFXDIR_DE)/condition_search_smart.4bpp $(PKNAVGFXDIR_DE)/condition_search_tough.4bpp $(PKNAVGFXDIR_DE)/condition_search_cancel.4bpp >$@

$(PSSGFXDIR_DE)/header.4bpp: $(PSSGFXDIR_DE)/header.png
	$(GFX) $< $@ -num_tiles 47

$(PSSGFXDIR_DE)/misc1.4bpp: $(PSSGFXDIR_DE)/misc1.png
	$(GFX) $< $@ -num_tiles 91

$(MISCGFXDIR_DE)/hof.4bpp: $(MISCGFXDIR_DE)/hof.png
	$(GFX) $< $@ -num_tiles 37

$(MENUGFXDIR_DE)/wordgroup_frame.4bpp: $(MENUGFXDIR_DE)/wordgroup_frame.png
	$(GFX) $< $@ -num_tiles 76

$(MENUGFXDIR_DE)/check_berry.4bpp: $(MENUGFXDIR_DE)/check_berry.png
	$(GFX) $< $@ -num_tiles 97

$(INTROGFXDIR_DE)/copyright.4bpp: $(INTROGFXDIR_DE)/copyright.png
	$(GFX) $< $@ -num_tiles 47

$(TITLEGFXDIR_DE)/press_start.4bpp: $(TITLEGFXDIR_DE)/press_start.png
	$(GFX) $< $@ -num_tiles 41

$(MISCGFXDIR_DE)/end_copyright.4bpp: $(MISCGFXDIR_DE)/end_copyright.png
	$(GFX) $< $@ -num_tiles 92
