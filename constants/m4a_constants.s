	.equiv ID_NUMBER, 0x68736d53

	.equiv PCM_DMA_BUF_SIZE, 1584

	.macro struct_begin
	.struct 0
	.endm

	.macro struct_field name, size
\name:
	.struct \name + \size
	.endm

	struct_begin
	struct_field o_SoundInfo_ident, 4
	struct_field o_SoundInfo_pcmDmaCounter, 1
	struct_field o_SoundInfo_reverb, 1
	struct_field o_SoundInfo_maxChans, 1
	struct_field o_SoundInfo_masterVolume, 1
	struct_field o_SoundInfo_freq, 1
	struct_field o_SoundInfo_mode, 1
	struct_field o_SoundInfo_c15, 1
	struct_field o_SoundInfo_pcmDmaPeriod, 1
	struct_field o_SoundInfo_maxLines, 1
	struct_field o_SoundInfo_gap, 3
	struct_field o_SoundInfo_pcmSamplesPerVBlank, 4
	struct_field o_SoundInfo_pcmFreq, 4
	struct_field o_SoundInfo_divFreq, 4
	struct_field o_SoundInfo_cgbChans, 4
	struct_field o_SoundInfo_func, 4
	struct_field o_SoundInfo_intp, 4
	struct_field o_SoundInfo_CgbSound, 4
	struct_field o_SoundInfo_CgbOscOff, 4
	struct_field o_SoundInfo_MidiKeyToCgbFreq, 4
	struct_field o_SoundInfo_MPlayJumpTable, 4
	struct_field o_SoundInfo_plynote, 4
	struct_field o_SoundInfo_ExtVolPit, 4
	struct_field o_SoundInfo_gap2, 16
	struct_field o_SoundInfo_chans, 768
	struct_field o_SoundInfo_pcmBuffer, PCM_DMA_BUF_SIZE * 2
	struct_field SoundInfo_size, 0

	struct_begin
	struct_field o_SoundChannel_status, 1
	struct_field o_SoundChannel_type, 1
	struct_field o_SoundChannel_rightVolume, 1
	struct_field o_SoundChannel_leftVolume, 1
	struct_field o_SoundChannel_attack, 1
	struct_field o_SoundChannel_decay, 1
	struct_field o_SoundChannel_sustain, 1
	struct_field o_SoundChannel_release, 1
	struct_field o_SoundChannel_ky, 1
	struct_field o_SoundChannel_ev, 1
	struct_field o_SoundChannel_er, 1
	struct_field o_SoundChannel_el, 1
	struct_field o_SoundChannel_iev, 1
	struct_field o_SoundChannel_iel, 1
	struct_field o_SoundChannel_d1, 1
	struct_field o_SoundChannel_d2, 1
	struct_field o_SoundChannel_gt, 1
	struct_field o_SoundChannel_mk, 1
	struct_field o_SoundChannel_ve, 1
	struct_field o_SoundChannel_pr, 1
	struct_field o_SoundChannel_rp, 1
	struct_field o_SoundChannel_d3, 3
	struct_field o_SoundChannel_ct, 4
	struct_field o_SoundChannel_fw, 4
	struct_field o_SoundChannel_freq, 4
	struct_field o_SoundChannel_wav, 4
	struct_field o_SoundChannel_cp, 4
	struct_field o_SoundChannel_track, 4
	struct_field o_SoundChannel_pp, 4
	struct_field o_SoundChannel_np, 4
	struct_field o_SoundChannel_d4, 4
	struct_field o_SoundChannel_xpi, 2
	struct_field o_SoundChannel_xpc, 2
	struct_field SoundChannel_size, 0

	struct_begin
	struct_field o_MusicPlayerTrack_flags, 1
	struct_field o_MusicPlayerTrack_wai, 1
	struct_field o_MusicPlayerTrack_patP, 1
	struct_field o_MusicPlayerTrack_repN, 1
	struct_field o_MusicPlayerTrack_gat, 1
	struct_field o_MusicPlayerTrack_key, 1
	struct_field o_MusicPlayerTrack_vel, 1
	struct_field o_MusicPlayerTrack_run, 1
	struct_field o_MusicPlayerTrack_keyM, 1
	struct_field o_MusicPlayerTrack_pitM, 1
	struct_field o_MusicPlayerTrack_keyShift, 1
	struct_field o_MusicPlayerTrack_keyShiftX, 1
	struct_field o_MusicPlayerTrack_tune, 1
	struct_field o_MusicPlayerTrack_pitX, 1
	struct_field o_MusicPlayerTrack_bend, 1
	struct_field o_MusicPlayerTrack_bendRange, 1
	struct_field o_MusicPlayerTrack_volMR, 1
	struct_field o_MusicPlayerTrack_volML, 1
	struct_field o_MusicPlayerTrack_vol, 1
	struct_field o_MusicPlayerTrack_volX, 1
	struct_field o_MusicPlayerTrack_pan, 1
	struct_field o_MusicPlayerTrack_panX, 1
	struct_field o_MusicPlayerTrack_modM, 1
	struct_field o_MusicPlayerTrack_mod, 1
	struct_field o_MusicPlayerTrack_modT, 1
	struct_field o_MusicPlayerTrack_lfoSpeed, 1
	struct_field o_MusicPlayerTrack_lfoSpeedC, 1
	struct_field o_MusicPlayerTrack_lfoDelay, 1
	struct_field o_MusicPlayerTrack_lfoDelayC, 1
	struct_field o_MusicPlayerTrack_priority, 1
	struct_field o_MusicPlayerTrack_echoVolume, 1
	struct_field o_MusicPlayerTrack_echoLength, 1
	struct_field o_MusicPlayerTrack_chan, 4
	struct_field o_MusicPlayerTrack_ToneData_type, 1
	struct_field o_MusicPlayerTrack_ToneData_key, 1
	struct_field o_MusicPlayerTrack_ToneData_length, 1
	struct_field o_MusicPlayerTrack_ToneData_pan_sweep, 1
	struct_field o_MusicPlayerTrack_ToneData_wav, 4
	struct_field o_MusicPlayerTrack_ToneData_attack, 1
	struct_field o_MusicPlayerTrack_ToneData_decay, 1
	struct_field o_MusicPlayerTrack_ToneData_sustain, 1
	struct_field o_MusicPlayerTrack_ToneData_release, 1
	struct_field o_MusicPlayerTrack_gap, 10
	struct_field o_MusicPlayerTrack_unk_3A, 2
	struct_field o_MusicPlayerTrack_unk_3C, 4
	struct_field o_MusicPlayerTrack_cmdPtr, 4
	struct_field o_MusicPlayerTrack_patS, 12
	struct_field MusicPlayerTrack_size, 0
