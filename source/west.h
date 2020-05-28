
@======================================================
@	west.h
@======================================================

	.text
	.code 32

@======================================================
@	技エフェクトの動作シーケンス命令macro
@======================================================

	.MACRO	INIT_CMD
DEF_CMD_COUNT	=	0
	.ENDM

	.MACRO	DEF_CMD	symname
\symname	=	DEF_CMD_COUNT
DEF_CMD_COUNT 	=	(DEF_CMD_COUNT + 1)
	.ENDM

	INIT_CMD
	DEF_CMD	PRI0
	DEF_CMD	PRI1
	DEF_CMD	PRI2
	DEF_CMD	PRI3
	DEF_CMD	PRI4
	DEF_CMD	PRI5
	DEF_CMD	PRI6
	DEF_CMD	PRI7
	DEF_CMD	PRI8
	DEF_CMD	PRI9
	DEF_CMD	PRI10
	DEF_CMD	PRI11
	DEF_CMD	PRI12
	DEF_CMD	PRI13
	DEF_CMD	PRI14

	INIT_CMD
	DEF_CMD	WEST_CHAR_SET
	DEF_CMD	WEST_CHAR_DEL
	DEF_CMD	WEST_ADD_ACTOR
	DEF_CMD	WEST_ADD_TASK
	DEF_CMD	WEST_WAIT
	DEF_CMD	WEST_WAIT_FLAG
	DEF_CMD	WEST_LOOP_LABEL
	DEF_CMD	WEST_LOOP
	DEF_CMD	WEST_SEQEND
	DEF_CMD	WEST_SE
	DEF_CMD	WEST_POKEBG
	DEF_CMD	WEST_POKEBG_RESET
	DEF_CMD	WEST_BLDALPHA_SET
	DEF_CMD	WEST_BLDALPHA_RESET
	DEF_CMD	WEST_SEQ_CALL
	DEF_CMD	WEST_END_CALL
	DEF_CMD	WEST_WORK_SET
	DEF_CMD	WEST_TURN_CHK
	DEF_CMD	WEST_TURN_JP
	DEF_CMD	WEST_SEQ_JP
	DEF_CMD	WEST_HAIKEI_CHG
	DEF_CMD	WEST_HAIKEI_RECOVER
	DEF_CMD	WEST_HAIKEI_HALF_WAIT
	DEF_CMD	WEST_HAIKEI_CHG_WAIT
	DEF_CMD	WEST_HAIKEI_SET
	DEF_CMD	WEST_SEPLAY_PAN
	DEF_CMD	WEST_SEPAN
	DEF_CMD	WEST_SEPAN_FLOW
	DEF_CMD	WEST_SE_REPEAT
	DEF_CMD	WEST_SE_WAITPLAY
	DEF_CMD	WEST_BLDCNT_SET
	DEF_CMD	WEST_SE_TASK
	DEF_CMD WEST_SEWAIT_FLAG
	DEF_CMD	WEST_WORKCHK_JP
	DEF_CMD	WEST_POKEBG_DROP
	DEF_CMD	WEST_POKEBG_DROP_RESET
	DEF_CMD	WEST_CONTEST_CHK_JP
	DEF_CMD	WEST_HAIKEI_CHKCHG
	DEF_CMD	WEST_SEPAN_FLOWFIX
	DEF_CMD	WEST_SEPAN_FLOW_AF
	DEF_CMD	WEST_BGPRI_GAPSET
	DEF_CMD	WEST_BGPRI_GAPSET2
	DEF_CMD	WEST_BGPRI_GAPSET3
	DEF_CMD	WEST_POKE_BANISH_ON
	DEF_CMD	WEST_POKE_BANISH_OFF
	DEF_CMD	WEST_PARTY_ATTACK_BGOFF
	DEF_CMD	WEST_PARTY_ATTACK_BGEND
	DEF_CMD	WEST_SE_STOP
	

@キャラセットマクロ
	.macro	CHAR_SET	chrID
	.byte	WEST_CHAR_SET			@命令コードナンバー
	.short	\chrID
	.endm

@キャラリセットマクロ
	.macro	CHAR_DEL	chrID
	.byte	WEST_CHAR_DEL			@命令コードナンバー
	.short	\chrID
	.endm
	
@AddActorマクロ
	.macro	ADD_ACTOR	adrs,pri,cnt,p0,p1,p2,p3,p4,p5,p6,p7
	.byte	WEST_ADD_ACTOR			@命令コードナンバー
	.long	\adrs
	.byte	\pri
	.byte	\cnt
	.short	\p0
.if	\cnt>1
	.short	\p1
.endif
.if	\cnt>2
	.short	\p2
.endif
.if	\cnt>3
	.short	\p3
.endif
.if	\cnt>4
	.short	\p4
.endif
.if	\cnt>5
	.short	\p5
.endif
.if	\cnt>6
	.short	\p6
.endif
.if	\cnt>7
	.short	\p7
.endif
	.endm

@AddTaskマクロ
	.macro	ADD_TASK	adrs,pri,cnt,p0,p1,p2,p3,p4,p5,p6,p7
	.byte	WEST_ADD_TASK			@命令コードナンバー
	.long	\adrs
	.byte	\pri
	.byte	\cnt
	.short	\p0
.if	\cnt>1
	.short	\p1
.endif
.if	\cnt>2
	.short	\p2
.endif
.if	\cnt>3
	.short	\p3
.endif
.if	\cnt>4
	.short	\p4
.endif
.if	\cnt>5
	.short	\p5
.endif
.if	\cnt>6
	.short	\p6
.endif
.if	\cnt>7
	.short	\p7
.endif
	.endm

@Waitマクロ(カウンタ)
	.macro	WAIT		time
	.byte	WEST_WAIT				@命令コードナンバー
	.byte	\time
	.endm

@Waitマクロ(フラグ)
	.macro	WAIT_FLAG
	.byte	WEST_WAIT_FLAG			@命令コードナンバー
	.endm

@LoopLabelSetマクロ
	.macro	LOOP_LABEL
	.byte	WEST_LOOP_LABEL			@命令コードナンバー
	.endm

@Loopマクロ
	.macro	LOOP
	.byte	WEST_LOOP				@命令コードナンバー
	.endm

@SeqEndマクロ
	.macro	SEQEND
	.byte	WEST_SEQEND				@命令コードナンバー
	.endm

@SEマクロ
	.macro	SE		seID
	.byte	WEST_SE					@命令コードナンバー
	.short	\seID
	.endm

@POKEBGマクロ
	.macro	POKEBG	flag
	.byte	WEST_POKEBG
	.byte	\flag
	.endm

@POKEBG_RESETマクロ
	.macro	POKEBG_RESET	flag
	.byte	WEST_POKEBG_RESET
	.byte	\flag
	.endm

@BLDALPHA_SETマクロ
	.macro	BLDALPHA_SET	eva,evb
	.byte	WEST_BLDALPHA_SET
	.byte	\eva
	.byte	\evb
	.endm

@BLDALPHA_RESETマクロ
	.macro	BLDALPHA_RESET
	.byte	WEST_BLDALPHA_RESET
	.endm

@SEQ_CALLマクロ
	.macro	SEQ_CALL	adrs
	.byte	WEST_SEQ_CALL
	.long	\adrs
	.endm

@END_CALLマクロ
	.macro	END_CALL
	.byte	WEST_END_CALL
	.endm

@WORK_SETマクロ
	.macro	WORK_SET	soeji,work
	.byte	WEST_WORK_SET
	.byte	\soeji
	.short	\work
	.endm

@TURN_CHKマクロ
	.macro	TURN_CHK	adrs1,adrs2
	.byte	WEST_TURN_CHK
	.long	\adrs1
	.long	\adrs2
	.endm

@TURN_JPマクロ
	.macro	TURN_JP		turn,adrs
	.byte	WEST_TURN_JP			@命令コードナンバー
	.byte	\turn					@指定ターン
	.long	\adrs
	.endm

@SEQ_JPマクロ
	.macro	SEQ_JP	adrs
	.byte	WEST_SEQ_JP
	.long	\adrs
	.endm

@HAIKEI_CHGマクロ
	.macro	HAIKEI_CHG	map_id
	.byte	WEST_HAIKEI_CHG
	.byte	\map_id
	.endm

@HAIKEI_RECOVERマクロ
	.macro	HAIKEI_RECOVER
	.byte	WEST_HAIKEI_RECOVER
	.endm

@HAIKEI_HALF_WAITマクロ
	.macro	HAIKEI_HALF_WAIT
	.byte	WEST_HAIKEI_HALF_WAIT
	.endm

@HAIKEI_CHG_WAITマクロ
	.macro	HAIKEI_CHG_WAIT
	.byte	WEST_HAIKEI_CHG_WAIT
	.endm

@WEST_HAIKEI_SETマクロ
	.macro	HAIKEI_SET	map_id
	.byte	WEST_HAIKEI_SET
	.byte	\map_id
	.endm

@SEPLAY_PANマクロ
	.macro	SEPLAY_PAN	seID,pan
	.byte	WEST_SEPLAY_PAN					@命令コードナンバー
	.short	\seID
	.byte	\pan
	.endm

@SEPANマクロ
	.macro	SEPAN	pan
	.byte	WEST_SEPAN					@命令コードナンバー
	.byte	\pan
	.endm

@SEPAN_FLOWマクロ
	.macro	SEPAN_FLOW	seID,start_pan,end_pan,add_pan,wait
	.byte	WEST_SEPAN_FLOW					@命令コードナンバー
	.short	\seID
	.byte	\start_pan
	.byte	\end_pan
	.byte	\add_pan
	.byte	\wait
	.endm

@SE_REPEATマクロ
	.macro	SE_REPEAT	seID,pan,wait,repeat
	.byte	WEST_SE_REPEAT					@命令コードナンバー
	.short	\seID
	.byte	\pan
	.byte	\wait
	.byte	\repeat
	.endm

@SE_WAITPLAYマクロ
	.macro	SE_WAITPLAY	seID,pan,wait
	.byte	WEST_SE_WAITPLAY					@命令コードナンバー
	.short	\seID
	.byte	\pan
	.byte	\wait
	.endm

@BLDCNT_SETマクロ
	.macro	BLDCNT_SET	work
	.byte	WEST_BLDCNT_SET
	.short	\work
	.endm

@SE用のAddTaskマクロ
	.macro	SE_TASK		adrs,cnt,p0,p1,p2,p3,p4,p5,p6,p7
	.byte	WEST_SE_TASK			@命令コードナンバー
	.long	\adrs
	.byte	\cnt
	.short	\p0
.if	\cnt>1
	.short	\p1
.endif
.if	\cnt>2
	.short	\p2
.endif
.if	\cnt>3
	.short	\p3
.endif
.if	\cnt>4
	.short	\p4
.endif
.if	\cnt>5
	.short	\p5
.endif
.if	\cnt>6
	.short	\p6
.endif
.if	\cnt>7
	.short	\p7
.endif
	.endm

@SE_WAITマクロ(フラグ)
	.macro	SE_WAIT_FLAG
	.byte	WEST_SEWAIT_FLAG			@命令コードナンバー
	.endm

@WORKCHK_JPマクロ
	.macro	WORKCHK_JP		soeji,num,adrs
	.byte	WEST_WORKCHK_JP			@命令コードナンバー
	.byte	\soeji
	.short	\num					@比較する値
	.long	\adrs
	.endm

@POKEBG_DROPマクロ
	.macro	POKEBG_DROP			flag
	.byte	WEST_POKEBG_DROP
	.byte	\flag
	.endm

@POKEBG_DROP_RESETマクロ
	.macro	POKEBG_DROP_RESET	flag
	.byte	WEST_POKEBG_DROP_RESET
	.byte	\flag
	.endm

@CONTEST_CHK_JPマクロ
	.macro	CONTEST_CHK_JP	adrs
	.byte	WEST_CONTEST_CHK_JP
	.long	\adrs
	.endm

@HAIKEI_CHKCHGマクロ
	.macro	HAIKEI_CHKCHG	mine_haikei,enemy_haikei,contest_haikei
	.byte	WEST_HAIKEI_CHKCHG
	.byte	\mine_haikei
	.byte	\enemy_haikei
	.byte	\contest_haikei
	.endm

@SEPAN_FLOWFIXマクロ
	.macro	SEPAN_FLOWFIX	seID,start_pan,end_pan,add_pan,wait
	.byte	WEST_SEPAN_FLOWFIX					@命令コードナンバー
	.short	\seID
	.byte	\start_pan
	.byte	\end_pan
	.byte	\add_pan
	.byte	\wait
	.endm

@SEPAN_FLOW_AFマクロ
	.macro	SEPAN_FLOW_AF	seID,start_pan,end_pan,add_pan,wait
	.byte	WEST_SEPAN_FLOW_AF					@命令コードナンバー
	.short	\seID
	.byte	\start_pan
	.byte	\end_pan
	.byte	\add_pan
	.byte	\wait
	.endm

@BGPRI_GAPSETマクロ
	.macro	BGPRI_GAPSET		which
	.byte	WEST_BGPRI_GAPSET
	.byte	\which
	.endm

@BGPRI_GAPSET2マクロ
	.macro	BGPRI_GAPSET2
	.byte	WEST_BGPRI_GAPSET2
	.endm

@BGPRI_GAPSET3マクロ
	.macro	BGPRI_GAPSET3		which
	.byte	WEST_BGPRI_GAPSET3
	.byte	\which
	.endm

@POKE_BANISH_ONマクロ
	.macro	POKE_BANISH_ON		client
	.byte	WEST_POKE_BANISH_ON
	.byte	\client
	.endm

@POKE_BANISH_OFFマクロ
	.macro	POKE_BANISH_OFF		client
	.byte	WEST_POKE_BANISH_OFF
	.byte	\client
	.endm

@PARTY_ATTACK_BGOFFマクロ
	.macro	PARTY_ATTACK_BGOFF		which
	.byte	WEST_PARTY_ATTACK_BGOFF
	.byte	\which
	.endm

@PARTY_ATTACK_BGENDマクロ
	.macro	PARTY_ATTACK_BGEND		which
	.byte	WEST_PARTY_ATTACK_BGEND
	.byte	\which
	.endm

@SE_STOPマクロ
	.macro	SE_STOP
	.byte	WEST_SE_STOP			@命令コードナンバー
	.endm

