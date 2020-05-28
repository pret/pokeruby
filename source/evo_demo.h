extern	void	EvoDemoPartsInit(void);
extern	u8		EvoPartsDemoPart1Set(u16 before_poke_pal);
extern	u8		EvoPartsDemoPart2Set(void);
extern	u8		EvoPartsDemoPart3Set(void);
extern	u8		EvoPartsDemoPart4Set(u16);
extern	u8		EvoPartsDemoPart4SetSio(u16 aftermonsno);
extern	u8		EvoMainDemoSet(u8 act1,u8 act2);

//メインエフェクトタスクワーク定義
#define	EVD_ACT_BEFORE	(1)
#define	EVD_ACT_AFTER	(2)
#define	EVD_AFF_BEFORE	(3)
#define	EVD_AFF_AFTER	(4)
#define	EVD_MODE		(5)
#define	EVD_SP			(6)
#define	EVD_SW			(7)
#define	EVD_CANCEL		(8)
#define	EVD_WAIT		(15)









