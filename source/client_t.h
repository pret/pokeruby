
#ifndef __CLIENT_T_H__
#define __CLIENT_T_H__

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void PokemonFObjCellPalSet(PokemonParam *pp, u8 client_no);
extern void PokemonBObjCellPalSet(PokemonParam *pp, u8 client_no);
extern void PokemonFObjCellPalDel(u16 pokeno);
extern void PokemonBObjCellPalDel(u16 pokeno);
extern void TrainerFObjCellPalSet(u16 trainer_no, u8);
extern void TrainerBObjCellPalSet(u16 trainer_no, u8);
extern void TrainerBObjCellPalDel(u16 trainer_no);
extern void TrainerFObjCellPalDel(u16 trainer_no);
extern void BattleGaugeCellPalSet(void);
extern void BattleGaugeTransWram(u8 flg);
extern u8 BattleGaugeCellPalDivSet(u8 trans_no);
extern u8 ClientDivInit(u8 *counter, u8 *counter2);
extern void ClientSystemWorkInit(void);
extern void ClientSystemWorkInitAll(void);
extern void PokeBanishMemory(void);
extern void HensinChrChange(u8 my_client, u8 target_client, u8 flg);
extern void PinchSeCheckPlay(PokemonParam *pp, u8 client_no);
extern void PinchSeStop(void);
extern void PokeClientBanishMemory(u8 client_no);
extern void PinchSeCheckStop(void);
extern void MigawariChrChange(u8 client_no, u8 decord_flg);
extern void MigawariChange(u8 client_no, u8 decord_flg, u8 poke);
extern void MigawariFlgCheckSet(u8 client_no, u16 wazano);
extern void MigawariFlgReset(u8 client_no);
extern void PokeAffineON_OFF(u8 on_off);
extern void PokeShadowSeq(actWork *xreg);
extern void PokeShadowBanishSeq(actWork *xreg);
extern void PokeShadowSeqSet(u8 client_no, u16 monsno);
extern void PokeShadowBanishSeqSet(u8 client_no);
extern void PokeShadowAllDataSet(void);
extern void BattleWinPaint(void);
extern void ClientPokeSysFlagClear(u8 client_no, u8);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const CellData MBSmokeCell;
extern const PalData MBSmokePal;
extern const actHeader MBSmokeHeader;
extern const actAffAnm *BallPokeAffTbl[];

extern const u32 DecordAdrs[];

#endif	//__CLIENT_T_H__
