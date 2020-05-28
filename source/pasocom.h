//-------------------------------------------------------------
//				パソコンボックスのdefine
//-------------------------------------------------------------
#ifndef  _PASOCOM_H_
#define  _PASOCOM_H_

#include "param.h"

#define YOKO_KAZU	(6)			//横に何体ポケ表示するか
#define TATE_KAZU	(5)			//縦に何体ポケ表示するか
#define BOX_KAZU	(14)		//ボックスの数
#define BOX_PM_KAZU (YOKO_KAZU*TATE_KAZU)//一つのボックスのポケの数 
#define PM_TAIHI	(BOX_PM_KAZU*2)//BoxPMStructの一番後ろ
#define BOXNAME_MAX  (8)


typedef struct{
	u8 CurrentBoxNo;
	PokemonPasoParam	PPPBox[BOX_KAZU][BOX_PM_KAZU];
	u8 BoxName[BOX_KAZU][9];
	u8 BGNum[BOX_KAZU];
}POKEBOX_SAVE_DATA;

extern POKEBOX_SAVE_DATA  BoxData;

/*
extern u8 CurrentBoxNo;		//現在選択しているボックスのナンバー
extern PokemonPasoParam	PPPBox[BOX_KAZU][BOX_PM_KAZU];//ボックスの領域を確保
extern u8 PasoBoxName[BOX_KAZU][BOXNAME_MAX+1];
extern u8 BoxBGNumber[BOX_KAZU];
*/

extern void SaveBoxData( POKEBOX_SAVE_DATA * box );
extern void LoadBoxData( POKEBOX_SAVE_DATA * box );

#endif

