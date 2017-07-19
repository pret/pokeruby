MIDI_DIR := sound/songs/midi

$(MIDI_DIR)/%.o: $(MIDI_DIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $*.s

$(MIDI_DIR)/bgm_pokecen.s: $(MIDI_DIR)/bgm_pokecen.mid
	$(MID) $< $@ -G43 -R50

$(MIDI_DIR)/bgm_cycling.s: $(MIDI_DIR)/bgm_cycling.mid
	$(MID) $^ $@ -G46 -R50

$(MIDI_DIR)/bgm_dooro_x3.s: $(MIDI_DIR)/bgm_dooro_x3.mid
	$(MID) $^ $@ -G011 -R50

$(MIDI_DIR)/bgm_machi_s2.s: $(MIDI_DIR)/bgm_machi_s2.mid
	$(MID) $^ $@ -G012 -R50

$(MIDI_DIR)/bgm_dooro_x4.s: $(MIDI_DIR)/bgm_dooro_x4.mid
	$(MID) $^ $@ -G018 -R50

$(MIDI_DIR)/bgm_fune_kan.s: $(MIDI_DIR)/bgm_fune_kan.mid
	$(MID) $^ $@ -G020 -R50

$(MIDI_DIR)/bgm_me_shinka.s: $(MIDI_DIR)/bgm_me_shinka.mid
	$(MID) $^ $@ -G023 -R50

$(MIDI_DIR)/bgm_boyeye.s: $(MIDI_DIR)/bgm_boyeye.mid
	$(MID) $^ $@ -G025 -R50

$(MIDI_DIR)/bgm_test1.s: $(MIDI_DIR)/bgm_test1.mid
	$(MID) $^ $@ -G036 -R50

$(MIDI_DIR)/bgm_test2.s: $(MIDI_DIR)/bgm_test2.mid
	$(MID) $^ $@ -G037 -R50

$(MIDI_DIR)/bgm_test4.s: $(MIDI_DIR)/bgm_test4.mid
	$(MID) $^ $@ -G039 -R50

$(MIDI_DIR)/bgm_friendly.s: $(MIDI_DIR)/bgm_friendly.mid
	$(MID) $^ $@ -G047 -R50

$(MIDI_DIR)/bgm_minamo.s: $(MIDI_DIR)/bgm_minamo.mid
	$(MID) $^ $@ -G051 -R50

$(MIDI_DIR)/bgm_ashroad.s: $(MIDI_DIR)/bgm_ashroad.mid
	$(MID) $^ $@ -G052 -R50

$(MIDI_DIR)/bgm_girl_sup.s: $(MIDI_DIR)/bgm_girl_sup.mid
	$(MID) $^ $@ -G058 -R50

$(MIDI_DIR)/bgm_tsuretek.s: $(MIDI_DIR)/bgm_tsuretek.mid
	$(MID) $^ $@ -G063 -R50

$(MIDI_DIR)/bgm_boy_sup.s: $(MIDI_DIR)/bgm_boy_sup.mid
	$(MID) $^ $@ -G064 -R50

$(MIDI_DIR)/bgm_c_road.s: $(MIDI_DIR)/bgm_c_road.mid
	$(MID) $^ $@ -G072 -R50

$(MIDI_DIR)/bgm_ajito.s: $(MIDI_DIR)/bgm_ajito.mid
	$(MID) $^ $@ -G073 -R50

$(MIDI_DIR)/bgm_m_dungon.s: $(MIDI_DIR)/bgm_m_dungon.mid
	$(MID) $^ $@ -G075 -R50

$(MIDI_DIR)/bgm_machupi.s: $(MIDI_DIR)/bgm_machupi.mid
	$(MID) $^ $@ -G077 -R50

$(MIDI_DIR)/bgm_contest0.s: $(MIDI_DIR)/bgm_contest0.mid
	$(MID) $^ $@ -G083 -R50

$(MIDI_DIR)/bgm_hutago.s: $(MIDI_DIR)/bgm_hutago.mid
	$(MID) $^ $@ -G092 -R50

$(MIDI_DIR)/bgm_yama_eye.s: $(MIDI_DIR)/bgm_yama_eye.mid
	$(MID) $^ $@ -G094 -R50

$(MIDI_DIR)/bgm_conlobby.s: $(MIDI_DIR)/bgm_conlobby.mid
	$(MID) $^ $@ -G095 -R50
