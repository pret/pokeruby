#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "a_mine.h"
#include "a_enemy.h"
#include "madefine.h"
#include "decord.h"
#include "client_t.h"

#define __OBJDATA_H_
#include "objdata.h"

//const u32 DecordAdrs[]={0x2008000,0x200a000,0x200c000,0x200e000};
const	actAnmData actAnmTransDataTableB[] =
{
	{(void *)0x2008000+(0x20*64)* 0,0x20*64},
	{(void *)0x2008000+(0x20*64)* 1,0x20*64},
	{(void *)0x2008000+(0x20*64)* 2,0x20*64},
	{(void *)0x2008000+(0x20*64)* 3,0x20*64},
};
const	actAnmData actAnmTransDataTableF[] =
{
	{(void *)0x200a000+(0x20*64)* 0,0x20*64},
	{(void *)0x200a000+(0x20*64)* 1,0x20*64},
	{(void *)0x200a000+(0x20*64)* 2,0x20*64},
	{(void *)0x200a000+(0x20*64)* 3,0x20*64},
};

const	actAnmData actAnmTransDataTableB2[] =
{
	{(void *)0x200c000+(0x20*64)* 0,0x20*64},
	{(void *)0x200c000+(0x20*64)* 1,0x20*64},
	{(void *)0x200c000+(0x20*64)* 2,0x20*64},
	{(void *)0x200c000+(0x20*64)* 3,0x20*64},
};
const	actAnmData actAnmTransDataTableF2[] =
{
	{(void *)0x200e000+(0x20*64)* 0,0x20*64},
	{(void *)0x200e000+(0x20*64)* 1,0x20*64},
	{(void *)0x200e000+(0x20*64)* 2,0x20*64},
	{(void *)0x200e000+(0x20*64)* 3,0x20*64},
};

const actAnm DummyActAnm0[]={
	{0, 0, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

const actAnm DummyActAnm1[]={
	{3, 0, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

#include "pm_aff.dat"	//add matsuda 01/05/21
#include "pm2tbl.h"
#include "pm2fsize.h"
#include "pm2fenum.h"
#include "pm2fcell.h"
#include "pm2bsize.h"
#include "pm2benum.h"
#include "pm2bcell.h"
#include "pm2ncol.h"
#include "pm2rcol.h"
#include "trfanm.h"
#include "trftbl.h"
#include "trfact.h"
#include "trfsize.h"
#include "trfenum.h"
#include "trfcell.h"
#include "trfcol.h"
#include "trbanm.h"
#include "trbtbl.h"
#include "trbact.h"
#include "trbsize.h"
#include "trbenum.h"
#include "trbcell.h"
#include "trbcol.h"
#include "pokeyofs.h"

