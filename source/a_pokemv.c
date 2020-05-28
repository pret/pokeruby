//=========================================================================
//	
//	‹ZƒGƒtƒFƒNƒg‚ğ‚·‚é‚Éƒ|ƒPƒ‚ƒ“‚ğ“®‚©‚·Ù°Áİ
//												by matsuda 2001.08.31(‹à)
//=========================================================================
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"

#include "wazatool.h"
#include "waza_dat.h"
#include "server.h"
#include "bss.h"
#include "waza_eff.h"
#include "calctool.h"
#include "task.h"
#include "fight.h"



//----------------------------------------------------------
//	ƒvƒƒgƒ^ƒCƒvéŒ¾
//----------------------------------------------------------
static void TaskPokeBuruburuMain(u8 id);
static void TaskPokeKurukuruMain(u8 id);

void SeqWazaTaiatariInit(actWork *Xreg);
void SeqWazaTaiatariReturn(actWork *Xreg);
void SeqWazaHaneruInit(actWork *Xreg);
void SeqWazaHaneruReturn(actWork *Xreg);
static void SeqWazaPokeDefaultMove(actWork *Xreg);
static void SeqWazaPokeDefaultMain(actWork *Xreg);
static void SeqWazaPokeStraightMove(actWork *Xreg);
static void SeqWazaPokeStraightMove2(actWork *Xreg);
static void TaskPokeCenterBuruMain(u8 id);
static void PokeSinBackWait(u8 id);
static void PokeSinBackMain(u8 id);
static void TaskPokeBuruDownMain(u8 id);

//----------------------------------------------------------
//	’è”éŒ¾
//----------------------------------------------------------

//----------------------------------------------------------
//	ƒAƒNƒ^[ƒe[ƒuƒ‹
//----------------------------------------------------------
const	actHeader ActTaiatariHeader={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaTaiatariInit,
};
const	actHeader ActHaneruHeader={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHaneruInit,
};
const	actHeader ActPokeDefaultMoveHeader={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaPokeDefaultMove,
};
const	actHeader ActPokeStraightMoveHeader={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaPokeStraightMove,
};

const	actHeader ActPokeStraightMove2Header={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaPokeStraightMove2,
};

//=========================================================================
//	ƒ^ƒXƒNƒV[ƒPƒ“ƒX
//=========================================================================

//=========================================================================
//	‚»‚Ìê‚Åƒuƒ‹ƒuƒ‹
//=========================================================================
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤	2=UŒ‚‘¤‘Š•û  3=–hŒä‘¤‘Š•û
//		  1:XU‚è•  2:YU‚è•  3:‰ñ”  4:wait
//-------------------------------------------------------------
void TaskPokeBuruburu(u8 id)
{
	u8 poke;
	
	poke = W_GetPokeActNo(WazaEffWork[0]);
	if(poke == 0xff){
		DelTaskEffect(id);
		return;
	}

	ActWork[poke].dx = WazaEffWork[1];
	ActWork[poke].dy = WazaEffWork[2];
	TaskTable[id].work[0] = poke;
	TaskTable[id].work[1] = WazaEffWork[3];
	TaskTable[id].work[2] = WazaEffWork[4];
	TaskTable[id].work[3] = WazaEffWork[4];
	TaskTable[id].work[4] = WazaEffWork[1];
	TaskTable[id].work[5] = WazaEffWork[2];
	TaskTable[id].TaskAdrs = TaskPokeBuruburuMain;
	TaskTable[id].TaskAdrs(id);
}
static void TaskPokeBuruburuMain(u8 id)
{
	if(TaskTable[id].work[3] == 0)
	{
		if(ActWork[TaskTable[id].work[0]].dx == 0)
			ActWork[TaskTable[id].work[0]].dx = TaskTable[id].work[4];
		else
			ActWork[TaskTable[id].work[0]].dx = 0;
		if(ActWork[TaskTable[id].work[0]].dy == 0)
			ActWork[TaskTable[id].work[0]].dy = TaskTable[id].work[5];
		else
			ActWork[TaskTable[id].work[0]].dy = 0;
		TaskTable[id].work[3] = TaskTable[id].work[2];
		TaskTable[id].work[1]--;

		if(TaskTable[id].work[1] == 0)
		{
			ActWork[TaskTable[id].work[0]].dx = 0;
			ActWork[TaskTable[id].work[0]].dy = 0;
			DelTaskEffect(id);
		}
	}
	else
		TaskTable[id].work[3]--;
}

//=========================================================================
//	‚»‚Ìê‚Åƒuƒ‹ƒuƒ‹2
//	¡‚ÌêŠ‚ğ’†S‚É‚µ‚Äƒuƒ‹ƒuƒ‹“®‚­
//=========================================================================
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤	2=UŒ‚‘¤‘Š•û  3=–hŒä‘¤‘Š•û
//			4=–¡•û‘¤1 5=–¡•û‘¤2 6=“G‘¤1 7=“G‘¤2
//			8=©”šê—p(€‚ñ‚Å‚Ä‚àAttackNo‚ÌÎß¹Óİ‚ğ—h‚ç‚·)
//		  1:XU‚è•(”¼Œa)  2:YU‚è•(”¼Œa)  3:‰ñ”  4:wait
//-------------------------------------------------------------
void TaskPokeCenterBuru(u8 id)
{
	u8 poke;
	u8 end = 0;
	u8 client_no;
	
	if(WazaEffWork[0] < 4){
		poke = W_GetPokeActNo(WazaEffWork[0]);
		if(poke == 0xff)
			end = 1;
	}
	else if(WazaEffWork[0] != 8){
		switch(WazaEffWork[0]){
			case 4:
				client_no = ClientNoGet(BSS_CLIENT_MINE);
				break;
			case 5:
				client_no = ClientNoGet(BSS_CLIENT_MINE2);
				break;
			case 6:
				client_no = ClientNoGet(BSS_CLIENT_ENEMY);
				break;
			case 7:
			default:
				client_no = ClientNoGet(BSS_CLIENT_ENEMY2);
				break;
		}
		if(PokeBG2taimeCheck(client_no) == 0)
			end = 1;
		poke = PokemonStruct[client_no];
	}
	else{
		poke = PokemonStruct[AttackNo];
	}
	
	if(end){
		DelTaskEffect(id);
		return;
	}

	ActWork[poke].dx = WazaEffWork[1];
	ActWork[poke].dy = WazaEffWork[2];
	TaskTable[id].work[0] = poke;
	TaskTable[id].work[1] = WazaEffWork[3];
	TaskTable[id].work[2] = WazaEffWork[4];
	TaskTable[id].work[3] = WazaEffWork[4];
	TaskTable[id].work[4] = WazaEffWork[1];
	TaskTable[id].work[5] = WazaEffWork[2];
	TaskTable[id].TaskAdrs = TaskPokeCenterBuruMain;
	TaskTable[id].TaskAdrs(id);
}
static void TaskPokeCenterBuruMain(u8 id)
{
	if(TaskTable[id].work[3] == 0)
	{
		if(ActWork[TaskTable[id].work[0]].dx == TaskTable[id].work[4])
			ActWork[TaskTable[id].work[0]].dx = -TaskTable[id].work[4];
		else
			ActWork[TaskTable[id].work[0]].dx = TaskTable[id].work[4];
		if(ActWork[TaskTable[id].work[0]].dy == TaskTable[id].work[5])
			ActWork[TaskTable[id].work[0]].dy = -TaskTable[id].work[5];
		else
			ActWork[TaskTable[id].work[0]].dy = TaskTable[id].work[5];
		TaskTable[id].work[3] = TaskTable[id].work[2];
		TaskTable[id].work[1]--;

		if(TaskTable[id].work[1] == 0)
		{
			ActWork[TaskTable[id].work[0]].dx = 0;
			ActWork[TaskTable[id].work[0]].dy = 0;
			DelTaskEffect(id);
		}
	}
	else
		TaskTable[id].work[3]--;
}
//=========================================================================
//	‚»‚Ìê‚Åƒuƒ‹ƒuƒ‹‚R
//	¡‚ÌêŠ‚ğ’†S‚É‚µ‚Äƒuƒ‹ƒuƒ‹“®‚­idx, dy ’l‚ğ•Û‚·‚éj
//=========================================================================
static void TaskPokeCenterBuru2Main(u8 id);
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤	2=UŒ‚‘¤‘Š•û  3=–hŒä‘¤‘Š•û
//		  1:XU‚è•(”¼Œa)  2:YU‚è•(”¼Œa)  3:‰ñ”  4:wait
//-------------------------------------------------------------
void TaskPokeCenterBuru2(u8 id)
{
	u8 poke;
	
	poke = W_GetPokeActNo(WazaEffWork[0]);
	if(poke == 0xff){
		DelTaskEffect(id);
		return;
	}

	ActWork[poke].dx += WazaEffWork[1];
	ActWork[poke].dy += WazaEffWork[2];
	TaskTable[id].work[0] = poke;
	TaskTable[id].work[1] = 0;
	TaskTable[id].work[2] = WazaEffWork[3];
	TaskTable[id].work[3] = 0;
	TaskTable[id].work[4] = WazaEffWork[4];
	TaskTable[id].work[5] = WazaEffWork[1] * 2;
	TaskTable[id].work[6] = WazaEffWork[2] * 2;
	TaskTable[id].TaskAdrs = TaskPokeCenterBuru2Main;
	TaskTable[id].TaskAdrs(id);
}
static void TaskPokeCenterBuru2Main(u8 id)
{
	if(TaskTable[id].work[3] == 0)
	{
		if(TaskTable[id].work[1] & 1){
			ActWork[TaskTable[id].work[0]].dx += TaskTable[id].work[5];
			ActWork[TaskTable[id].work[0]].dy += TaskTable[id].work[6];
		}else{
			ActWork[TaskTable[id].work[0]].dx -= TaskTable[id].work[5];
			ActWork[TaskTable[id].work[0]].dy -= TaskTable[id].work[6];
		}

		TaskTable[id].work[3] = TaskTable[id].work[4];
		TaskTable[id].work[1]++;

		if(TaskTable[id].work[1] >= TaskTable[id].work[2])
		{
			if(TaskTable[id].work[1] & 1){
				ActWork[TaskTable[id].work[0]].dx += (TaskTable[id].work[5] / 2);
				ActWork[TaskTable[id].work[0]].dy += (TaskTable[id].work[6] / 2);
			}else{
				ActWork[TaskTable[id].work[0]].dx -= (TaskTable[id].work[5] / 2);
				ActWork[TaskTable[id].work[0]].dy -= (TaskTable[id].work[6] / 2);
			}
			DelTaskEffect(id);
		}
	}
	else
		TaskTable[id].work[3]--;
}

//=========================================================================
//	‰¡—h‚ê‚Å‚Ô‚é‚Ô‚é‚³‚¹‚È‚ª‚çA‰º‚É‚³‚°‚Ä‚¢‚­
//=========================================================================
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤	  1:XU‚è•  2:wait
//		@3:‰º‚É‰º‚°‚é‘¬“x(ŒÅ’è­”)	4:SyncNum
//-------------------------------------------------------------
void TaskPokeBuruDown(u8 id)
{
	u8 poke;
	
	poke = W_GetPokeActNo(WazaEffWork[0]);
	ActWork[poke].dx = WazaEffWork[1];
	TaskTable[id].work[0] = poke;
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];	//wait
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = WazaEffWork[4];	//sync
	TaskTable[id].TaskAdrs = TaskPokeBuruDownMain;
	TaskTable[id].TaskAdrs(id);
}
static void TaskPokeBuruDownMain(u8 id)
{
	u8 poke;
	s16 offset;
	
	poke = TaskTable[id].work[0];
	offset = TaskTable[id].work[1];
	if(TaskTable[id].work[2] == TaskTable[id].work[8]++)
	{
		TaskTable[id].work[8] = 0;

		if(ActWork[poke].dx == offset)
			offset = -offset;	//ˆÚ“®•ûŒü”½“]
		ActWork[poke].dx += offset;
	}
	TaskTable[id].work[1] = offset;

	TaskTable[id].work[9] += TaskTable[id].work[3];
	ActWork[poke].dy = TaskTable[id].work[9] >> 8;
	
	if(--TaskTable[id].work[4] == 0)
		DelTaskEffect(id);
}


//=========================================================================
//	‰~‚ğ•`‚­“®‚«
//=========================================================================
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤
//		  1:XU‚è•  2:YU‚è•   3:‰ñ”  4:‘¬“x(’x:0`5:‘¬)
//-------------------------------------------------------------
void TaskPokeKurukuru(u8 id)
{
	u8 poke;
	u8 speed = 1;
	u8 i;
	
	poke = W_GetPokeActNo(WazaEffWork[0]);
	
	if(WazaEffWork[4] > 5)
		WazaEffWork[4] = 5;
	for(i = 0; i < WazaEffWork[4]; i++)
		speed *= 2;
	
	TaskTable[id].work[0] = poke;
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = speed;
	TaskTable[id].TaskAdrs = TaskPokeKurukuruMain;
	TaskTable[id].TaskAdrs(id);
}

static void TaskPokeKurukuruMain(u8 id)
{
	u8 poke;

	poke = TaskTable[id].work[0];

	ActWork[poke].dx = SinMove(TaskTable[id].work[5], TaskTable[id].work[1]);
	ActWork[poke].dy = -CosMove(TaskTable[id].work[5], TaskTable[id].work[2]);
	ActWork[poke].dy += TaskTable[id].work[2];
	TaskTable[id].work[5] = 0xff & (TaskTable[id].work[5] + TaskTable[id].work[4]);
	if(TaskTable[id].work[5] == 0)
		TaskTable[id].work[3]--;
	if(TaskTable[id].work[3] == 0)
	{
		ActWork[poke].dx = 0;
		ActWork[poke].dy = 0;
		DelTaskEffect(id);
	}
}

//=========================================================================
//	‰~‚ğ•`‚­“®‚«2  UŒ‚‘¤‚Æ–hŒä‘¤‚ÅXU‚è•‚Ì”½“]‚ğs‚¤
//=========================================================================
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤
//		  1:XU‚è•  2:YU‚è•   3:‰ñ”  4:‘¬“x(’x:0`5:‘¬)
//-------------------------------------------------------------
void TaskPokeKurukuruFlip(u8 id)
{
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[1] = -WazaEffWork[1];
	TaskPokeKurukuru(id);
}



/*---------
//=========================================================================
//	’µ‚Ë‚Ü‚­‚é
//=========================================================================
//-------------------------------------------------------------
// offset 0:0=UŒ‚‘¤  1=–hŒä‘¤
//		  1:XU‚è•  2:YU‚è•   3:‰ñ”  4:‘¬“x(’x:0`5:‘¬)
//-------------------------------------------------------------
void TaskPokeKurukuru(u8 id)
{
	u8 poke;
	u8 speed = 1;
	u8 i;
	
	poke = W_GetPokeActNo(WazaEffWork[0]);
	
	if(WazaEffWork[4] > 5)
		WazaEffWork[4] = 5;
	for(i = 0; i < WazaEffWork[4]; i++)
		speed *= 2;
	
	TaskTable[id].work[0] = poke;
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = speed;
	TaskTable[id].TaskAdrs = TaskPokeKurukuruMain;
	TaskTable[id].TaskAdrs(id);
}

static void TaskPokeKurukuruMain(u8 id)
{
	u8 poke;
	
	poke = TaskTable[id].work[0];
	
	ActWork[poke].dx = SinMove(TaskTable[id].work[5], TaskTable[id].work[1]);
	ActWork[poke].dy = -CosMove(TaskTable[id].work[5], TaskTable[id].work[2]);
	ActWork[poke].dy += TaskTable[id].work[2];
	TaskTable[id].work[5] = 0xff & (TaskTable[id].work[5] + TaskTable[id].work[4]);
	if(TaskTable[id].work[5] == 0)
		TaskTable[id].work[3]--;
	if(TaskTable[id].work[3] == 0)
	{
		ActWork[poke].dx = 0;
		ActWork[poke].dy = 0;
		DelTaskEffect(id);
	}
}
----------------*/






//-------------------------------------------------------------
//		ƒAƒNƒ^[ƒV[ƒPƒ“ƒX
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:Ù°Ìß‰ñ”  1:ˆÚ“®‘¬“x
//-------------------------------------------------------------
void SeqWazaTaiatariInit(actWork *Xreg)
{
	Xreg->banish = 1;
	
	if(MineEnemyCheck(AttackNo))
		Xreg->work[1] = -WazaEffWork[1];
	else
		Xreg->work[1] = WazaEffWork[1];
	
	Xreg->work[0] = WazaEffWork[0];
	Xreg->work[2] = 0;
	Xreg->work[3] = PokemonStruct[AttackNo];
	Xreg->work[4] = WazaEffWork[0];	//BackUp
	SetWorkSeq(Xreg, SeqWazaTaiatariReturn);
	Xreg->move = W_PokeParallelMoveSeq;
}

//----------------------------------------------------------
//	
//----------------------------------------------------------
void SeqWazaTaiatariReturn(actWork *Xreg)
{
	Xreg->work[0] = Xreg->work[4];
	Xreg->work[1] = -Xreg->work[1];
	Xreg->move = W_PokeParallelMoveSeq;
	SetWorkSeq(Xreg, DelWazaEffect);
}


//=========================================================================
//	‚Í‚Ë‚é
//=========================================================================

//-------------------------------------------------------------
// offset 0:Ù°Ìß‰ñ”  1:ˆÚ“®‘¬“x	2: 0=UŒ‚‘¤ 1=–hŒä‘¤
//-------------------------------------------------------------
void SeqWazaHaneruInit(actWork *Xreg)
{
	u8 SelectStruct;
	
	Xreg->banish = 1;

	SelectStruct = W_GetPokeActNo(WazaEffWork[2]);
	
	Xreg->work[0] = WazaEffWork[0];
	Xreg->work[1] = 0;
	Xreg->work[2] = WazaEffWork[1];
	Xreg->work[3] = SelectStruct;
	Xreg->work[4] = WazaEffWork[0];	//BackUp
	SetWorkSeq(Xreg, SeqWazaHaneruReturn);
	Xreg->move = W_PokeParallelMoveSeq;
}

//----------------------------------------------------------
//	
//----------------------------------------------------------
void SeqWazaHaneruReturn(actWork *Xreg)
{
	Xreg->work[0] = Xreg->work[4];
	Xreg->work[2] = -Xreg->work[2];
	Xreg->move = W_PokeParallelMoveSeq;
	SetWorkSeq(Xreg, DelWazaEffect);
}


//=========================================================================
//	Îß¹Óİ‚ğ’èˆÊ’u‚É–ß‚·
// offset 0: 0=UŒ‚‘¤   1=–hŒä‘¤
//	      1:‘ÎÛ(0=X&Y 1=X 2=Y)		
//        2:X‚É‘Î‚µ‚Ä‰½Sync‚ÌÙ°Ìß‚ÅŒ³‚É–ß‚·‚©
//=========================================================================
static void SeqWazaPokeDefaultMove(actWork *Xreg)
{
	u8 actno;
	
	if(WazaEffWork[0] == 0)
		actno = PokemonStruct[AttackNo];
	else
		actno = PokemonStruct[DefenceNo];
	
	Xreg->work[0] = WazaEffWork[2];
	Xreg->work[1] = ActWork[actno].x + ActWork[actno].dx;
	Xreg->work[2] = ActWork[actno].x;
	Xreg->work[3] = ActWork[actno].y + ActWork[actno].dy;
	Xreg->work[4] = ActWork[actno].y;
	W_GetStraightMoveLoop(Xreg);
	Xreg->work[3] = 0;
	Xreg->work[4] = 0;
	Xreg->work[5] = ActWork[actno].dx;
	Xreg->work[6] = ActWork[actno].dy;
	Xreg->banish = 1;
	
	if(WazaEffWork[1] == 1)
		Xreg->work[2] = 0;
	else if(WazaEffWork[1] == 2)
		Xreg->work[1] = 0;
	
	Xreg->work[7] = WazaEffWork[1];
	Xreg->work[7] |= actno << 8;
	Xreg->move = SeqWazaPokeDefaultMain;
}

static void SeqWazaPokeDefaultMain(actWork *Xreg)
{
	actWork *PokeSt;
	u8 xy_flg;
	
	xy_flg = Xreg->work[7] & 0xff;
	PokeSt = &ActWork[Xreg->work[7] >> 8];
	
	if(Xreg->work[0] == 0)
	{
		if(xy_flg == 1 || xy_flg == 0)
			PokeSt->dx = 0;		//ˆê‰
		if(xy_flg == 2 || xy_flg == 0)
			PokeSt->dy = 0;
		DelWazaEffect(Xreg);
		return;
	}
	
	Xreg->work[0]--;
	Xreg->work[3] += Xreg->work[1];
	Xreg->work[4] += Xreg->work[2];
	PokeSt->dx = Xreg->work[5] + (Xreg->work[3] >> 8);
	PokeSt->dy = Xreg->work[6] + (Xreg->work[4] >> 8);
}


//=========================================================================
//	Îß¹Óİ’¼üˆÚ“®
// offset 0: 0=UŒ‚‘¤   1=–hŒä‘¤
//	      1:X•ûŒü‚Öi‚ŞµÌ¾¯Ä’l
//		  2:Y•ûŒü‚Öi‚ŞµÌ¾¯Ä’l
//		  3:Y•ûŒü‚Ö‚ÌµÌ¾¯Ä‚ğ“GA–¡•û‚Å”½“]‚³‚¹‚é‚©(0:”½“]‚µ‚È‚¢ 1:”½“]‚·‚é)
//        4:‰½sync‚Å“’B‚³‚¹‚é‚©
//=========================================================================
static void SeqWazaPokeStraightMove(actWork *Xreg)
{
	u8 actno;
	u8 client;
	
	if(WazaEffWork[0] == 0)
		client = AttackNo;
	else
		client = DefenceNo;
	actno = PokemonStruct[client];
	if(MineEnemyCheck(client))
	{
		WazaEffWork[1] = -WazaEffWork[1];
		if(WazaEffWork[3] == 1)
			WazaEffWork[2] = -WazaEffWork[2];
	}
	
	Xreg->work[0] = WazaEffWork[4];
	Xreg->work[1] = ActWork[actno].x;
	Xreg->work[2] = ActWork[actno].x + WazaEffWork[1];
	Xreg->work[3] = ActWork[actno].y;
	Xreg->work[4] = ActWork[actno].y + WazaEffWork[2];
	W_GetStraightMoveLoop(Xreg);
	Xreg->work[3] = 0;
	Xreg->work[4] = 0;
	Xreg->work[5] = actno;
	Xreg->banish = 1;
	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = W_PokeParallelMoveSeq2;
}
//=========================================================================
//	Îß¹Óİ’¼üˆÚ“®iŠJn‚ÉÀ•W‚ğƒ[ƒƒNƒŠƒA‚¹‚¸A‚»‚Ìê‚©‚ç“®‚­j
// offset 0: 0=UŒ‚‘¤   1=–hŒä‘¤
//	      1:X•ûŒü‚Öi‚ŞµÌ¾¯Ä’l
//		  2:Y•ûŒü‚Öi‚ŞµÌ¾¯Ä’l
//		  3:Y•ûŒü‚Ö‚ÌµÌ¾¯Ä‚ğ“GA–¡•û‚Å”½“]‚³‚¹‚é‚©(0:”½“]‚µ‚È‚¢ 1:”½“]‚·‚é)
//        4:‰½sync‚Å“’B‚³‚¹‚é‚©
//        5:ˆÚ“®I—¹‚É dx, dy ’l‚ğƒ[ƒ‚É–ß‚·‚©i0:–ß‚³‚È‚¢ 1:–ß‚·j
//=========================================================================
static void SeqWazaPokeStraightMove2Wait(actWork *Xreg);
static void SeqWazaPokeStraightMove2(actWork *Xreg)
{
	u8 actno;
	u8 client;

	Xreg->banish = 1;
	client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;
	actno = PokemonStruct[client];

	if(MineEnemyCheck(client))
	{
		WazaEffWork[1] = -WazaEffWork[1];
		if(WazaEffWork[3] == 1)
			WazaEffWork[2] = -WazaEffWork[2];
	}

	Xreg->work[0] = WazaEffWork[4];
	Xreg->work[1] = ActWork[actno].x + ActWork[actno].dx;
	Xreg->work[2] = Xreg->work[1] + WazaEffWork[1];
	Xreg->work[3] = ActWork[actno].y + ActWork[actno].dy;
	Xreg->work[4] = Xreg->work[3] + WazaEffWork[2];
	W_GetStraightMoveLoop(Xreg);
	Xreg->work[3] = (ActWork[actno].dx << 8);
	Xreg->work[4] = (ActWork[actno].dy << 8);
	Xreg->work[5] = actno;
	Xreg->work[6] = WazaEffWork[5];

	if(WazaEffWork[5] == 0){
		SetWorkSeq(Xreg, DelWazaEffect);
	}else{
		SetWorkSeq(Xreg, SeqWazaPokeStraightMove2Wait);
	}
	Xreg->move = W_PokeParallelMoveSeq2;
}
static void SeqWazaPokeStraightMove2Wait(actWork *Xreg)
{
	ActWork[Xreg->work[5]].dx = 0;
	ActWork[Xreg->work[5]].dy = 0;
	DelWazaEffect(Xreg);
}



//=========================================================================
//	ˆê“xŒã‚ë‚É‚ä‚Á‚­‚è‚Æ‰º‚ª‚Á‚Ä‘O‚É“Ëi‚·‚é
//	0: 0=UŒ‚‘¤		1=–hŒä‘¤
//	1:X•ûŒü‚Ö‚ÌŒã‘ŞXoffset				2:Y•ûŒü‚Ö‚ÌSinU‚è•
//	3:‰½sync‚ÅŒã‘Ş‚³‚¹‚é‚©				4:Œã‘Ş‚³‚¹‚½Œã‚Ì³ª²Ä
//	5:X•ûŒü‚Ö‘Oi‚³‚¹‚éXoffset			6:‘Oi‚³‚¹‚éSync‰ñ”
//=========================================================================
void PokeSinBackInit(u8 id)
{
	u16 back_sec;
	
	back_sec = (128 << 8) / WazaEffWork[3];
	if(MineEnemyCheck(AttackNo))
	{
		WazaEffWork[1] = -WazaEffWork[1];
		WazaEffWork[5] = -WazaEffWork[5];
	}
	
	TaskTable[id].work[0] = W_GetPokeActNo(WazaEffWork[0]);
	TaskTable[id].work[1] = (WazaEffWork[1] << 8) / WazaEffWork[3];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = WazaEffWork[4];
	TaskTable[id].work[5] = (WazaEffWork[5] << 8) / WazaEffWork[6];
	TaskTable[id].work[6] = WazaEffWork[6];
	TaskTable[id].work[7] = back_sec;
	TaskTable[id].TaskAdrs = PokeSinBackMain;
}

static void PokeSinBackMain(u8 id)
{
	u8 pokeact;

	pokeact = TaskTable[id].work[0];
	
	TaskTable[id].work[11] += TaskTable[id].work[1];
	ActWork[pokeact].dx = TaskTable[id].work[11] >> 8;
	ActWork[pokeact].dy = SinMove((u16)TaskTable[id].work[10] >> 8, TaskTable[id].work[2]);
	(u16)TaskTable[id].work[10] += (u16)TaskTable[id].work[7];
	if(--TaskTable[id].work[3] == 0)
		TaskTable[id].TaskAdrs = PokeSinBackWait;
}

static void PokeSinBackWait(u8 id)
{
	u8 pokeact;
	
	if(TaskTable[id].work[4] > 0)
	{
		TaskTable[id].work[4]--;
		return;
	}
	
	pokeact = TaskTable[id].work[0];
	TaskTable[id].work[12] += TaskTable[id].work[5];
	ActWork[pokeact].dx = (TaskTable[id].work[12] >> 8) + (TaskTable[id].work[11]>>8);
	if(--TaskTable[id].work[6] == 0)
		DelTaskEffect(id);
}

//=========================================================================
//
//		Îß¹Óİ‚ğ‰æ–ÊŠO‚ÉˆÚ“®‚³‚¹‚é
//												by matsuda 2002.02.19(‰Î)
//=========================================================================
static void PokeNigeruMoveMain(u8 id);
//----------------------------------------------------------
//	0: 0=UŒ‚‘¤		1=–hŒä‘¤	2=UŒ‚‘¤‘Š•û	3=–hŒä‘¤‘Š•û
//	1: DxˆÚ“®‘¬“x
//----------------------------------------------------------
void PokeNigeruMoveTask(u8 id)
{
	u8 pokeact;
	
	switch(WazaEffWork[0]){
		case 0:
		case 1:
			pokeact = W_GetPokeActNo(WazaEffWork[0]);
			break;
		case 2:
			if(PokeBG2taimeCheck(AttackNo^2) == 0){
				DelTaskEffect(id);
				return;
			}
			pokeact = PokemonStruct[AttackNo^2];
			break;
		case 3:
			if(PokeBG2taimeCheck(DefenceNo^2) == 0){
				DelTaskEffect(id);
				return;
			}
			pokeact = PokemonStruct[DefenceNo^2];
			break;
		default:
			DelTaskEffect(id);
			return;
	}
	TaskTable[id].work[0] = pokeact;
	if(MineEnemyCheck(DefenceNo))
		TaskTable[id].work[1] = WazaEffWork[1];
	else
		TaskTable[id].work[1] = -WazaEffWork[1];
	TaskTable[id].TaskAdrs = PokeNigeruMoveMain;
}

static void PokeNigeruMoveMain(u8 id)
{
	u8 pokeact;
	
	pokeact = TaskTable[id].work[0];
	ActWork[pokeact].dx += TaskTable[id].work[1];
	if(ActWork[pokeact].dx + ActWork[pokeact].x > 240+32
			|| ActWork[pokeact].dx + ActWork[pokeact].x < -32)
		DelTaskEffect(id);
}





//=========================================================================
//
//		Îß¹Óİ‚ğSin¶°ÌŞ‚Å—h‚ê‚³‚¹‚é
//												by matsuda 2002.02.21(–Ø)
//=========================================================================
static void PokeSinMoveMain(u8 id);
//----------------------------------------------------------
//	0:X,Y‚Ç‚¿‚ç‚É‘Î‚µ‚Äˆ—‚ğs‚¤‚©(0=X  1=Y)
//	1:U‚è•	2:•b‘¬“x(ŒÅ’è­”)	3:ŒJ‚è•Ô‚µ‰ñ”
//	4:‚Ç‚ÌÎß¹Óİ‚É‘Î‚µ‚Äs‚¤‚©(0=UŒ‚‘¤	1=–hŒä‘¤)
//----------------------------------------------------------
void PokeSinMove(u8 id)
{
	u8 pokeact;
	
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[1] = -WazaEffWork[1];
	
	pokeact = W_GetPokeActNo(WazaEffWork[4]);
	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = pokeact;
	if(WazaEffWork[4] == 0)
		TaskTable[id].work[5] = AttackNo;
	else
		TaskTable[id].work[5] = DefenceNo;
	TaskTable[id].work[12] = 1;	//I—¹ğŒ”»’è®‚Åg—p‚·‚éÌ×¸Ş‚Ì‰Šú’l
	TaskTable[id].TaskAdrs = PokeSinMoveMain;
}

static void PokeSinMoveMain(u8 id)
{
	u8 pokeact;
	u16 sec;
	s16 dxy;
	
	pokeact = TaskTable[id].work[4];
	
	sec = (u16)TaskTable[id].work[10];
	sec += TaskTable[id].work[2];
	TaskTable[id].work[10] = sec;
	sec >>= 8;
	
	dxy = SinMove(sec, TaskTable[id].work[1]);
	if(TaskTable[id].work[0] == 0)
		ActWork[pokeact].dx = dxy;
	else{
		if(MineEnemyCheck(TaskTable[id].work[5]) == 0)
			ActWork[pokeact].dy = abs(dxy);	//ŠG‚ªØ‚ê‚Ä‚éŠ‚ªŒ©‚¦‚Ä‚µ‚Ü‚¤‚Ì‚Å³‚Ì‚İ
		else
			ActWork[pokeact].dy = -abs(dxy);
	}
	
	if((sec > 127 && TaskTable[id].work[11] == 0 && TaskTable[id].work[12] == 1)
		|| (sec < 127 && TaskTable[id].work[11] == 1 && TaskTable[id].work[12] == 0))
	{
		TaskTable[id].work[11] ^= 1;	//’†S‚É–ß‚Á‚Ä‚«‚½Ì×¸Ş
		TaskTable[id].work[12] ^= 1;
		if(--TaskTable[id].work[3] == 0)
		{
			ActWork[pokeact].dx = 0;
			ActWork[pokeact].dy = 0;
			DelTaskEffect(id);
		}
	}
}






//=========================================================================
//
//		Îß¹Óİ‚ÌŠgk‚ğs‚¤
//												by matsuda 2002.02.18(Œ)
//=========================================================================
static void PokeKakusyukuMain(u8 id);
//----------------------------------------------------------
//	0:ˆê“x‚É‘«‚·ŠgkX’l		1:ˆê“x‚É‘«‚·ŠgkY’l	
//	2:Sync‰ñ”(‚±‚ÌSync‚É’B‚µ‚½‚ç“¯‚¶Sync‰ñ”‚ÅŒ³‚Ì‘å‚«‚³‚É–ß‚·)
//	3:‚Ç‚¿‚ç‚ÌÎß¹Óİ‚Éo‚·‚©(0:UŒ‚‘¤	1:–hŒä‘¤)
//	4:”¼“§–¾Ì×¸Ş(0:OFF	1:ON)
//----------------------------------------------------------
void PokeKakusyukuTask(u8 id)
{
	u8 pokeact;
	
	pokeact = W_GetPokeActNo(WazaEffWork[3]);
	PokeKakusyukuInit(pokeact, WazaEffWork[4]);
	
	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[2];		//Sync•Û‘¶
	TaskTable[id].work[4] = pokeact;
	
	TaskTable[id].work[10] = 0x0100;	//ÃŞÌ«ÙÄX’l
	TaskTable[id].work[11] = 0x0100;	//ÃŞÌ«ÙÄY
	
	TaskTable[id].TaskAdrs = PokeKakusyukuMain;
}

static void PokeKakusyukuMain(u8 id)
{
	u8 pokeact;
	
	TaskTable[id].work[10] += TaskTable[id].work[0];
	TaskTable[id].work[11] += TaskTable[id].work[1];
	pokeact = TaskTable[id].work[4];
	
	PokeKakusyukuSet(pokeact, TaskTable[id].work[10], TaskTable[id].work[11],  0);
	if(--TaskTable[id].work[2] == 0)
	{
		if(TaskTable[id].work[3] > 0)
		{
			TaskTable[id].work[0] = -TaskTable[id].work[0];
			TaskTable[id].work[1] = -TaskTable[id].work[1];
			TaskTable[id].work[2] = TaskTable[id].work[3];
			TaskTable[id].work[3] = 0;
		}
		else
		{
			PokeKakusyukuEnd(pokeact);
			DelTaskEffect(id);
		}
	}
}




//=========================================================================
//
//	‚»‚Ìê‚ÅŒX‚¯‚é
//												by taya 2002.03.29(Œ)
//=========================================================================
static void WazaPokeRollTaskMain(u8 id);

//==============================================
//	‰Šú‰»
//	0: sync”
//
//	1:1sync‚ ‚½‚è‚ÌŠp“x•Ï‰»—Êi¬”•”8bitj
//	¦ + ‚Å‘OA- ‚ÅŒã‚ë‚ÉŒX‚¯‚é
//
//	2: ‚Ç‚¿‚ç‚Ìƒ|ƒPƒ‚ƒ“‚©i0:UŒ‚  1:–hŒäj
//
//	3: “®ìƒ‚[ƒhi0,1,2j
//	¦ 0 ... ŒX‚¯‚é‚¾‚¯iÄ“xAƒ‚[ƒh1‚Å–ß‚·•K—v‚ ‚èj
//	   1 ... ƒ‚[ƒh0 ‚ÅŒX‚¯‚½ƒ|ƒPƒ‚ƒ“‚ğ–ß‚·‚Ì‚Ég—p
//	   2 ... ŒX‚¯‚½ŒãA©“®‚ÅŒ³‚É–ß‚·i“¯sync”A“¯Šp“x—Êj
//==============================================
void WazaPokeRollTask(u8 id)
{
	u8 pokeact;

	pokeact = W_GetPokeActNo(WazaEffWork[2]);
	PokeKakusyukuInit(pokeact, 0);

	TaskTable[id].work[1] = 0;
	TaskTable[id].work[2] = WazaEffWork[0];
	if(WazaEffWork[3] != 1){
		TaskTable[id].work[3] = 0;
	}else{
		TaskTable[id].work[3] = WazaEffWork[0] * WazaEffWork[1];
	}
	TaskTable[id].work[4] = WazaEffWork[1];
	TaskTable[id].work[5] = pokeact;
	TaskTable[id].work[6] = WazaEffWork[3];

	// ©•ª‚Ìƒ|ƒPƒ‚ƒ“‚ğŒX‚¯‚é‚Ì‚©”»’è
	if(ContestCheck()){		//ºİÃ½Ä‚Ìˆ—’Ç‰Á 2002.09.04(…) by matsuda
		TaskTable[id].work[7] = 1;
	}else if(WazaEffWork[2] == 0){
		TaskTable[id].work[7] = (MineEnemyCheck(AttackNo) == SIDE_MINE);
	}else{
		TaskTable[id].work[7] = (MineEnemyCheck(DefenceNo) == SIDE_MINE);
	}

	if(TaskTable[id].work[7] && ContestCheck()==0){
		TaskTable[id].work[3] *= -1;
		TaskTable[id].work[4] *= -1;
	}

	TaskTable[id].TaskAdrs = WazaPokeRollTaskMain;
}
//==========================================================
//	‚«‚Ì‚İƒGƒtƒFƒNƒgê—p‚Ì‰Šú‰»
//	
//		‚Â‚Ë‚ÉYÀ•W‚Ì•â³‚ğs‚¤
//		‘ÎÛ‚ª‰æ–Ê‰œ‚Ìê‡AŠp“x‚ğ”½“]‚³‚¹‚é
//										add_iwasawa_02_08_16
//==========================================================
void KinomiPokeRollTask(u8 id)
{
	u8 pokeact;

	pokeact = W_GetPokeActNo(WazaEffWork[2]);
	PokeKakusyukuInit(pokeact, 0);

	TaskTable[id].work[1] = 0;
	TaskTable[id].work[2] = WazaEffWork[0];

	//‘ÎÛ‚ª“GŒR‚Ì‚Æ‚«‚ÍAŠp“x‚ğ”½“]‚³‚¹‚é
	if(WazaEffWork[2] == 0){
		if(MineEnemyCheck(AttackNo)) WazaEffWork[1] = -WazaEffWork[1];
	}
	else{
		if(MineEnemyCheck(DefenceNo)) WazaEffWork[1] = -WazaEffWork[1];
	}
	if(WazaEffWork[3] != 1){
		TaskTable[id].work[3] = 0;
	}else{
		TaskTable[id].work[3] = WazaEffWork[0] * WazaEffWork[1];
	}
	TaskTable[id].work[4] = WazaEffWork[1];
	TaskTable[id].work[5] = pokeact;
	TaskTable[id].work[6] = WazaEffWork[3];

	//YÀ•W•â³(‘«Œ³‚Ì•â³)‚Ì‚½‚ß‚Ìƒtƒ‰ƒO‚ğ—§‚Ä‚Ä‚¨‚­
	TaskTable[id].work[7] = 1;

	TaskTable[id].work[3] *= -1;
	TaskTable[id].work[4] *= -1;

	TaskTable[id].TaskAdrs = WazaPokeRollTaskMain;
}
static void WazaPokeRollTaskMain(u8 id)
{
	TaskTable[id].work[3] += TaskTable[id].work[4];
	PokeKakusyukuSet(TaskTable[id].work[5], 0x100, 0x100, TaskTable[id].work[3]);
	if(TaskTable[id].work[7]){
		W_AdjustKaitenYPos(TaskTable[id].work[5]);
	}
	if(++(TaskTable[id].work[1]) >= TaskTable[id].work[2]){
		switch(TaskTable[id].work[6]){
		case 1: PokeKakusyukuEnd(TaskTable[id].work[5]);
		default:
		/* FALL THRU */
		case 0: DelTaskEffect(id);
			break;

		case 2:
			TaskTable[id].work[1] = 0;
			TaskTable[id].work[4] *= -1;
			TaskTable[id].work[6] = 1;
			break;
		}
	}
}

//=========================================================================
//	UŒ‚‘¤‚Ì‹ZˆĞ—Í‚É‰‚¶‚Ä–hŒä‘¤‚ğƒuƒ‹ƒuƒ‹k‚í‚¹‚é
//
//	0:(0:ˆĞ—Í(WazaEffPower)Ó°ÄŞ  1:ÀŞÒ°¼Ş(WazaEffDamage)Ó°ÄŞ)
//	1:wait  2:‰ñ”  3:‰¡—h‚êON  4:c—h‚êON
//																	taya
//=========================================================================
#define DAMAGEYURE_MIN  (1)
#define DAMAGEYURE_MAX  (16)

static void TaskPokeDamageYureMain(u8 id);

void TaskPokeDamageYure(u8 id)
{
	// 15:‡ŒvU‚è•
	if(WazaEffWork[0] == 0){
		TaskTable[id].work[15] = WazaEffPower / 12;
		if(TaskTable[id].work[15] < DAMAGEYURE_MIN){
			TaskTable[id].work[15] = DAMAGEYURE_MIN;
		}
		if(TaskTable[id].work[15] > DAMAGEYURE_MAX){
			TaskTable[id].work[15] = DAMAGEYURE_MAX;
		}
	}else{
		TaskTable[id].work[15] = WazaEffDamage / 12;
		if(TaskTable[id].work[15] < DAMAGEYURE_MIN){
			TaskTable[id].work[15] = DAMAGEYURE_MIN;
		}
		if(TaskTable[id].work[15] > DAMAGEYURE_MAX){
			TaskTable[id].work[15] = DAMAGEYURE_MAX;
		}
	}

	// 13,14:¶‰EU‚è•
	TaskTable[id].work[14] = TaskTable[id].work[15] / 2;
	TaskTable[id].work[13] = TaskTable[id].work[14] + (TaskTable[id].work[15] & 1);

	// 12: ¶‰EU‚ê•ûŒü
	TaskTable[id].work[12] = 0;

	// 10,11:—h‚ê•ûŒüƒtƒ‰ƒO
	TaskTable[id].work[10] = WazaEffWork[3];
	TaskTable[id].work[11] = WazaEffWork[4];

	// 7:Îß¹Óİ±¸À°ÅİÊŞ°  8:dx, 9:dy
	TaskTable[id].work[7] = W_GetPokeActNo(1);
	TaskTable[id].work[8] = ActWork[TaskTable[id].work[7]].dx;
	TaskTable[id].work[9] = ActWork[TaskTable[id].work[7]].dy;

	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];

	TaskTable[id].TaskAdrs = TaskPokeDamageYureMain;

}

static void TaskPokeDamageYureMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(++(my->work[0]) > my->work[1]){
		my->work[0] = 0;
		my->work[12] = (my->work[12] + 1) & 1;
		if(my->work[10]){
			if(my->work[12]){
				ActWork[my->work[7]].dx = my->work[8] + my->work[13];
			}else{
				ActWork[my->work[7]].dx = my->work[8] - my->work[14];
			}
		}
		if(my->work[11]){
			if(my->work[12]){
				ActWork[my->work[7]].dy = my->work[15];
			}else{
				ActWork[my->work[7]].dy = 0;
			}
		}
		my->work[2]--;
		if(my->work[2] == 0){
			ActWork[my->work[7]].dx = 0;
			ActWork[my->work[7]].dy = 0;
			DelTaskEffect(id);
		}
	}
}
