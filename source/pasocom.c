
//======================================================
//		pasocom.c                                           
//                                                      
//    Copyright (C) 2001 GAME FREAK inc.
//======================================================

#include "common.h"
#include "intr.h"		//add
#include "task.h"		//add
#include "param.h"		//add
#include "pasocom.h"	//add nohara
#include "fntequ.h"

POKEBOX_SAVE_DATA  BoxData = {};
/*
u8 CurrentBoxNo = 0;  //現在選択しているボックスのナンバー
PokemonPasoParam PPPBox[BOX_KAZU][BOX_PM_KAZU]={};//ボックスの領域を確保
u8 PasoBoxName[BOX_KAZU][BOXNAME_MAX+1] = {};  // ボックス名  2001/09/26 taya
u8 BoxBGNumber[BOX_KAZU] = {};                 // ボックスＢＧナンバー 2001/09/27 taya
*/

//======================================================
//	
//======================================================
void SaveBoxData( POKEBOX_SAVE_DATA * box )
{
	*box = BoxData;
#if 0
	int i,j;

	box->CurrentBoxNo = CurrentBoxNo;
	for( i=0; i<BOX_KAZU; i++ )
		for( j=0; j<BOX_PM_KAZU; j++ )
			box->PPPBox[i][j] = PPPBox[i][j];
	for( i=0; i<BOX_KAZU; i++ )
		for( j=0; j<BOXNAME_MAX+1; j++ )
			box->PasoBoxName[i][j] = PasoBoxName[i][j]; 
	for( i=0; i<BOX_KAZU; i++ )
		box->BoxBGNumber[i] = BoxBGNumber[i];
#endif
}

void LoadBoxData( POKEBOX_SAVE_DATA * box )
{
	BoxData = *box;

#if 0
	int i,j;

	CurrentBoxNo = box->CurrentBoxNo;
	for( i=0; i<BOX_KAZU; i++ )
		for( j=0; j<BOX_PM_KAZU; j++ )
			PPPBox[i][j] = box->PPPBox[i][j];
	for( i=0; i<BOX_KAZU; i++ )
		for( j=0; j<BOXNAME_MAX+1; j++ )
			PasoBoxName[i][j] = box->PasoBoxName[i][j]; 
	for( i=0; i<BOX_KAZU; i++ )
		BoxBGNumber[i] = box->BoxBGNumber[i];
#endif
}


