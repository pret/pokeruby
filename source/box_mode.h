/**********************************************************************/
/*  パソコンボックス（モード定義）                                    */
/**********************************************************************/
#ifndef _BOX_MODE_H_
#define _BOX_MODE_H_

enum BOX_MODE {
	BOX_MODE_TURETEIKU,
	BOX_MODE_AZUKERU,
	BOX_MODE_SEIRI,
};

extern void BoxIn(u8 mode);

#endif
