//=========================================================================
//
//	システム用スクリプトファイル
//
//=========================================================================

//-------------------------------------------------------------------------
//	簡易メッセージ表示システム
//	<引数>	レジスタ０にメッセージアドレスが入ってくる
//-------------------------------------------------------------------------
EasyObjMessageScript:
	_TALK_OBJ_START
	_TALKMSG	0x00
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_OBJ_END
	_RET

EasyBgMessageScript:
	_TALK_START
	_TALKMSG	0x00
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_END
	_RET

MessageWaitKeyScript:
	_TALKMSG	0x00
	_TALK_WAIT
	_AB_KEYWAIT
	_RET

MessageYesNoScript:
	_TALKMSG	0x00
	_TALK_WAIT
	_YES_NO_NORMAL_WIN
	_RET

//-------------------------------------------------------------------------
//
//-------------------------------------------------------------------------
PickItemScript:
	_RET

//-------------------------------------------------------------------------
//	セーブの流れ
//	<戻り値>	ANSWORK
//	== TRUE		セーブ成功
//	== FALSE	キャンセル・セーブ失敗
//-------------------------------------------------------------------------
SCRIPT_LABEL	FieldSaveScript
	_PROGRAM	SAVE_INTERFACE
	_STOP_SCRIPT

	_RET


//=========================================================================
//
//		トレーナー動作スクリプト
//
//=========================================================================

//-------------------------------------------------------------------------
//視線ヒットによる動作開始
//-------------------------------------------------------------------------
SCRIPT_LABEL	TrainerMoveScript

	_TRAINER_OBJ_START
	_PROGRAM			TR_BGM_SET
	_PROGRAM			TR_MOVE_CTRL
	_STOP_SCRIPT
	_JUMP				TrainerBattleScript


//-------------------------------------------------------------------------
// トレーナーへの話し掛け
//-------------------------------------------------------------------------
SCRIPT_LABEL	TrainerTalkScript

	_TALK_OBJ_START
	_SET_OBJ_ANIME		TARGET_OBJ,_trn_anm_appear
	_OBJ_ANIME_WAIT
	_FUNC_CALL			ANSWORK,TR_FLAG_CHECK
	_IFVAL_JUMP			ANSWORK,NE,0,_trn_after_fight

	_PROGRAM			TR_BGM_SET
	_PROGRAM			TR_STOP_OBJMOVE		@動作コードを静止状態にする
	_JUMP				TrainerBattleScript

//	すでに戦闘した場合
_trn_after_fight:
	_TRAINER_AFTER
	

//-------------------------------------------------------------------------
//	2vs2対戦専用トレーナー
//-------------------------------------------------------------------------
SCRIPT_LABEL	Trainer2vs2Script
	_TALK_OBJ_START
	_CALL				TrainerAppearScript
	_FUNC_CALL			ANSWORK,TR_FLAG_CHECK
	_IFVAL_JUMP			ANSWORK,NE,0,_trn_2vs_after_fight

	_PROGRAM			POKE2VS2_CHK
	_IFVAL_JUMP			ANSWORK,NE,0,_trn_2vs2_no_fight

	_PROGRAM			TR_BGM_SET
	_PROGRAM			TR_STOP_OBJMOVE		@動作コードを静止状態にする
	_JUMP				TrainerBattleScript

_trn_2vs2_no_fight:
	_PROGRAM			TR_NOFIGHT_MSG
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_OBJ_END
	_END

_trn_2vs_after_fight:
	_TRAINER_AFTER


//-------------------------------------------------------------------------
//	イベントトレーナー
//-------------------------------------------------------------------------
SCRIPT_LABEL	TrainerEventScript
	_SET_OBJ_ANIME		TARGET_OBJ,_trn_anm_appear
	_OBJ_ANIME_WAIT
	_PROGRAM			TR_BGM_SET

	_TRAINER_FIGHT

	_TRAINER_AFTER

//-------------------------------------------------------------------------
//	再戦トレーナー
//-------------------------------------------------------------------------
SCRIPT_LABEL	TrainerRevengeScript
	_CALL				TrainerAppearScript

	_FUNC_CALL			ANSWORK,TR_REV_FLAG_CHK
	_IFVAL_JUMP			ANSWORK,EQ,FALSE,_trn_after_revenge_fight

	_PROGRAM			TR_BGM_SET
	_PROGRAM			TR_STOP_OBJMOVE		@動作コードを静止状態にする
	_PROGRAM			TR_BEFORE_MSG
	_TALK_WAIT
	_AB_KEYWAIT
	_PROGRAM			TR_REV_FIGHT
	_STOP_SCRIPT

	/* 対戦に勝った場合、以下も実行される */
	_TALK_END
	_END

_trn_after_revenge_fight:
	_TRAINER_AFTER

//-------------------------------------------------------------------------
//	2vs2再戦トレーナー
//-------------------------------------------------------------------------
SCRIPT_LABEL	Trainer2vs2RevengeScript
	_FUNC_CALL			ANSWORK,TR_REV_FLAG_CHK
	_IFVAL_JUMP			ANSWORK,EQ,FALSE,_trn_after_2vs2revenge_fight

	_PROGRAM			POKE2VS2_CHK
	_IFVAL_JUMP			ANSWORK,NE,0,_trn_2vs2revenge_no_fight

	_PROGRAM			TR_BGM_SET
	_PROGRAM			TR_STOP_OBJMOVE		@動作コードを静止状態にする
	_PROGRAM			TR_BEFORE_MSG
	_TALK_WAIT
	_AB_KEYWAIT
	_PROGRAM			TR_REV_FIGHT
	_STOP_SCRIPT

	/* 対戦に勝った場合、以下も実行される */
	_TALK_END
	_END

_trn_after_2vs2revenge_fight:
	_TRAINER_AFTER

_trn_2vs2revenge_no_fight:
	_PROGRAM			TR_NOFIGHT_MSG
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_OBJ_END
	_END


//-------------------------------------------------------------------------
//	隠れ蓑処理
//-------------------------------------------------------------------------
TrainerAppearScript:
	_SET_OBJ_ANIME		TARGET_OBJ,_trn_anm_appear
	_OBJ_ANIME_WAIT
	_RET

//	隠れ状態解除アニメ
_trn_anm_appear:
	.byte	AC_HIDE_PULLOFF
	.byte	ACMD_END

//-------------------------------------------------------------------------
//	トレーナー対戦処理
//-------------------------------------------------------------------------
TrainerBattleScript:
	_PROGRAM			TR_BEFORE_MSG
	_TALK_WAIT
	_AB_KEYWAIT
	_TRAINER_FIGHT
	/* 対戦に勝った場合、以下も実行される */

	_FUNC_CALL			ANSWORK,TR_TYPE_GET
	_IFVAL_JUMP			ANSWORK,EQ,TR_TYPE_NORMAL,_normal_after_fight
	_IFVAL_JUMP			ANSWORK,EQ,TR_TYPE_EVENT,_event_after_fight
	_IFVAL_JUMP			ANSWORK,EQ,TR_TYPE_LEADER,_event_after_fight
	_IFVAL_JUMP			ANSWORK,EQ,TR_TYPE_EVENT2VS2,_event_after_fight
	_IFVAL_JUMP			ANSWORK,EQ,TR_TYPE_LEADER2VS2,_event_after_fight

_normal_after_fight:
	_TALK_END
	_END

_event_after_fight:
	_TRAINER_BATTLE_END_SCRIPT


//-------------------------------------------------------------------------
// トレーナー話し掛け用
//-------------------------------------------------------------------------
SCRIPT_LABEL	TrainerEasyMsgScript
	_TALKMSG	0x00
	_TALK_WAIT
	_AB_KEYWAIT
	_TALK_OBJ_END
	_RET


