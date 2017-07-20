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

$(MIDI_DIR)/se_pc_logon.s: $(MIDI_DIR)/se_pc_logon.mid
	$(MID) $^ $@ -G110 -R50 -P5

$(MIDI_DIR)/se_select.s: $(MIDI_DIR)/se_select.mid
	$(MID) $^ $@ -G110 -R50 -P5

$(MIDI_DIR)/se_jitensya.s: $(MIDI_DIR)/se_jitensya.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_nigeru.s: $(MIDI_DIR)/se_nigeru.mid
	$(MID) $^ $@ -G110 -R50 -P5

$(MIDI_DIR)/se_jido_doa.s: $(MIDI_DIR)/se_jido_doa.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_bowa.s: $(MIDI_DIR)/se_bowa.mid
	$(MID) $^ $@ -G110 -R50 -P4

$(MIDI_DIR)/se_seikai.s: $(MIDI_DIR)/se_seikai.mid
	$(MID) $^ $@ -G110 -R50 -P4

$(MIDI_DIR)/se_exp.s: $(MIDI_DIR)/se_exp.mid
	$(MID) $^ $@ -G111 -R50 -P5

$(MIDI_DIR)/se_ru_hyuu.s: $(MIDI_DIR)/se_ru_hyuu.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_track_move.s: $(MIDI_DIR)/se_track_move.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_kon.s: $(MIDI_DIR)/se_kon.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_kon2.s: $(MIDI_DIR)/se_kon2.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_kon3.s: $(MIDI_DIR)/se_kon3.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_kon4.s: $(MIDI_DIR)/se_kon4.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_nageru.s: $(MIDI_DIR)/se_nageru.mid
	$(MID) $^ $@ -G111 -R50 -P5

$(MIDI_DIR)/se_t_ame_e.s: $(MIDI_DIR)/se_t_ame_e.mid
	$(MID) $^ $@ -G111 -R50 -P2

$(MIDI_DIR)/se_t_ooame_e.s: $(MIDI_DIR)/se_t_ooame_e.mid
	$(MID) $^ $@ -G111 -R50 -P2

$(MIDI_DIR)/se_t_koame_e.s: $(MIDI_DIR)/se_t_koame_e.mid
	$(MID) $^ $@ -G111 -R50 -P2

$(MIDI_DIR)/se_tamakoro.s: $(MIDI_DIR)/se_tamakoro.mid
	$(MID) $^ $@ -G111 -R50 -P2

$(MIDI_DIR)/se_tamakoro_e.s: $(MIDI_DIR)/se_tamakoro_e.mid
	$(MID) $^ $@ -G111 -R50 -P2

$(MIDI_DIR)/se_c_maku_u.s: $(MIDI_DIR)/se_c_maku_u.mid
	$(MID) $^ $@ -G111 -R50 -P5

$(MIDI_DIR)/se_c_maku_d.s: $(MIDI_DIR)/se_c_maku_d.mid
	$(MID) $^ $@ -G111 -R50 -P5

$(MIDI_DIR)/se_c_pasi.s: $(MIDI_DIR)/se_c_pasi.mid
	$(MID) $^ $@ -G111 -R50 -P5

$(MIDI_DIR)/se_w233b.s: $(MIDI_DIR)/se_w233b.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w015.s: $(MIDI_DIR)/se_w015.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w081.s: $(MIDI_DIR)/se_w081.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w016.s: $(MIDI_DIR)/se_w016.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w025.s: $(MIDI_DIR)/se_w025.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w172b.s: $(MIDI_DIR)/se_w172b.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w059.s: $(MIDI_DIR)/se_w059.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w019.s: $(MIDI_DIR)/se_w019.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w029.s: $(MIDI_DIR)/se_w029.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w057.s: $(MIDI_DIR)/se_w057.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w250.s: $(MIDI_DIR)/se_w250.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w039.s: $(MIDI_DIR)/se_w039.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w146.s: $(MIDI_DIR)/se_w146.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w185.s: $(MIDI_DIR)/se_w185.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w076.s: $(MIDI_DIR)/se_w076.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w100.s: $(MIDI_DIR)/se_w100.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w107.s: $(MIDI_DIR)/se_w107.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w199.s: $(MIDI_DIR)/se_w199.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/se_w253.s: $(MIDI_DIR)/se_w253.mid
	$(MID) $^ $@ -G111 -R50 -P4

$(MIDI_DIR)/bgm_battle27.s: $(MIDI_DIR)/bgm_battle27.mid
	$(MID) $^ $@ -G100 -R50 -P1

$(MIDI_DIR)/bgm_battle32.s: $(MIDI_DIR)/bgm_battle32.mid
	$(MID) $^ $@ -G103 -R50 -P1

$(MIDI_DIR)/bgm_battle36.s: $(MIDI_DIR)/bgm_battle36.mid
	$(MID) $^ $@ -G105 -R50 -P1

$(MIDI_DIR)/bgm_battle34.s: $(MIDI_DIR)/bgm_battle34.mid
	$(MID) $^ $@ -G106 -R50 -P1

$(MIDI_DIR)/bgm_battle35.s: $(MIDI_DIR)/bgm_battle35.mid
	$(MID) $^ $@ -G107 -R50 -P1

$(MIDI_DIR)/bgm_battle38.s: $(MIDI_DIR)/bgm_battle38.mid
	$(MID) $^ $@ -G108 -R50 -P1
