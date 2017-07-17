SONG_DIR := sound/songs

$(SONG_DIR)/bgm_pokecen.s: $(SONG_DIR)/bgm_pokecen.mid
	$(MID) $^ $@ -G43 -R50
