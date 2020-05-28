#include	"shinka.def"

//モーフィングデータ構造体宣言
typedef struct{
	u8	BeforeMonsActor;
	u8	AfterMonsActor;
	u8	ShinkaTaskNo;
	u8	Wait;
	u8	BeforeLineCnt[64];			//進化前のデータの高さによるライン数
	u8	AfterLineCnt[64];			//進化後のデータの高さによるライン数
	u8	MoveLineCnt[64];			//移動するラインカウンター
	u8	SeqNoLeft[64][32];			//ライン左側のドットのシーケンスナンバー
	u8	SeqNoRight[64][32];			//ライン右側のドットのシーケンスナンバー
	u8	BeforeLeftPos[64][32];		//進化前のデータのラインの左側ナンバー
	u8	BeforeRightPos[64][32];		//進化前のデータのラインの右側ナンバー
	u8	AfterLeftPos[64][32];		//進化後のデータのラインの左側ナンバー
	u8	AfterRightPos[64][32];		//進化後のデータのラインの右側ナンバー
	u8	NowLeftPos[64][32];			//移動中のラインの左側データ
	u8	NowRightPos[64][32];		//移動中のラインの右側データ
	u32	MorphAdrs[64][32];			//アドレスワーク
	u16	NowLeftV[64][32];			//
	u16	NowRightV[64][32];			//
	u16	NowLeftVTmp[64][32];		//
	u16	NowRightVTmp[64][32];		//
	u8	TotalWait;
}MORPH_DATA;
//size=0xa061byte
//
#define	MD		((MORPH_DATA *)&UserWork[0x14800])

#ifndef		__SHINKA_H__
#define		__SHINKA_H__
extern	pFunc	ShinkaReturnProc;
extern	void	InitShinka(PokemonParam *,u16,u8,u8);
extern	void	InitShinkaAct(PokemonParam *,u16,u8,u8);
extern	void	InitShinkaTuushin(PokemonParam *,u16,u8,u8);
#endif
