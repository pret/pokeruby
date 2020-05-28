#ifndef	__AGBMONS_H_

#define	__AGBMONS_H_

#include	"agbmons.def"

#if 0
enum{
		NORMAL_TYPE=0,		//0
		BATTLE_TYPE,		//1
		HIKOU_TYPE,			//2
		POISON_TYPE,		//3
		JIMEN_TYPE,			//4
		IWA_TYPE,			//5
		MUSHI_TYPE,			//6
		GHOST_TYPE,			//7
		METAL_TYPE,			//8
		HATE_TYPE,			//9
		FIRE_TYPE,			//10
		WATER_TYPE,			//11
		KUSA_TYPE,			//12
		ELECTRIC_TYPE,		//13
		SP_TYPE,			//14
		KOORI_TYPE,			//15
		DRAGON_TYPE,		//16
		AKU_TYPE,			//17
};
#endif

enum{
	COLOR_RED=0,		//赤
	COLOR_BLUE,			//青
	COLOR_YELLOW,		//黄
	COLOR_GREEN,		//緑
	COLOR_BLACK,		//黒
	COLOR_BROWN,		//茶
	COLOR_PERPLE,		//紫
	COLOR_GRAY,			//灰
	COLOR_WHITE,		//白
	COLOR_PINK,			//桃
};

typedef	struct{
	u8		basic_hp;			//基本ＨＰ
	u8		basic_pow;			//基本攻撃力
	u8		basic_def;			//基本防御力
	u8		basic_agi;			//基本素早さ

	u8		basic_spepow;		//基本特殊攻撃力
	u8		basic_spedef;		//基本特殊防御力
	u8		type1;				//属性１
	u8		type2;				//属性２

	u8		get_rate;			//捕獲率
	u8		give_exp;			//贈与経験値

	u16		pains_hp:2;			//贈与努力値ＨＰ
	u16		pains_pow:2;		//贈与努力値攻撃力
	u16		pains_def:2;		//贈与努力値防御力
	u16		pains_agi:2;		//贈与努力値素早さ
	u16		pains_spepow:2;		//贈与努力値特殊攻撃力
	u16		pains_spedef:2;		//贈与努力値特殊防御力
	u16					:4;		//贈与努力値予備

	u16		item1;				//アイテム１
	u16		item2;				//アイテム２

	u8		sex;				//性別ベクトル
	u8		egg_birth;			//タマゴの孵化歩数
	u8		friend;				//なつき度初期値
	u8		grow;				//成長曲線識別

	u8		egg_group1;			//こづくりグループ1
	u8		egg_group2;			//こづくりグループ2
	u8		speabi1;			//特殊能力１
	u8		speabi2;			//特殊能力２

	u8		escape;				//逃げる率
	u8		color	:7;			//色（図鑑で使用）
	u8		reverse	:1;			//反転フラグ
}PokePersonalData;

#endif
