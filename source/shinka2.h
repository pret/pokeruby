#include	"shinka.def"

//モーフィングデータ構造体宣言
typedef struct{
//	u8	LineCntB[64];				//進化前データの高さによるライン数
//	u8	SeqNoLeftB[64][32];			//進化前ライン左側のドットのシーケンスナンバー
//	u8	SeqNoRightB[64][32];		//進化前ライン右側のドットのシーケンスナンバー
//	u8	NowLeftPosB[64][32];		//進化前移動中のラインの左側データ
//	u8	NowRightPosB[64][32];		//進化前移動中のラインの右側データ
	u8	LineCntA[64];				//進化後データの高さによるライン数
	u8	SeqNoLeftA[64][32];			//進化後ライン左側のドットのシーケンスナンバー
	u8	SeqNoRightA[64][32];		//進化後ライン右側のドットのシーケンスナンバー
	u8	NowLeftPosA[64][32];		//進化後移動中のラインの左側データ
	u8	NowRightPosA[64][32];		//進化後移動中のラインの右側データ
	u8	EndLeftPosA[64][32];		//進化後移動終了ラインの左側データ
	u8	EndRightPosA[64][32];		//進化後移動終了ラインの右側データ
	u16	LeftMoveV[64][32];
	u16	RightMoveV[64][32];
	u16	LeftMoveVTmp[64][32];
	u16	RightMoveVTmp[64][32];
	u32	MorphAdrs[64][32];			//アドレスワーク
	u8	Wait;
}MORPH_DATA2;

#define	MD2		((MORPH_DATA2 *)&UserWork[0x14800])

#ifndef		__SHINKA2_H__
#define		__SHINKA2_H__
extern	void	InitShinka2(PokemonParam *,u16);
#endif
