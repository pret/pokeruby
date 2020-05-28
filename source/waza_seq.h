extern	u32	WazaEffectTbl[];

//======================================================
//	特殊技シーケンス
//======================================================

extern	void	WAZA_KizetsuA(void);
extern	void	WAZA_KizetsuD(void);
extern	void	WAZA_Win(void);
extern	void	WAZA_Lose(void);
extern	void	WAZA_TrainerWin(void);
extern	void	WAZA_TuushinWin(void);
extern	void	WAZA_BattleTowerWin(void);
extern	void	WAZA_ItemEscape(void);
extern	void	WAZA_SpeabiEscape(void);
extern	void	WAZA_Escape(void);
extern	void	WAZA_EnemyEscape(void);
extern	void	WAZA_TrainerEscape(void);
extern	void	WAZA_EscapeNG(void);
extern	void	WAZA_EscapeNG2(void);
extern	void	WAZA_SafariBallThrowNG(void);
extern	void	WAZA_PokeReshuffle(void);
extern	void	WAZA_PokeAppear(void);
extern	void	WAZA_Wait(void);
extern	void	WAZA_LevelUp(void);
//extern	void	WAZA_LevelUpA(void);
//extern	void	WAZA_LevelUpD(void);
extern	void	WAZA_GetEXP(void);
extern	void	WAZA_Zenmetsu(void);
extern	void	WAZA_Umakukimaran(void);
extern	void	WAZA_NormalNohit(void);
extern	void	WAZA_NormalNohitWait(void);
extern	void	WAZA_NormalNohit2(void);
extern	void	WAZA_HitCalc(void);
extern	void	WAZA_HitCalcOnly(void);
extern	void	WAZA_Hit(void);

extern	void	WAZA_OrderIgnoreSleep(void);
extern	void	WAZA_OrderIgnore(void);
extern	void	WAZA_Namakeru(void);
extern	void	WAZA_Hirune(void);
extern	void	WAZA_OwnAttack(void);

extern	void	WAZA_MigawariKizetsu(void);
extern	void	WAZA_BlankMsg(void);
extern	void	WAZA_WazaEnd(void);

//======================================================
//	天候シーケンス
//======================================================

extern	void	WAZA_Amefuri(void);
extern	void	WAZA_AmefuriEnd(void);
extern	void	WAZA_WeatherDamage(void);
extern	void	WAZA_WeatherDamageEnd(void);
extern	void	WAZA_Hare(void);
extern	void	WAZA_HareEnd(void);
extern	void	WAZA_FieldWeather(void);

//======================================================
//	フィールドコンディションシーケンス
//======================================================

extern	void	WAZA_ReflecEnd(void);
extern	void	WAZA_Shinpi(void);
extern	void	WAZA_ShinpiEnd(void);

//======================================================
//	技効果シーケンス
//======================================================

extern	void	WAZA_Yadorigi(void);
extern	void	WAZA_Gaman(void);
extern	void	WAZA_GamanOff(void);
extern	void	WAZA_GamanFaild(void);
extern	void	WAZA_Hukitobashi(void);
extern	void	WAZA_Shiroikiri(void);
extern	void	WAZA_CondUpMsg(void);
extern	void	WAZA_CondUpTsuikaMsg(void);
extern	void	WAZA_CondDownMsg(void);
extern	void	WAZA_CondDownTsuikaMsg(void);
extern	void	WAZA_Ikari(void);
extern	void	WAZA_Kanashibari(void);
extern	void	WAZA_Kanashibari2(void);
extern	void	WAZA_KanashibariEnd(void);
extern	void	WAZA_EncoreEnd(void);
extern	void	WAZA_Michidure(void);
extern	void	WAZA_MakibishiA(void);
extern	void	WAZA_MakibishiD(void);
extern	void	WAZA_MakibishiK(void);
extern	void	WAZA_Horobinoutaing(void);
extern	void	WAZA_Horobinouta(void);
extern	void	WAZA_Genshinochikara(void);
extern	void	WAZA_Kousokuspin(void);
extern	void	WAZA_ShimeEscape(void);
extern	void	WAZA_YadorigiEscape(void);
extern	void	WAZA_MakibishiEscape(void);
extern	void	WAZA_Miraiyochi(void);
extern	void	WAZA_Waruagaki(void);
extern	void	WAZA_PPNone(void);
extern	void	WAZA_PPNoneAttack(void);
extern	void	WAZA_Ichamon(void);
extern	void	WAZA_Ichamon2(void);
extern	void	WAZA_KiaiPunch(void);
extern	void	WAZA_Chouhatsu(void);
extern	void	WAZA_Chouhatsu2(void);
extern	void	WAZA_Mamoru(void);
extern	void	WAZA_Negaigoto(void);
extern	void	WAZA_Newoharu(void);
extern	void	WAZA_Bakadikara(void);
extern	void	WAZA_Hatakiotosu(void);
extern	void	WAZA_Huuin(void);
extern	void	WAZA_Huuin2(void);
extern	void	WAZA_Onnen(void);
extern	void	WAZA_MagicCort(void);
extern	void	WAZA_Yokodori(void);
extern	void	WAZA_Koraeta(void);
extern	void	WAZA_Kaifuku(void);
extern	void	WAZA_Mantan(void);
extern	void	WAZA_Ichigeki(void);
extern	void	WAZA_OverHeat(void);
extern	void	WAZA_Handou(void);

//======================================================
//	ポケモン状態異常シーケンス
//======================================================

extern	void	WAZA_Nemuru(void);
extern	void	WAZA_Mezame(void);
extern	void	WAZA_SawaguMezame(void);
extern	void	WAZA_Doku(void);
extern	void	WAZA_Dokudoku(void);
extern	void	WAZA_Yakedo(void);
extern	void	WAZA_Koori(void);
extern	void	WAZA_Melt(void);
extern	void	WAZA_Melt2(void);
extern	void	WAZA_Mahi(void);
extern	void	WAZA_Hirumu(void);
extern	void	WAZA_Sawagu(void);
extern	void	WAZA_AbareruEnd(void);
extern	void	WAZA_Konran(void);
extern	void	WAZA_KonranEnd(void);
extern	void	WAZA_Nekonikoban(void);
extern	void	WAZA_Shime(void);
extern	void	WAZA_ShimeEnd(void);
extern	void	WAZA_Meromero(void);
extern	void	WAZA_MeromeroNext(void);
extern	void	WAZA_Akumu(void);
//extern	void	WAZA_KaengurumaMelt(void);
//extern	void	WAZA_Kaenguruma(void);
extern	void	WAZA_Noroi(void);
extern	void	WAZA_NoMahi(void);

//======================================================
//	技追加効果シーケンス
//======================================================

extern	void	WAZA_AddNemuri(void);
extern	void	WAZA_AddNemuri2(void);
extern	void	WAZA_AddDoku(void);
extern	void	WAZA_AddYakedo(void);
extern	void	WAZA_AddKoori(void);
extern	void	WAZA_AddMahi(void);
extern	void	WAZA_AddSawagu(void);
extern	void	WAZA_AddDokudoku(void);
extern	void	WAZA_AddNekonikoban(void);
extern	void	WAZA_AddShime(void);
extern	void	WAZA_AddKonran(void);
extern	void	WAZA_AddHanekaeri(void);
extern	void	WAZA_AddDorobou(void);

//======================================================
//	特殊能力シーケンス
//======================================================

extern	void	WAZA_Amehurashi(void);
extern	void	WAZA_Kasokusouti(void);
extern	void	WAZA_Ganzyou(void);
extern	void	WAZA_Shimerike(void);
extern	void	WAZA_Tikuden(void);
extern	void	WAZA_Tyosui(void);
extern	void	WAZA_TikudenPPDec(void);
extern	void	WAZA_TyosuiPPDec(void);
extern	void	WAZA_Hensyoku(void);
extern	void	WAZA_Hensyoku(void);
extern	void	WAZA_Juunan(void);
extern	void	WAZA_Donkan(void);
extern	void	WAZA_Meneki(void);
extern	void	WAZA_Mypace(void);
extern	void	WAZA_Moraibi(void);
extern	void	WAZA_MoraibiPPDec(void);
extern	void	WAZA_Ikaku(void);
extern	void	WAZA_IkakuAct(void);
extern	void	WAZA_ClearBody(void);
extern	void	WAZA_Samehada(void);
extern	void	WAZA_Housi(void);
extern	void	WAZA_Dokunotoge(void);
extern	void	WAZA_Sinkuro(void);
extern	void	WAZA_Seidenki(void);
extern	void	WAZA_Trace(void);
extern	void	WAZA_Bouon(void);
extern	void	WAZA_Ameukezara(void);
extern	void	WAZA_Sunaokosi(void);
extern	void	WAZA_Honoonokarada(void);
extern	void	WAZA_Surudoime(void);
extern	void	WAZA_Kairikibasami(void);
extern	void	WAZA_MeromeroBody(void);
extern	void	WAZA_Nentyaku(void);
extern	void	WAZA_Dappi(void);
extern	void	WAZA_Tenkiya(void);
extern	void	WAZA_Tenkiya2(void);
extern	void	WAZA_Hideri(void);
extern	void	WAZA_Hiraishin(void);
extern	void	WAZA_Mizunobeeru(void);
extern	void	WAZA_Seisinryoku(void);

extern	void	WAZA_NOKaifuku(void);
extern	void	WAZA_NOKaifukuPPDec(void);

extern	void	WAZA_SpeabiNoJoutaiijou(void);

//======================================================
//	装備アイテムシーケンス
//======================================================

extern	void	WAZA_ItemNoMahi(void);
extern	void	WAZA_ItemNoDoku(void);
extern	void	WAZA_ItemNoYakedo(void);
extern	void	WAZA_ItemNoKoori(void);
extern	void	WAZA_ItemNoNemuri(void);
extern	void	WAZA_ItemNoKonran(void);
extern	void	WAZA_ItemNoJoutaiijou(void);
extern	void	WAZA_ItemAbiKaifuku(void);
extern	void	WAZA_ItemNoMahi2(void);
extern	void	WAZA_ItemNoDoku2(void);
extern	void	WAZA_ItemNoYakedo2(void);
extern	void	WAZA_ItemNoKoori2(void);
extern	void	WAZA_ItemNoNemuri2(void);
extern	void	WAZA_ItemNoKonran2(void);
extern	void	WAZA_ItemNoJoutaiijou2(void);
extern	void	WAZA_ItemAbiKaifuku2(void);

extern	void	WAZA_ItemHPKaifuku(void);
extern	void	WAZA_ItemPPKaifuku(void);
extern	void	WAZA_ItemHPKaifukuEveryTurn(void);
extern	void	WAZA_ItemHPKaifukuEveryTurn2(void);
extern	void	WAZA_ItemOnaziWazaOnly(void);
extern	void	WAZA_ItemKoraeta(void);
extern	void	WAZA_ItemHPKaifukuKonran(void);
extern	void	WAZA_ItemCondUp(void);
extern	void	WAZA_ItemCriticalUp(void);

//======================================================
//	通信時アラートメッセージ
//======================================================

extern	void	WAZA_DouguAlert(void);

