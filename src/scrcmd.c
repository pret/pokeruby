#include "global.h"
#include "asm.h"
#include "asm_fieldmap.h"
#include "battle_setup.h"
#include "berry.h"
#include "clock.h"
#include "coins.h"
#include "contest_painting.h"
#include "data2.h"
#include "decoration.h"
#include "event_data.h"
#include "field_door.h"
#include "field_effect.h"
#include "field_map_obj_helpers.h"
#include "field_message_box.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "item.h"
#include "main.h"
#include "map_obj_lock.h"
#include "menu.h"
#include "money.h"
#include "palette.h"
#include "pokemon.h"
#include "rng.h"
#include "rom4.h"
#include "rtc.h"
#include "script.h"
#include "script_menu.h"
#include "script_pokemon_80C4.h"
#include "script_pokemon_80F9.h"
#include "sound.h"
#include "string_util.h"

typedef u16 (*SpecialFunc)(void);
typedef void (*NativeFunc)(void);

extern struct Pokemon gPlayerParty[6]; // 0x3004360
extern struct Pokemon gEnemyParty[6]; // 0x30045C0

extern u32 gUnknown_0202E8AC;
extern u32 gUnknown_0202E8B0;
extern u16 gUnknown_0202E8B4;
extern u16 gUnknown_0202E8B6;
extern u16 gUnknown_0202E8B8;
extern u16 gUnknown_0202E8BA;
extern u16 gUnknown_0202E8BC;
extern u16 gSpecialVar_0x8000;
extern u16 gSpecialVar_0x8001;
extern u16 gSpecialVar_0x8002;
extern u16 gSpecialVar_0x8004;

extern u16 gScriptResult;

extern u32 gUnknown_0202FF84[];

extern u16 gScriptContestCategory;

extern SpecialFunc gSpecials[];
extern u8 *gStdScripts[];
extern u8 *gStdScripts_End[];

extern u8 * const gUnknown_083CE048[];

// This is defined in here so the optimizer can't see its value when compiling
// script.c.
void * const gNullScriptPtr = NULL;

static const u8 sScriptConditionTable[6][3] =
{
//  <  =  >
    1, 0, 0, // <
    0, 1, 0, // =
    0, 0, 1, // >
    1, 1, 0, // <=
    0, 1, 1, // >=
    1, 0, 1, // !=
};

static u8 * const sScriptStringVars[] =
{
    gStringVar1,
    gStringVar2,
    gStringVar3,
};

bool8 ScrCmd_snop(struct ScriptContext *ctx)
{
    return FALSE;
}

bool8 ScrCmd_snop1(struct ScriptContext *ctx)
{
    return FALSE;
}

bool8 ScrCmd_end(struct ScriptContext *ctx)
{
    StopScript(ctx);
    return FALSE;
}

bool8 ScrCmd_jumpasm(struct ScriptContext *ctx)
{
    u32 addr = ScriptReadWord(ctx);
    SetupNativeScript(ctx, (void *)addr);
    return TRUE;
}

bool8 ScrCmd_special(struct ScriptContext *ctx)
{
    u16 index = ScriptReadHalfword(ctx);
    gSpecials[index]();
    return FALSE;
}

bool8 ScrCmd_specialval(struct ScriptContext *ctx)
{
    u16 *var = GetVarPointer(ScriptReadHalfword(ctx));
    *var = gSpecials[ScriptReadHalfword(ctx)]();
    return FALSE;
}

bool8 ScrCmd_callasm(struct ScriptContext *ctx)
{
    NativeFunc func = (NativeFunc)ScriptReadWord(ctx);
    func();
    return FALSE;
}

bool8 ScrCmd_waitstate(struct ScriptContext *ctx)
{
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_jump(struct ScriptContext *ctx)
{
    u8 *ptr = (u8 *)ScriptReadWord(ctx);
    ScriptJump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_return(struct ScriptContext *ctx)
{
    ScriptReturn(ctx);
    return FALSE;
}

bool8 ScrCmd_call(struct ScriptContext *ctx)
{

    u8 *ptr = (u8 *)ScriptReadWord(ctx);
    ScriptCall(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_jumpif(struct ScriptContext *ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 *ptr = (u8 *)ScriptReadWord(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_callif(struct ScriptContext *ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 *ptr = (u8 *)ScriptReadWord(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_setvaddress(struct ScriptContext *ctx)
{
    u32 addr1 = (u32)ctx->scriptPtr - 1;
    u32 addr2 = ScriptReadWord(ctx);
    gUnknown_0202E8B0 = addr2 - addr1;
    return FALSE;
}

bool8 ScrCmd_vjump(struct ScriptContext *ctx)
{
    u32 addr = ScriptReadWord(ctx);
    ScriptJump(ctx, (u8 *)(addr - gUnknown_0202E8B0));
    return FALSE;
}

bool8 ScrCmd_vcall(struct ScriptContext *ctx)
{
    u32 addr = ScriptReadWord(ctx);
    ScriptCall(ctx, (u8 *)(addr - gUnknown_0202E8B0));
    return FALSE;
}

bool8 ScrCmd_if5(struct ScriptContext *ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 *ptr = (u8 *)(ScriptReadWord(ctx) - gUnknown_0202E8B0);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_if6(struct ScriptContext *ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 *ptr = (u8 *)(ScriptReadWord(ctx) - gUnknown_0202E8B0);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_jumpstd(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    u8 **ptr = &gStdScripts[index];
    if (ptr < gStdScripts_End)
        ScriptJump(ctx, *ptr);
    return FALSE;
}

bool8 ScrCmd_callstd(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    u8 **ptr = &gStdScripts[index];
    if (ptr < gStdScripts_End)
        ScriptCall(ctx, *ptr);
    return FALSE;
}

bool8 ScrCmd_jumpstdif(struct ScriptContext *ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 index = ScriptReadByte(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
    {
        u8 **ptr = &gStdScripts[index];
        if (ptr < gStdScripts_End)
            ScriptJump(ctx, *ptr);
    }
    return FALSE;
}

bool8 ScrCmd_callstdif(struct ScriptContext *ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 index = ScriptReadByte(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
    {
        u8 **ptr = &gStdScripts[index];
        if (ptr < gStdScripts_End)
            ScriptCall(ctx, *ptr);
    }
    return FALSE;
}

bool8 ScrCmd_jumpram(struct ScriptContext *ctx)
{
    ScriptJump(ctx, (u8 *)gUnknown_0202E8AC);
    return FALSE;
}

bool8 ScrCmd_die(struct ScriptContext *ctx)
{
    ClearRamScript();
    StopScript(ctx);
    return TRUE;
}

bool8 ScrCmd_setbyte(struct ScriptContext *ctx)
{
    u8 value = ScriptReadByte(ctx);
    sub_8126160(value);
    return FALSE;
}

bool8 ScrCmd_loadptr(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    ctx->data[index] = ScriptReadWord(ctx);
    return FALSE;
}

bool8 ScrCmd_loadbytefrompointer(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    ctx->data[index] = *(u8 *)ScriptReadWord(ctx);
    return FALSE;
}

bool8 ScrCmd_writebytetooffset(struct ScriptContext *ctx)
{
    u8 value = ScriptReadByte(ctx);
    *(u8 *)ScriptReadWord(ctx) = value;
    return FALSE;
}

bool8 ScrCmd_setbufferbyte(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    ctx->data[index] = ScriptReadByte(ctx);
    return FALSE;
}

bool8 ScrCmd_setptrbyte(struct ScriptContext *ctx)
{
    u8 index = ScriptReadByte(ctx);
    *(u8 *)ScriptReadWord(ctx) = ctx->data[index];
    return FALSE;
}

bool8 ScrCmd_copybuffers(struct ScriptContext *ctx)
{
    u8 destIndex = ScriptReadByte(ctx);
    u8 srcIndex = ScriptReadByte(ctx);
    ctx->data[destIndex] = ctx->data[srcIndex];
    return FALSE;
}

bool8 ScrCmd_copybyte(struct ScriptContext *ctx)
{
    u8 *ptr = (u8 *)ScriptReadWord(ctx);
    *ptr = *(u8 *)ScriptReadWord(ctx);
    return FALSE;
}

bool8 ScrCmd_setvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr = ScriptReadHalfword(ctx);
    return FALSE;
}

bool8 ScrCmd_copyvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr = *GetVarPointer(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_setorcopyvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr = VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

u8 compare_012(u16 a1, u16 a2)
{
    if (a1 < a2)
        return 0;

    if (a1 == a2)
        return 1;

    return 2;
}

bool8 ScrCmd_comparebuffers(struct ScriptContext *ctx)
{
    u8 value1 = ctx->data[ScriptReadByte(ctx)];
    u8 value2 = ctx->data[ScriptReadByte(ctx)];
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_comparebuffertobyte(struct ScriptContext *ctx)
{
    u8 value1 = ctx->data[ScriptReadByte(ctx)];
    u8 value2 = ScriptReadByte(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_comparebuffertoptrbyte(struct ScriptContext *ctx)
{
    u8 value1 = ctx->data[ScriptReadByte(ctx)];
    u8 value2 = *(u8 *)ScriptReadWord(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compareptrbytetobuffer(struct ScriptContext *ctx)
{
    u8 value1 = *(u8 *)ScriptReadWord(ctx);
    u8 value2 = ctx->data[ScriptReadByte(ctx)];
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compareptrbytetobyte(struct ScriptContext *ctx)
{
    u8 value1 = *(u8 *)ScriptReadWord(ctx);
    u8 value2 = ScriptReadByte(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compareptrbytes(struct ScriptContext *ctx)
{
    u8 value1 = *(u8 *)ScriptReadWord(ctx);
    u8 value2 = *(u8 *)ScriptReadWord(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare(struct ScriptContext *ctx)
{
    u16 value1 = *GetVarPointer(ScriptReadHalfword(ctx));
    u16 value2 = ScriptReadHalfword(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_comparevars(struct ScriptContext *ctx)
{
    u16 *ptr1 = GetVarPointer(ScriptReadHalfword(ctx));
    u16 *ptr2 = GetVarPointer(ScriptReadHalfword(ctx));
    ctx->comparisonResult = compare_012(*ptr1, *ptr2);
    return FALSE;
}

bool8 ScrCmd_addvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr += ScriptReadHalfword(ctx);
    return FALSE;
}

bool8 ScrCmd_subvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr -= VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_random(struct ScriptContext *ctx)
{
    u16 max = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = Random() % max;
    return FALSE;
}

bool8 ScrCmd_additem(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = AddBagItem(itemId, (u8)quantity);
    return FALSE;
}

bool8 ScrCmd_removeitem(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = RemoveBagItem(itemId, (u8)quantity);
    return FALSE;
}

bool8 ScrCmd_checkitemspace(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = CheckBagHasSpace(itemId, (u8)quantity);
    return FALSE;
}

bool8 ScrCmd_checkitem(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = CheckBagHasItem(itemId, (u8)quantity);
    return FALSE;
}

bool8 ScrCmd_checkitemtype(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = GetPocketByItemId(itemId);
    return FALSE;
}

bool8 ScrCmd_addpcitem(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = AddPCItem(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_checkpcitem(struct ScriptContext *ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = CheckPCHasItem(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_adddecor(struct ScriptContext *ctx)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = IsThereStorageSpaceForDecoration(decorId);
    return FALSE;
}

bool8 ScrCmd_removedecor(struct ScriptContext *ctx)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = sub_81340A8(decorId);
    return FALSE;
}

bool8 ScrCmd_checkdecor(struct ScriptContext *ctx)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = sub_8134074(decorId);
    return FALSE;
}

bool8 ScrCmd_testdecor(struct ScriptContext *ctx)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = sub_8133FE4(decorId);
    return FALSE;
}

bool8 ScrCmd_setflag(struct ScriptContext *ctx)
{
    FlagSet(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_clearflag(struct ScriptContext *ctx)
{
    FlagReset(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_checkflag(struct ScriptContext *ctx)
{
    ctx->comparisonResult = FlagGet(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_inccounter(struct ScriptContext *ctx)
{
    IncrementGameStat(ScriptReadByte(ctx));
    return FALSE;
}

bool8 ScrCmd_lighten(struct ScriptContext *ctx)
{
    sub_8081594(ScriptReadByte(ctx));
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_darken(struct ScriptContext *ctx)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));
    sub_8053CE4(value);
    return FALSE;
}

bool8 IsPaletteNotActive(void)
{
    if (!gPaletteFade.active)
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_fadescreen(struct ScriptContext *ctx)
{
    fade_screen(ScriptReadByte(ctx), 0);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

bool8 ScrCmd_fadescreendelay(struct ScriptContext *ctx)
{
    u8 duration = ScriptReadByte(ctx);
    u8 delay = ScriptReadByte(ctx);
    fade_screen(duration, delay);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

bool8 s28_pause_asm()
{
    gUnknown_0202E8B4--;

    if (gUnknown_0202E8B4 == 0)
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_pause(struct ScriptContext *ctx)
{
    gUnknown_0202E8B4 = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, s28_pause_asm);
    return TRUE;
}

bool8 ScrCmd_compareflags(struct ScriptContext *ctx)
{
    u8 hour = VarGet(ScriptReadHalfword(ctx));
    u8 minute = VarGet(ScriptReadHalfword(ctx));
    RtcInitLocalTimeOffset(hour, minute);
    return FALSE;
}

bool8 ScrCmd_checkdailyflags(struct ScriptContext *ctx)
{
    DoTimeBasedEvents();
    return FALSE;
}

bool8 ScrCmd_resetvars(struct ScriptContext *ctx)
{
    RtcCalcLocalTime();
    gSpecialVar_0x8000 = gLocalTime.hours;
    gSpecialVar_0x8001 = gLocalTime.minutes;
    gSpecialVar_0x8002 = gLocalTime.seconds;
    return FALSE;
}

bool8 ScrCmd_setweather(struct ScriptContext *ctx)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));
    SetSav1Weather(value);
    return FALSE;
}

bool8 ScrCmd_resetweather(struct ScriptContext *ctx)
{
    sub_80806E4();
    return FALSE;
}

bool8 ScrCmd_doweather(struct ScriptContext *ctx)
{
    DoCurrentWeather();
    return FALSE;
}

bool8 ScrCmd_tileeffect(struct ScriptContext *ctx)
{
    ActivatePerStepCallback(ScriptReadByte(ctx));
    return FALSE;
}

bool8 ScrCmd_setmapfooter(struct ScriptContext *ctx)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));
    sub_8053D14(value);
    return FALSE;
}

bool8 ScrCmd_warp(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    warp1_set(v1, v2, v3, v4, v5);
    sub_8080E88();
    player_avatar_init_params_reset();
    return TRUE;
}

bool8 ScrCmd_warpmuted(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    warp1_set(v1, v2, v3, v4, v5);
    sp13E_warp_to_last_warp();
    player_avatar_init_params_reset();
    return TRUE;
}

bool8 ScrCmd_warpwalk(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    warp1_set(v1, v2, v3, v4, v5);
    sub_8080EF0();
    player_avatar_init_params_reset();
    return TRUE;
}

bool8 ScrCmd_warphole(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u16 x;
    u16 y;

    PlayerGetDestCoords(&x, &y);

    if (v1 == 0xFF && v2 == 0xFF)
        sub_8053720(x - 7, y - 7);
    else
        warp1_set(v1, v2, -1, x - 7, y - 7);

    sp13F_fall_to_last_warp();
    player_avatar_init_params_reset();
    return TRUE;
}

bool8 ScrCmd_warpteleport(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    warp1_set(v1, v2, v3, v4, v5);
    sub_8080F68();
    player_avatar_init_params_reset();
    return TRUE;
}

bool8 ScrCmd_warp3(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    warp1_set(v1, v2, v3, v4, v5);
    return FALSE;
}

bool8 ScrCmd_warpplace(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    saved_warp2_set_2(0, v1, v2, v3, v4, v5);
    return FALSE;
}

bool8 ScrCmd_warp4(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    sub_8053690(v1, v2, v3, v4, v5);
    return FALSE;
}

bool8 ScrCmd_warp5(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    sub_80536E4(v1, v2, v3, v4, v5);
    return FALSE;
}

bool8 ScrCmd_warp6(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = VarGet(ScriptReadHalfword(ctx));
    s8 v5 = VarGet(ScriptReadHalfword(ctx));
    sub_805363C(v1, v2, v3, v4, v5);
    return FALSE;
}

bool8 ScrCmd_getplayerxy(struct ScriptContext *ctx)
{
    u16 *ptr1 = GetVarPointer(ScriptReadHalfword(ctx));
    u16 *ptr2 = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr1 = gSaveBlock1.pos.x;
    *ptr2 = gSaveBlock1.pos.y;
    return FALSE;
}

bool8 ScrCmd_countpokemon(struct ScriptContext *ctx)
{
    gScriptResult = CalculatePlayerPartyCount();
    return FALSE;
}

bool8 ScrCmd_playsfx(struct ScriptContext *ctx)
{
    PlaySE(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 s30_music_check_asm()
{
    if (!IsSEPlaying())
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_checksound(struct ScriptContext *ctx)
{
    SetupNativeScript(ctx, s30_music_check_asm);
    return TRUE;
}

bool8 ScrCmd_fanfare(struct ScriptContext *ctx)
{
    PlayFanfare(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 s32_fanfare_wait_asm()
{
    return IsFanfareTaskInactive();
}

bool8 ScrCmd_waitfanfare(struct ScriptContext *ctx)
{
    SetupNativeScript(ctx, s32_fanfare_wait_asm);
    return TRUE;
}

bool8 ScrCmd_playmusic(struct ScriptContext *ctx)
{
    u16 songId = ScriptReadHalfword(ctx);
    bool8 val = ScriptReadByte(ctx);
    if (val == TRUE)
        sav1_set_battle_music_maybe(songId);
    PlayNewMapMusic(songId);
    return FALSE;
}

bool8 ScrCmd_playmusicbattle(struct ScriptContext *ctx)
{
    sav1_set_battle_music_maybe(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_fadedefault(struct ScriptContext *ctx)
{
    sub_8053F84();
    return FALSE;
}

bool8 ScrCmd_fademusic(struct ScriptContext *ctx)
{
    sub_8053FB0(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_fadeout(struct ScriptContext *ctx)
{
    u8 val = ScriptReadByte(ctx);
    if (val)
        FadeOutBGMTemporarily(4 * val);
    else
        FadeOutBGMTemporarily(4);
    SetupNativeScript(ctx, IsBGMPausedOrStopped);
    return TRUE;
}

bool8 ScrCmd_fadein(struct ScriptContext *ctx)
{
    u8 val = ScriptReadByte(ctx);
    if (val)
        FadeInBGM(4 * val);
    else
        FadeInBGM(4);
    return FALSE;
}

bool8 ScrCmd_move(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    void *v2 = (void *)ScriptReadWord(ctx);
    exec_movement(v1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, v2);
    gUnknown_0202E8B6 = v1;
    return FALSE;
}

bool8 ScrCmd_movecoords(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    void *v2 = (void *)ScriptReadWord(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    exec_movement(v1, v4, v3, v2);
    gUnknown_0202E8B6 = v1;
    return FALSE;
}

bool8 s51a_0806B288(void)
{
    return sub_80A212C(gUnknown_0202E8B6, gUnknown_0202E8BA, gUnknown_0202E8B8);
}

bool8 ScrCmd_waitmove(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    if (v1)
        gUnknown_0202E8B6 = v1;
    gUnknown_0202E8B8 = gSaveBlock1.location.mapGroup;
    gUnknown_0202E8BA = gSaveBlock1.location.mapNum;
    SetupNativeScript(ctx, s51a_0806B288);
    return TRUE;
}

bool8 ScrCmd_waitmovexy(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2;
    u8 v3;

    if (v1)
        gUnknown_0202E8B6 = v1;

    v2 = ScriptReadByte(ctx);
    v3 = ScriptReadByte(ctx);
    gUnknown_0202E8B8 = v2;
    gUnknown_0202E8BA = v3;
    SetupNativeScript(ctx, s51a_0806B288);
    return TRUE;
}

bool8 ScrCmd_disappear(struct ScriptContext *ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    RemoveFieldObjectByLocalIdAndMap(objectId, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    return FALSE;
}

bool8 ScrCmd_disappearxy(struct ScriptContext *ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    RemoveFieldObjectByLocalIdAndMap(objectId, mapNum, mapGroup);
    return FALSE;
}

bool8 ScrCmd_reappear(struct ScriptContext *ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    show_sprite(objectId, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    return FALSE;
}

bool8 ScrCmd_reappearxy(struct ScriptContext *ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    show_sprite(objectId, mapNum, mapGroup);
    return FALSE;
}

bool8 ScrCmd_movesprite(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u16 v2 = VarGet(ScriptReadHalfword(ctx));
    u32 v3 = VarGet(ScriptReadHalfword(ctx));
    sub_805C0F8(v1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, v2, v3);
    return FALSE;
}

bool8 ScrCmd_movespriteperm(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u16 v2 = VarGet(ScriptReadHalfword(ctx));
    u32 v3 = VarGet(ScriptReadHalfword(ctx));
    update_saveblock1_field_object_coords(v1, v2, v3);
    return FALSE;
}

bool8 ScrCmd_moveoffscreen(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    sub_805C78C(v1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    return FALSE;
}

bool8 ScrCmd_spritevisible(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    npc_by_local_id_and_map_set_field_1_bit_x20(v1, v3, v2, 0);
    return FALSE;
}

bool8 ScrCmd_spriteinvisible(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    npc_by_local_id_and_map_set_field_1_bit_x20(v1, v3, v2, 1);
    return FALSE;
}

bool8 ScrCmd_spritelevelup(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    sub_805BCF0(v1, v3, v2, v4 + 83);
    return FALSE;
}

bool8 ScrCmd_restorespritelevel(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    sub_805BD48(v1, v3, v2);
    return FALSE;
}

bool8 ScrCmd_faceplayer(struct ScriptContext *ctx)
{
    if (gMapObjects[gSelectedMapObject].active)
    {
        FieldObjectFaceOppositeDirection(&gMapObjects[gSelectedMapObject],
          player_get_direction_lower_nybble());
    }
    return FALSE;
}

bool8 ScrCmd_spriteface(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    FieldObjectTurnByLocalIdAndMap(v1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, v2);
    return FALSE;
}

bool8 ScrCmd_spritebehave(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    update_saveblock1_field_object_movement_behavior(v1, v2);
    return FALSE;
}

bool8 ScrCmd_createvsprite(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u16 v3 = VarGet(ScriptReadHalfword(ctx));
    u32 v4 = VarGet(ScriptReadHalfword(ctx));
    u8 v5 = ScriptReadByte(ctx);
    u8 v6 = ScriptReadByte(ctx);
    sub_805B410(v1, v2, v3, v4, v5, v6);
    return FALSE;
}

bool8 ScrCmd_vspriteface(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    sub_8064990(v1, v2);
    return FALSE;
}

bool8 ScrCmd_lockall(struct ScriptContext *ctx)
{
    if (is_c1_link_related_active())
    {
        return FALSE;
    }
    else
    {
        ScriptFreezeMapObjects();
        SetupNativeScript(ctx, sub_8064CFC);
        return TRUE;
    }
}

bool8 ScrCmd_lock(struct ScriptContext *ctx)
{
    if (is_c1_link_related_active())
    {
        return FALSE;
    }
    else
    {
        if (gMapObjects[gSelectedMapObject].active)
        {
            sub_8064DD8();
            SetupNativeScript(ctx, sub_8064DB4);
        }
        else
        {
            ScriptFreezeMapObjects();
            SetupNativeScript(ctx, sub_8064CFC);
        }

        return TRUE;
    }
}

bool8 ScrCmd_releaseall(struct ScriptContext *ctx)
{
    u8 objectId;

    HideFieldMessageBox();
    objectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[objectId]);
    sub_80A2178();
    UnfreezeMapObjects();
    return FALSE;
}

bool8 ScrCmd_release(struct ScriptContext *ctx)
{
    u8 objectId;

    HideFieldMessageBox();
    if (gMapObjects[gSelectedMapObject].active)
        FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[gSelectedMapObject]);
    objectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[objectId]);
    sub_80A2178();
    UnfreezeMapObjects();
    return FALSE;
}

bool8 ScrCmd_message(struct ScriptContext *ctx)
{
    u8 *msg = (u8 *)ScriptReadWord(ctx);
    if (!msg)
        msg = (u8 *)ctx->data[0];
    ShowFieldMessage(msg);
    return FALSE;
}

bool8 ScrCmd_message2(struct ScriptContext *ctx)
{
    u8 *msg = (u8 *)ScriptReadWord(ctx);
    if (!msg)
        msg = (u8 *)ctx->data[0];
    ShowFieldAutoScrollMessage(msg);
    return FALSE;
}

bool8 ScrCmd_waittext(struct ScriptContext *ctx)
{
    SetupNativeScript(ctx, IsFieldMessageBoxHidden);
    return TRUE;
}

bool8 ScrCmd_closebutton(struct ScriptContext *ctx)
{
    HideFieldMessageBox();
    return FALSE;
}

bool8 WaitForAorBPress(void)
{
    if (gMain.newKeys & A_BUTTON)
        return TRUE;
    if (gMain.newKeys & B_BUTTON)
        return TRUE;
    return FALSE;
}

bool8 ScrCmd_waitbutton(struct ScriptContext *ctx)
{
    SetupNativeScript(ctx, WaitForAorBPress);
    return TRUE;
}

bool8 ScrCmd_yesnobox(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    if (yes_no_box(v1, v2) == 1)
    {
        ScriptContext1_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_multichoice(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    if (sub_80B5054(v1, v2, v3, v4) == 1)
    {
        ScriptContext1_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_multichoicedef(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    u8 v5 = ScriptReadByte(ctx);
    if (sub_80B50B0(v1, v2, v3, v5, v4) == 1)
    {
        ScriptContext1_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_showbox(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    MenuDrawTextWindow(v1, v2, v3, v4);
    return FALSE;
}

bool8 ScrCmd_multichoicerow(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    u8 v5 = ScriptReadByte(ctx);
    if (sub_80B5578(v1, v2, v3, v5, v4) == 1)
    {
        ScriptContext1_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_hidebox(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    MenuZeroFillWindowRect(v1, v2, v3, v4);
    return FALSE;
}

bool8 ScrCmd_clearbox(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    if (Multichoice(v1, v2, v3, v4) == 1)
    {
        ScriptContext1_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_showpokepic(struct ScriptContext *ctx)
{
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    sub_80B58C4(v1, v2, v3);
    return FALSE;
}

bool8 ScrCmd_hidepokepic(struct ScriptContext *ctx)
{
    void *func = picbox_close();
    if (!func)
        return FALSE;

    SetupNativeScript(ctx, func);
    return TRUE;
}

bool8 ScrCmd_showcontestwinner(struct ScriptContext *ctx)
{
    u8 v1 = ScriptReadByte(ctx);
    if (v1)
        sub_8106630(v1);
    ShowContestWinner();
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_braillemsg(struct ScriptContext *ctx)
{
    u8 *ptr = (u8 *)ScriptReadWord(ctx);
    u8 v2 = ptr[0];
    u8 v3 = ptr[1];
    u8 v4 = ptr[2];
    u8 v5 = ptr[3];
    u8 v6 = ptr[4];
    u8 v7 = ptr[5];
    StringBraille(gStringVar4, ptr + 6);
    MenuDrawTextWindow(v2, v3, v4, v5);
    MenuPrint(gStringVar4, v6, v7);
    return FALSE;
}

bool8 ScrCmd_vtext(struct ScriptContext *ctx)
{
    u32 v1 = ScriptReadWord(ctx);
    ShowFieldMessage((u8 *)(v1 - gUnknown_0202E8B0));
    return FALSE;
}

bool8 ScrCmd_bufferpoke(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 species = VarGet(ScriptReadHalfword(ctx));
    StringCopy(sScriptStringVars[stringVarIndex], gSpeciesNames[species]);
    return FALSE;
}

bool8 ScrCmd_bufferfirstpoke(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u8 *dest = sScriptStringVars[stringVarIndex];
    u8 partyIndex = GetLeadMonIndex();
    u32 species = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES, NULL);
    StringCopy(dest, gSpeciesNames[species]);
    return FALSE;
}

bool8 ScrCmd_bufferpartypoke(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 partyIndex = VarGet(ScriptReadHalfword(ctx));
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, sScriptStringVars[stringVarIndex]);
    StringGetEnd10(sScriptStringVars[stringVarIndex]);
    return FALSE;
}

bool8 ScrCmd_bufferitem(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    CopyItemName(itemId, sScriptStringVars[stringVarIndex]);
    return FALSE;
}

bool8 ScrCmd_bufferdecor(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 decorId = VarGet(ScriptReadHalfword(ctx));
    StringCopy(sScriptStringVars[stringVarIndex], gDecorations[decorId].name);
    return FALSE;
}

bool8 ScrCmd_bufferattack(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 moveId = VarGet(ScriptReadHalfword(ctx));
    StringCopy(sScriptStringVars[stringVarIndex], gMoveNames[moveId]);
    return FALSE;
}

bool8 ScrCmd_buffernum(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 v1 = VarGet(ScriptReadHalfword(ctx));
    u8 v2 = sub_80BF0B8(v1);
    ConvertIntToDecimalStringN(sScriptStringVars[stringVarIndex], v1, 0, v2);
    return FALSE;
}

bool8 ScrCmd_bufferstd(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 index = VarGet(ScriptReadHalfword(ctx));
    StringCopy(sScriptStringVars[stringVarIndex], gUnknown_083CE048[index]);
    return FALSE;
}

bool8 ScrCmd_buffertext(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u8 *text = (u8 *)ScriptReadWord(ctx);
    StringCopy(sScriptStringVars[stringVarIndex], text);
    return FALSE;
}

bool8 ScrCmd_vloadptr(struct ScriptContext *ctx)
{
    u8 *ptr = (u8 *)(ScriptReadWord(ctx) - gUnknown_0202E8B0);
    StringExpandPlaceholders(gStringVar4, ptr);
    return FALSE;
}

bool8 ScrCmd_vbuffer(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u32 addr = ScriptReadWord(ctx);
    u8 *src = (u8 *)(addr - gUnknown_0202E8B0);
    u8 *dest = sScriptStringVars[stringVarIndex];
    StringCopy(dest, src);
    return FALSE;
}

bool8 ScrCmd_givepokemon(struct ScriptContext *ctx)
{
    u16 v3 = VarGet(ScriptReadHalfword(ctx));
    u8 v5 = ScriptReadByte(ctx);
    u16 v7 = VarGet(ScriptReadHalfword(ctx));
    u32 v8 = ScriptReadWord(ctx);
    u32 v9 = ScriptReadWord(ctx);
    u8 v10 = ScriptReadByte(ctx);
    gScriptResult = ScriptGiveMon(v3, v5, v7, v8, v9, v10);
    return FALSE;
}

bool8 ScrCmd_giveegg(struct ScriptContext *ctx)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = ScriptGiveEgg(value);
    return FALSE;
}

bool8 ScrCmd_setpokemove(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u16 v4 = ScriptReadHalfword(ctx);
    ScriptSetMonMoveSlot(v2, v4, v3);
    return FALSE;
}

bool8 ScrCmd_checkattack(struct ScriptContext *ctx)
{
    u8 i;
    u16 moveId = ScriptReadHalfword(ctx);
    gScriptResult = 6;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL);
        if (!species)
            break;
        // UB: GetMonData() arguments don't match function definition
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) && pokemon_has_move(&gPlayerParty[i], moveId) == TRUE)
        {
            gScriptResult = i;
            gSpecialVar_0x8004 = species;
            break;
        }
    }
    return FALSE;
}

bool8 ScrCmd_givemoney(struct ScriptContext *ctx)
{
    u32 amount = ScriptReadWord(ctx);
    u8 ignore = ScriptReadByte(ctx);
    if (!ignore)
        sub_80B79B8(&gSaveBlock1.money, amount);
    return FALSE;
}

bool8 ScrCmd_paymoney(struct ScriptContext *ctx)
{
    u32 amount = ScriptReadWord(ctx);
    u8 ignore = ScriptReadByte(ctx);
    if (!ignore)
        sub_80B79E0(&gSaveBlock1.money, amount);
    return FALSE;
}

bool8 ScrCmd_checkmoney(struct ScriptContext *ctx)
{
    u32 amount = ScriptReadWord(ctx);
    u8 ignore = ScriptReadByte(ctx);
    if (!ignore)
        gScriptResult = IsEnoughMoney(gSaveBlock1.money, amount);
    return FALSE;
}

bool8 ScrCmd_showmoney(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 ignore = ScriptReadByte(ctx);
    if (!ignore)
        sub_80B7C14(gSaveBlock1.money, v2, v3);
    return FALSE;
}

bool8 ScrCmd_hidemoney(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    RemoveMoneyLabelObject(v2, v3);
    return FALSE;
}

bool8 ScrCmd_updatemoney(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 ignore = ScriptReadByte(ctx);
    if (!ignore)
        sub_80B7BEC(gSaveBlock1.money, v2, v3);
    return FALSE;
}

bool8 ScrCmd_showcoins(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    ShowCoinsWindow(gSaveBlock1.coins, v2, v3);
    return FALSE;
}

bool8 ScrCmd_hidecoins(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    HideCoinsWindow(v2, v3);
    return FALSE;
}

bool8 ScrCmd_updatecoins(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    UpdateCoinsWindow(gSaveBlock1.coins, v2, v3);
    return FALSE;
}

bool8 ScrCmd_trainerbattle(struct ScriptContext *ctx)
{
    ctx->scriptPtr = TrainerBattleConfigure(ctx->scriptPtr);
    return FALSE;
}

bool8 ScrCmd_reptrainerbattle(struct ScriptContext *ctx)
{
    sub_80825E4();
    return TRUE;
}

bool8 ScrCmd_endtrainerbattle(struct ScriptContext *ctx)
{
    ctx->scriptPtr = sub_80826E8();
    return FALSE;
}

bool8 ScrCmd_endtrainerbattle2(struct ScriptContext *ctx)
{
    ctx->scriptPtr = sub_8082700();
    return FALSE;
}

bool8 ScrCmd_checktrainerflag(struct ScriptContext *ctx)
{
    u16 index = VarGet(ScriptReadHalfword(ctx));
    ctx->comparisonResult = trainer_flag_check(index);
    return FALSE;
}

bool8 ScrCmd_cleartrainerflag(struct ScriptContext *ctx)
{
    u16 index = VarGet(ScriptReadHalfword(ctx));
    trainer_flag_set(index);
    return FALSE;
}

bool8 ScrCmd_settrainerflag(struct ScriptContext *ctx)
{
    u16 index = VarGet(ScriptReadHalfword(ctx));
    trainer_flag_clear(index);
    return FALSE;
}

bool8 ScrCmd_setwildbattle(struct ScriptContext *ctx)
{
    u16 v2 = ScriptReadHalfword(ctx);
    u8 v4 = ScriptReadByte(ctx);
    u16 v5 = ScriptReadHalfword(ctx);
    ScriptWildBattle(v2, v4, v5);
    return FALSE;
}

bool8 ScrCmd_dowildbattle(struct ScriptContext *ctx)
{
    StartBattle_ScriptedWild();
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_pokemart(struct ScriptContext *ctx)
{
    void *ptr = (void *)ScriptReadWord(ctx);
    CreatePokemartMenu(ptr);
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_pokemartdecor(struct ScriptContext *ctx)
{
    void *ptr = (void *)ScriptReadWord(ctx);
    CreateDecorationShop1Menu(ptr);
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_pokemartbp(struct ScriptContext *ctx)
{
    void *ptr = (void *)ScriptReadWord(ctx);
    CreateDecorationShop2Menu(ptr);
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_pokecasino(struct ScriptContext *ctx)
{
    u8 v2 = VarGet(ScriptReadHalfword(ctx));
    PlaySlotMachine(v2, c2_exit_to_overworld_1_continue_scripts_restart_music);
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_event_8a(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    u8 v3 = ScriptReadByte(ctx);
    u8 v4 = ScriptReadByte(ctx);
    if (!v3)
        PlantBerryTree(v2, 0, v4, FALSE);
    else
        PlantBerryTree(v2, v3, v4, FALSE);
    return FALSE;
}

bool8 ScrCmd_event_96(struct ScriptContext *ctx)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));
    gScriptResult = GetPriceReduction(value);
    return FALSE;
}

bool8 ScrCmd_choosecontestpkmn(struct ScriptContext *ctx)
{
    sub_80F99CC();
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_startcontest(struct ScriptContext *ctx)
{
    sub_80C48C8();
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_showcontestresults(struct ScriptContext *ctx)
{
    sub_80C4940();
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_contestlinktransfer(struct ScriptContext *ctx)
{
    sub_80C4980(gScriptContestCategory);
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_doanimation(struct ScriptContext *ctx)
{
    u16 effectId = VarGet(ScriptReadHalfword(ctx));
    gUnknown_0202E8BC = effectId;
    FieldEffectStart(gUnknown_0202E8BC);
    return FALSE;
}

bool8 ScrCmd_setanimation(struct ScriptContext *ctx)
{
    u8 v2 = ScriptReadByte(ctx);
    gUnknown_0202FF84[v2] = (s16)VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

static bool8 sub_8067B48()
{
    if (!FieldEffectActiveListContains(gUnknown_0202E8BC))
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_checkanimation(struct ScriptContext *ctx)
{
    gUnknown_0202E8BC = VarGet(ScriptReadHalfword(ctx));
    SetupNativeScript(ctx, sub_8067B48);
    return TRUE;
}

bool8 ScrCmd_sethealplace(struct ScriptContext *ctx)
{
    u16 v2 = VarGet(ScriptReadHalfword(ctx));
    sub_8053588(v2);
    return FALSE;
}

bool8 ScrCmd_checkgender(struct ScriptContext *ctx)
{
    gScriptResult = gSaveBlock2.playerGender;
    return FALSE;
}

bool8 ScrCmd_pokecry(struct ScriptContext *ctx)
{
    u16 v3 = VarGet(ScriptReadHalfword(ctx));
    u16 v5 = VarGet(ScriptReadHalfword(ctx));
    PlayCry5(v3, v5);
    return FALSE;
}

bool8 ScrCmd_waitpokecry(struct ScriptContext *ctx)
{
    SetupNativeScript(ctx, IsCryFinished);
    return TRUE;
}

bool8 ScrCmd_setmaptile(struct ScriptContext *ctx)
{
    u16 v3 = VarGet(ScriptReadHalfword(ctx));
    u16 v5 = VarGet(ScriptReadHalfword(ctx));
    u16 v7 = VarGet(ScriptReadHalfword(ctx));
    u16 v8 = VarGet(ScriptReadHalfword(ctx));
    v3 += 7;
    v5 += 7;
    if (!v8)
        MapGridSetMetatileIdAt(v3, v5, v7);
    else
        MapGridSetMetatileIdAt(v3, v5, v7 | 0xC00);
    return FALSE;
}

bool8 ScrCmd_setdooropened(struct ScriptContext *ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));
    x += 7;
    y += 7;
    PlaySE(sub_8058790(x, y));
    FieldAnimateDoorOpen(x, y);
    return FALSE;
}

bool8 ScrCmd_setdoorclosed(struct ScriptContext *ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));
    x += 7;
    y += 7;
    FieldAnimateDoorClose(x, y);
    return FALSE;
}

static bool8 IsDoorAnimationStopped()
{
    if (!FieldIsDoorAnimationRunning())
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_doorchange(struct ScriptContext *ctx)
{
    SetupNativeScript(ctx, IsDoorAnimationStopped);
    return TRUE;
}

bool8 ScrCmd_setdooropened2(struct ScriptContext *ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));
    x += 7;
    y += 7;
    FieldSetDoorOpened(x, y);
    return FALSE;
}

bool8 ScrCmd_setdoorclosed2(struct ScriptContext *ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));
    x += 7;
    y += 7;
    FieldSetDoorClosed(x, y);
    return FALSE;
}

bool8 ScrCmd_event_b1(struct ScriptContext *ctx)
{
    u8 v3 = ScriptReadByte(ctx);
    u16 v5 = VarGet(ScriptReadHalfword(ctx));
    u16 v7 = VarGet(ScriptReadHalfword(ctx));
    u16 v9 = VarGet(ScriptReadHalfword(ctx));
    ScriptAddElevatorMenuItem(v3, v5, v7, v9);
    return FALSE;
}

bool8 ScrCmd_event_b2(struct ScriptContext *ctx)
{
    ScriptShowElevatorMenu();
    ScriptContext1_Stop();
    return TRUE;
}

bool8 ScrCmd_checkcoins(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr = GetCoins();
    return FALSE;
}

bool8 ScrCmd_givecoins(struct ScriptContext *ctx)
{
    u16 coins = VarGet(ScriptReadHalfword(ctx));
    if (GiveCoins(coins) == TRUE)
        gScriptResult = 0;
    else
        gScriptResult = 1;

    return FALSE;
}

bool8 ScrCmd_removecoins(struct ScriptContext *ctx)
{
    u16 coins = VarGet(ScriptReadHalfword(ctx));
    if (TakeCoins(coins) == TRUE)
        gScriptResult = 0;
    else
        gScriptResult = 1;

    return FALSE;
}
