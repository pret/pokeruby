#include "global.h"
#include "script.h"
#include "rng.h"

extern void killram(void);
extern u16 *GetVarPointer(u16);
extern u16 VarGet(u16);
extern void sub_8126160(u8);

typedef u16 (*SpecialFunc)(void);
typedef void (*NativeFunc)(void);

extern u32 gUnknown_0202E8AC;
extern u32 gUnknown_0202E8B0;
extern u16 gScriptResult;

extern SpecialFunc gSpecials[];
extern u8 *gStdScripts[];
extern u8 *gStdScripts_End[];
extern u8 gUnknown_083762DC[6][3];

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
    script_stop(ctx);
    return FALSE;
}

bool8 ScrCmd_jumpasm(struct ScriptContext *ctx)
{
    u32 addr = script_read_word(ctx);
    script_setup_asm_script(ctx, (void *)addr);
    return TRUE;
}

bool8 ScrCmd_special(struct ScriptContext *ctx)
{
    u16 index = script_read_halfword(ctx);
    gSpecials[index]();
    return FALSE;
}

bool8 ScrCmd_specialval(struct ScriptContext *ctx)
{
    u16 *var = GetVarPointer(script_read_halfword(ctx));
    *var = gSpecials[script_read_halfword(ctx)]();
    return FALSE;
}

bool8 ScrCmd_callasm(struct ScriptContext *ctx)
{
    NativeFunc func = (NativeFunc)script_read_word(ctx);
    func();
    return FALSE;
}

bool8 ScrCmd_waitstate(struct ScriptContext *ctx)
{
    sub_80655F0();
    return TRUE;
}

bool8 ScrCmd_jump(struct ScriptContext *ctx)
{
    u8 *ptr = (u8 *)script_read_word(ctx);
    script_jump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_return(struct ScriptContext *ctx)
{
    script_return(ctx);
    return FALSE;
}

bool8 ScrCmd_call(struct ScriptContext *ctx)
{

    u8 *ptr = (u8 *)script_read_word(ctx);
    script_call(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_jumpif(struct ScriptContext *ctx)
{
    u8 condition = *(ctx->scriptPtr++);
    u8 *ptr = (u8 *)script_read_word(ctx);
    if (gUnknown_083762DC[condition][ctx->comparisonResult] == 1)
        script_jump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_callif(struct ScriptContext *ctx)
{
    u8 condition = *(ctx->scriptPtr++);
    u8 *ptr = (u8 *)script_read_word(ctx);
    if (gUnknown_083762DC[condition][ctx->comparisonResult] == 1)
        script_call(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_setvaddress(struct ScriptContext *ctx)
{
    u32 addr1 = (u32)ctx->scriptPtr - 1;
    u32 addr2 = script_read_word(ctx);
    gUnknown_0202E8B0 = addr2 - addr1;
    return FALSE;
}

bool8 ScrCmd_vjump(struct ScriptContext *ctx)
{
    u32 addr = script_read_word(ctx);
    script_jump(ctx, (u8 *)(addr - gUnknown_0202E8B0));
    return FALSE;
}

bool8 ScrCmd_vcall(struct ScriptContext *ctx)
{
    u32 addr = script_read_word(ctx);
    script_call(ctx, (u8 *)(addr - gUnknown_0202E8B0));
    return FALSE;
}

bool8 ScrCmd_if5(struct ScriptContext *ctx)
{
    u8 condition = *(ctx->scriptPtr++);
    u8 *ptr = (u8 *)(script_read_word(ctx) - gUnknown_0202E8B0);
    if (gUnknown_083762DC[condition][ctx->comparisonResult] == 1)
        script_jump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_if6(struct ScriptContext *ctx)
{
    u8 condition = *(ctx->scriptPtr++);
    u8 *ptr = (u8 *)(script_read_word(ctx) - gUnknown_0202E8B0);
    if (gUnknown_083762DC[condition][ctx->comparisonResult] == 1)
        script_call(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_jumpstd(struct ScriptContext *ctx)
{
    u8 index = *(ctx->scriptPtr++);
    u8 **ptr = &gStdScripts[index];
    if (ptr < gStdScripts_End)
        script_jump(ctx, *ptr);
    return FALSE;
}

bool8 ScrCmd_callstd(struct ScriptContext *ctx)
{
    u8 index = *(ctx->scriptPtr++);
    u8 **ptr = &gStdScripts[index];
    if (ptr < gStdScripts_End)
        script_call(ctx, *ptr);
    return FALSE;
}

bool8 ScrCmd_jumpstdif(struct ScriptContext *ctx)
{
    u8 condition = *(ctx->scriptPtr++);
    u8 index = *(ctx->scriptPtr++);
    if (gUnknown_083762DC[condition][ctx->comparisonResult] == 1)
    {
        u8 **ptr = &gStdScripts[index];
        if (ptr < gStdScripts_End)
            script_jump(ctx, *ptr);
    }
    return FALSE;
}

bool8 ScrCmd_callstdif(struct ScriptContext *ctx)
{
    u8 condition = *(ctx->scriptPtr++);
    u8 index = *(ctx->scriptPtr++);
    if (gUnknown_083762DC[condition][ctx->comparisonResult] == 1)
    {
        u8 **ptr = &gStdScripts[index];
        if (ptr < gStdScripts_End)
            script_call(ctx, *ptr);
    }
    return FALSE;
}

bool8 ScrCmd_jumpram(struct ScriptContext *ctx)
{
    script_jump(ctx, (u8 *)gUnknown_0202E8AC);
    return FALSE;
}

bool8 ScrCmd_die(struct ScriptContext *ctx)
{
    killram();
    script_stop(ctx);
    return TRUE;
}

bool8 ScrCmd_setbyte(struct ScriptContext *ctx)
{
    u8 value = *(ctx->scriptPtr++);
    sub_8126160(value);
    return FALSE;
}

bool8 ScrCmd_loadptr(struct ScriptContext *ctx)
{
    u8 index = *(ctx->scriptPtr++);
    ctx->data[index] = script_read_word(ctx);
    return FALSE;
}

bool8 ScrCmd_loadbytefrompointer(struct ScriptContext *ctx)
{
    u8 index = *(ctx->scriptPtr++);
    ctx->data[index] = *(u8 *)script_read_word(ctx);
    return FALSE;
}

bool8 ScrCmd_writebytetooffset(struct ScriptContext *ctx)
{
    u8 value = *(ctx->scriptPtr++);
    *(u8 *)script_read_word(ctx) = value;
    return FALSE;
}

bool8 ScrCmd_setbufferbyte(struct ScriptContext *ctx)
{
    u8 index = *(ctx->scriptPtr++);
    ctx->data[index] = *(ctx->scriptPtr++);
    return FALSE;
}

bool8 ScrCmd_setptrbyte(struct ScriptContext *ctx)
{
    u8 index = *(ctx->scriptPtr++);
    *(u8 *)script_read_word(ctx) = ctx->data[index];
    return FALSE;
}

bool8 ScrCmd_copybuffers(struct ScriptContext *ctx)
{
    u8 destIndex = *(ctx->scriptPtr++);
    u8 srcIndex = *(ctx->scriptPtr++);
    ctx->data[destIndex] = ctx->data[srcIndex];
    return FALSE;
}

bool8 ScrCmd_copybyte(struct ScriptContext *ctx)
{
    u8 *ptr = (u8 *)script_read_word(ctx);
    *ptr = *(u8 *)script_read_word(ctx);
    return FALSE;
}

bool8 ScrCmd_setvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(script_read_halfword(ctx));
    *ptr = script_read_halfword(ctx);
    return FALSE;
}

bool8 ScrCmd_copyvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(script_read_halfword(ctx));
    *ptr = *GetVarPointer(script_read_halfword(ctx));
    return FALSE;
}

bool8 ScrCmd_setorcopyvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(script_read_halfword(ctx));
    *ptr = VarGet(script_read_halfword(ctx));
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
    u8 value1 = ctx->data[*(ctx->scriptPtr++)];
    u8 value2 = ctx->data[*(ctx->scriptPtr++)];
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_comparebuffertobyte(struct ScriptContext *ctx)
{
    u8 value1 = ctx->data[*(ctx->scriptPtr++)];
    u8 value2 = *(ctx->scriptPtr++);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_comparebuffertoptrbyte(struct ScriptContext *ctx)
{
    u8 value1 = ctx->data[*(ctx->scriptPtr++)];
    u8 value2 = *(u8 *)script_read_word(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compareptrbytetobuffer(struct ScriptContext *ctx)
{
    u8 value1 = *(u8 *)script_read_word(ctx);
    u8 value2 = ctx->data[*(ctx->scriptPtr++)];
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compareptrbytetobyte(struct ScriptContext *ctx)
{
    u8 value1 = *(u8 *)script_read_word(ctx);
    u8 value2 = *(ctx->scriptPtr++);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compareptrbytes(struct ScriptContext *ctx)
{
    u8 value1 = *(u8 *)script_read_word(ctx);
    u8 value2 = *(u8 *)script_read_word(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare(struct ScriptContext *ctx)
{
    u16 value1 = *GetVarPointer(script_read_halfword(ctx));
    u16 value2 = script_read_halfword(ctx);
    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

bool8 ScrCmd_comparevars(struct ScriptContext *ctx)
{
    u16 *ptr1 = GetVarPointer(script_read_halfword(ctx));
    u16 *ptr2 = GetVarPointer(script_read_halfword(ctx));
    ctx->comparisonResult = compare_012(*ptr1, *ptr2);
    return FALSE;
}

bool8 ScrCmd_addvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(script_read_halfword(ctx));
    *ptr += script_read_halfword(ctx);
    return FALSE;
}

bool8 ScrCmd_subvar(struct ScriptContext *ctx)
{
    u16 *ptr = GetVarPointer(script_read_halfword(ctx));
    *ptr -= VarGet(script_read_halfword(ctx));
    return FALSE;
}

bool8 ScrCmd_random(struct ScriptContext *ctx)
{
    u16 max = VarGet(script_read_halfword(ctx));
    gScriptResult = Random() % max;
    return FALSE;
}
