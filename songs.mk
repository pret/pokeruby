MIDI_DIR := sound/songs/midi

$(MIDI_DIR)/%.o: $(MIDI_DIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $*.s

$(MIDI_DIR)/bgm_pokecen.s: $(MIDI_DIR)/bgm_pokecen.mid
	$(MID) $< $@ -G43 -R50

$(MIDI_DIR)/bgm_cycling.s: $(MIDI_DIR)/bgm_cycling.mid
	$(MID) $^ $@ -G46 -R50

$(MIDI_DIR)/bgm_friendly.s: $(MIDI_DIR)/bgm_friendly.mid
	$(MID) $^ $@ -G47 -R50
