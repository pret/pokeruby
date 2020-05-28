
#ifndef __A_MINE_H__
#define __A_MINE_H__


extern	void SeqMinePokeAppearInit(actWork *);
extern	const ActOamData MineOamData;


extern void SeqMinePokeMove(actWork *actst);
extern void SeqMinePokeWait(actWork *actst);
extern void SeqMinePokeWaitInit(actWork *actst);
extern void SelectMotionSet(u8 client_no, u8 poke_gauge, s8 addsec, s8 furihaba);
extern void SelectMotionStop(u8 client_no, u8 poke_gauge);


//-- SelectMotion‚ÅŽg—p --//
enum{
	MOTION_POKE = 0,
	MOTION_GAUGE,
};


#endif

