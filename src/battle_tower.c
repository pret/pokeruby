#include "global.h"
#include "battle_tower.h"
#include "event_data.h"
#include "vars.h"


extern void sub_813461C(u8 levelType);
extern void sub_8135C44(void);


void sub_8134548(void)
{
	u8 var1 = 0;
	s32 levelType;

	for (levelType = 0; levelType < 2; levelType++)
	{
		switch (gSaveBlock2.filler_A8.var_4AE[levelType])
		{
		case 0:
		default:
			sub_813461C(levelType);
			if (!var1)
			{
				VarSet(VAR_0x4000, 5);
			}
			break;
		case 1:
			sub_813461C(levelType);
			VarSet(VAR_0x4000, 1);
			var1++;
			break;
		case 4:
			VarSet(VAR_0x4000, 2);
			var1++;
			break;
		case 5:
			VarSet(VAR_0x4000, 3);
			var1++;
			break;
		case 2:
			VarSet(VAR_0x4000, 4);
			var1++;
			break;
		case 3:
		case 6:
			break;
		}
	}

	if ((gSaveBlock2.filler_A8.var_4AE[0] == 3 || gSaveBlock2.filler_A8.var_4AE[0] == 6)
		&& (gSaveBlock2.filler_A8.var_4AE[1] == 3 || gSaveBlock2.filler_A8.var_4AE[1] == 6))
	{
		VarSet(VAR_0x4000, 5);
	}

	sub_8135C44();
}
