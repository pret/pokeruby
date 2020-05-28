/***********************************************************************
**	キューブデモ
**                                                               taya
***********************************************************************/
#ifndef _CUBEDEMO_H_
#define _CUBEDEMO_H_

typedef struct {
	pFunc sub;
	pFunc ret_func;

	CUBE *cube;
	PokemonParam *pokepara;

	u8 buffer[64];

	u8 prog;
	u8 pokeno;
	u8 counter;
	u8 result_pos;
	u8 updown_act_cnt;
	u8 init_end;
	s8 recover_vec;

	u8  param_before[5];
	u8  param_after[5];
	u8  param_up[5];

	s16 add_param[5];

}CUBEDEMO_WORK;

extern const int ConditionID[];
extern u8  CubeDemoPokeNo;   // 何番目のポケモンを選んだか？
extern s16 CubeDemoLike;     // 選んだキューブを好きかどうか？


void CubeDemoInit(CUBE *cube,  pFunc ret_func);

#endif
