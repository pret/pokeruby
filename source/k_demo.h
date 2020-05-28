typedef struct{
	u8 initflag;
	TALK_WIN 	tw;					//ﾃｷｽﾄｺﾝﾃｷｽﾄ
	u8			windowwork;
	PokemonParam PokeWork;
	u8 end_ok[2];
	u16	sendwork[10];
	u8			exchangeflag;		//
	u8			exchangeold;
	u16			exchangecount;
	u16			endwait;
	u8			actno[5];
	u8			sousin;
	u32			wait;
	u16			demoflag;
	u8			strbuf[60];
	u8			ballno[2];
	u16			cen2x,cen2y;
	s16			bgx,bgy;
	s16			bg2x,bg2y;
	s16			bg1v,bg1h;
	s16			bg2v,bg2h;
	u16			ratiobg2;
	u16			ratiowork;
	u16			theta;
	u8			online;			//通信交換かイベント交換か？	0:イベント	1:通信交換
	u16			monsno[2];
	u16			nowsong;
}KOUKANDEMO_WORK;

