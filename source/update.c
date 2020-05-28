//******************************************************************
//          update.c                                                  
//                                                                  
//          Copyright (C) 2001 GAME FREAK inc.
//******************************************************************
#include	"common.h"
#include	"intr.h"
#include	"actor.h"
#include	"actanm.h"
#include	"palanm.h"
#include	"task.h"
#include	"print.h"
#include	"task.h"
#include	"poketool.h"
#include	"decord.h"
#include	"objdata.h"
#include	"menu.h"
#include	"window.h"
#include	"saveload.h"
#include	"namein.h"
#include	"fld_main.h"
#include	"fld_eff.h"
#include	"mystatus.h"
#include	"cli_ef.h"
#include	"mus_tool.h"
#include	"ex_load.h"

static void put_msg( void );
/********************************************************************/
/*                                                                  */
/*				外部データによるレポート変更処理					*/
/*                                                                  */
/********************************************************************/
u8		UpDateReport(u8* updata)
{
	u8 res;
	res = RunExtraData(updata);

	switch ( res ) {
		case EXRUN_RET_NORMAL_END:
			return 0;
		case EXRUN_RET_ERROR_END:
			SePlay( SE_BOO );
			return 1;

		case EXRUN_RET_NORMAL_MSG_END:
			put_msg();
			return 0;

		case EXRUN_RET_ERROR_MSG_END:
			SePlay( SE_BOO );
			put_msg();
			return 1;
	}
	return	0;
}

static void put_msg( void )
{
	NMenuWinBoxWrite( 2, 14,27, 19);
	NMenuMsgWrite(MsgExpandBuffer,3,15);
}

