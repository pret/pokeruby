#ifndef	__FIGHT_EF_H_
#define	__FIGHT_EF_H_

extern	void	EncountEffectSet(u8);

//==========================================================
//
//	MonsOBJ2BG	ポケモンOBJキャラをBGに展開する
//
// in : posx	表示するBGX位置（セル単位で指定　0～31）
// 		posy	表示するBGY位置（セル単位で指定　0～31）
// 		chr		展開されているDecordAdrsの引数（0～3）
// 		pal		表示するキャラのBGパレットナンバー（0～15）
// 		chradrs		展開先キャラVRAMアドレス（0x0000～0xffff）
// 		scrbase	展開先スクリーンベースブロック（0～31）
// 		chrabase	BGのキャラベースブロック(0～3)
//==========================================================

extern void	MonsOBJ2BG(u8 posx,u8 posy,u8 chr,u8 pal,u16 chradrs,u8 scrbase, u8 chrabase);

//==========================================================
//
//	MonsOBJ2BG2	ポケモンOBJキャラをBGに展開する
//
// in : posx	表示するBGX位置（セル単位で指定　0～31）
// 		posy	表示するBGY位置（セル単位で指定　0～31）
// 		chr		展開されているDecordAdrsの引数（0～3）
// 		pat		アニメーションの何枚目か（0～?）
// 		pal		表示するキャラのBGパレットナンバー（0～15）
// 		chradrs		展開先キャラVRAMアドレス（0x0000～0xffff）
// 		scrbase	展開先スクリーンベースブロック（0～31）
// 		chrabase	BGのキャラベースブロック(0～3)
//==========================================================

extern void	MonsOBJ2BG2(u8 posx,u8 posy,u8 chr,u8 pat,u8 pal,u16 chradrs,u8 scrbase, u8 chrabase);

//==========================================================
//
//	BattleMonsOBJ2BG	ポケモンOBJキャラをBGに展開する(戦闘専用）
//
// in : posx	表示するBGX位置（セル単位で指定　0～31）
// 		posy	表示するBGY位置（セル単位で指定　0～31）
// 		clientno	展開されているDecordAdrsの引数（0～3）ClientNoと同じ
// 		pal		表示するキャラのBGパレットナンバー（0～15）
// 
//==========================================================

extern	void	BattleMonsOBJ2BG(u8 posx,u8 posy,u8 clientno,u8 pal);

#define	BATTLE_CHR_BASE	1
#define	BATTLE_SCR_BASE	30

//==========================================================
//	TaskTableのworkのインデックス
//==========================================================

enum{
	EFF_SEQ=0,
	EFF_EFFNO,
	EFF_WORK0,
	EFF_WORK1,
	EFF_WORK2,
	EFF_WORK3,
	EFF_WORK4,
};

#endif	__FIGHT_EF_H_
