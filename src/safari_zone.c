#include "global.h"
#include "flag.h"
#include "main.h"
#include "script.h"
#include "string_util.h"


#define FLAG_ID_SAFARI_ZONE 0x082C

struct UnkSafariZoneStruct
{
	/*0x00*/ s16 x;
	
	/*0x02*/ s16 y;
	
	/*0x04*/ s8 mapNum;
	/*0x05*/ u8 field_3;
	/*0x06*/ u8 field_4;
	/*0x07*/ u8 field_5;
	
	/*0x08*/ u8 index_083F7EB8;
	
	
	/*0x09*/ u8 field_7;
	/*0x0A*/ u8 field_8;
	/*0x0B*/ u8 field_9;
	
	/*0x0C*/ u32 field_10;
};


void sub_80C82D8(void);
void sub_80C8508(void);
extern void c2_exit_to_overworld_2_switch(void);
extern void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
extern void sub_8080E44(void);
extern void CB2_LoadMap(void);
extern void sav12_xor_increment(u8);
extern void warp_in(void);
extern void GetXYCoordsOneStepInFrontOfPlayer(void *, void *);

extern u8 gUnknown_02024D26;
extern u8 gUnknown_02038808;
extern u16 gUnknown_0203880A;
extern struct UnkSafariZoneStruct gUnknown_0203880C[];
extern void (*gUnknown_0300485C)(void);
extern u8 gUnknown_081C340A;
extern u8 gUnknown_081C342D;
extern u8 gUnknown_081C3448;
extern u8 gUnknown_081C3459;

// Not sure if this is actually an array of u8 *'s.
extern u8 *gUnknown_083F7EB8[];

extern u16 gScriptResult;
extern u8 gStringVar1[0x100];

bool32 GetSafariZoneFlag(void)
{
	bool8 ret = FlagGet(FLAG_ID_SAFARI_ZONE);
	
	return ret;
}

void SetSafariZoneFlag(void)
{
	FlagSet(FLAG_ID_SAFARI_ZONE);
}

void ResetSafariZoneFlag(void)
{
	FlagReset(FLAG_ID_SAFARI_ZONE);
}


void sub_80C81B8(void)
{
	sav12_xor_increment(0x11);
	SetSafariZoneFlag();
	sub_80C82D8();
	
	gUnknown_02038808 = 0x1E;
	gUnknown_0203880A = 0x1F4;
}

void sub_80C81E4(void)
{
	ResetSafariZoneFlag();
	sub_80C82D8();
	
	gUnknown_02038808 = 0;
	gUnknown_0203880A = 0;
}

bool8 safari_step(void)
{
	if (GetSafariZoneFlag() == FALSE)
	{
		return FALSE;
	}
	
	sub_80C8508();
	
	if (!(--gUnknown_0203880A))
	{
		ScriptContext1_SetupScript(&gUnknown_081C3448);
		return TRUE;
	}
	
	return FALSE;
}

void sub_80C823C(void)
{
	ScriptContext1_SetupScript(&gUnknown_081C342D);
}

void sub_80C824C(void)
{
	if (gUnknown_02038808 != 0)
	{
		SetMainCallback2(c2_exit_to_overworld_2_switch);
	}
	else if (gUnknown_02024D26 == 8)
	{
		ScriptContext2_RunNewScript(&gUnknown_081C340A);
		warp_in();
		gUnknown_0300485C = sub_8080E44;
		SetMainCallback2(CB2_LoadMap);
	}
	else if (gUnknown_02024D26 == 7)
	{
		ScriptContext1_SetupScript(&gUnknown_081C3459);
		ScriptContext1_Stop();
		SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
	}
}

void sub_80C82BC(u8 index)
{
	memset(&gUnknown_0203880C[index], 0, 
		sizeof(struct UnkSafariZoneStruct));
}

void sub_80C82D8(void)
{
	memset(gUnknown_0203880C, 0, sizeof(struct UnkSafariZoneStruct) * 10);
}

void sub_80C82EC(void)
{
	s16 x, y;
	u16 i;
	
	GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
	
	for (i = 0; i < 10; i++)
	{
		if (gSaveBlock1.location.mapNum == gUnknown_0203880C[i].mapNum
			&& gUnknown_0203880C[i].x == x && gUnknown_0203880C[i].y == y)
		{
			gScriptResult = i;
			
			StringCopy(gStringVar1, gUnknown_083F7EB8
				[gUnknown_0203880C[i].index_083F7EB8]);
			
			return;
		}
	}
	
	gScriptResult = -1;
}

