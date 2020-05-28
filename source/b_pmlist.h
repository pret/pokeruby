#ifndef __B_PMLIST_H__
#define __B_PMLIST_H__


extern void BattlePokeListInit(u8);
extern void BattleListWorkInit(void);
extern void BagBattlePokeListInit(void);
extern u8 GetListRow(u8 pos);

extern void RemakeListRowNext(void);
extern void ListRowInitCommon(u8 *listbuf, u8 side);
extern void ServerListRowInit(u8 client_no, u8 side);
extern void ListRowExChange(u8 client_no, u8 selmons_no, u8 side);

extern void ChangeListRow(u8 pos1, u8 pos2);
extern u8 SearchListRow(u8 pokepara_pos);

//----------------------------------------------------------
//	ÉOÉçÅ[ÉoÉãïœêî
//----------------------------------------------------------
extern u8 ListRow[3];




#endif	//__B_PMLIST_H__
