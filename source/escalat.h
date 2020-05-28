//=======================================================================================
//								エスカレーターBGアニメ
//								2002/04/04 by nakahiro
//=======================================================================================
enum {
	ESCALATOR_DOWN = 0,
	ESCALATOR_UP,
};

extern void AddEscalatorBGAnm( u8 no );		// アニメ開始	no : 0 = DOWN, 1 = UP
extern void DelEscalatorBGAnm(void);		// アニメ終了
extern u8	CheckEscalatorBGAnm(void);		// アニメチェック TRUE = 処理中 FALSE = 終了
