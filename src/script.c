#include "global.h"
#include "script.h"
#include "fieldmap.h"

extern u16 VarGet(u16);

extern u8 *gUnknown_0202E8AC;
extern u32 gUnknown_0202E8B0;

extern u8 sScriptContext1Status; // 0x30005B0
extern struct ScriptContext sScriptContext1; // 0x30005B8
extern struct ScriptContext sScriptContext2; // 0x3000630
extern bool8 sScriptContext2Enabled; // 0x30006A4

extern ScrCmdFunc gScriptCmdTable[];
extern ScrCmdFunc gScriptCmdTableEnd[];
extern void *gUnknown_083762D8;

void script_env_init(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd)
{
    s32 i;

    ctx->mode = 0;
    ctx->scriptPtr = 0;
    ctx->stackDepth = 0;
    ctx->nativePtr = 0;
    ctx->cmdTable = cmdTable;
    ctx->cmdTableEnd = cmdTableEnd;

    for (i = 0; i < 4; i++)
        ctx->data[i] = 0;

    for (i = 0; i < 20; i++)
        ctx->stack[i] = 0;
}

u8 script_setup_bytecode_script(struct ScriptContext *ctx, void *ptr)
{
    ctx->scriptPtr = ptr;
    ctx->mode = 1;
    return 1;
}

void script_setup_asm_script(struct ScriptContext *ctx, void *ptr)
{
    ctx->mode = 2;
    ctx->nativePtr = ptr;
}

void script_stop(struct ScriptContext *ctx)
{
    ctx->mode = 0;
    ctx->scriptPtr = 0;
}

u8 sub_80653EC(struct ScriptContext *ctx)
{
    if (ctx->mode == 0)
        return 0;

    switch (ctx->mode)
    {
    case 0:
        return 0;
    case 2:
        if (ctx->nativePtr)
        {
            if (ctx->nativePtr() == 1)
                ctx->mode = 1;
            return 1;
        }
        ctx->mode = 1;
    case 1:
        while (1)
        {
            u8 cmdCode;
            ScrCmdFunc *func;

            if (!ctx->scriptPtr)
            {
                ctx->mode = 0;
                return 0;
            }

            if (ctx->scriptPtr == gUnknown_083762D8)
            {
                while (1)
                    asm("svc 2"); // HALT
            }

            cmdCode = *(ctx->scriptPtr);
            ctx->scriptPtr++;
            func = &ctx->cmdTable[cmdCode];

            if (func >= ctx->cmdTableEnd)
            {
                ctx->mode = 0;
                return 0;
            }

            if ((*func)(ctx) == 1)
                return 1;
        }
    }

    return 1;
}

u8 script_stack_push(struct ScriptContext *ctx, u8 *ptr)
{
    if (ctx->stackDepth + 1 >= 20)
    {
        return 1;
    }
    else
    {
        ctx->stack[ctx->stackDepth] = ptr;
        ctx->stackDepth++;
        return 0;
    }
}

u8 *script_stack_pop(struct ScriptContext *ctx)
{
    if (ctx->stackDepth == 0)
        return NULL;

    ctx->stackDepth--;
    return ctx->stack[ctx->stackDepth];
}

void script_jump(struct ScriptContext *ctx, u8 *ptr)
{
    ctx->scriptPtr = ptr;
}

void script_call(struct ScriptContext *ctx, u8 *ptr)
{
    script_stack_push(ctx, ctx->scriptPtr);
    ctx->scriptPtr = ptr;
}

void script_return(struct ScriptContext *ctx)
{
    ctx->scriptPtr = script_stack_pop(ctx);
}

u16 script_read_halfword(struct ScriptContext *ctx)
{
    u16 value = *(ctx->scriptPtr++);
    value |= *(ctx->scriptPtr++) << 8;
    return value;
}

u32 script_read_word(struct ScriptContext *ctx)
{
    u32 value0 = *(ctx->scriptPtr++);
    u32 value1 = *(ctx->scriptPtr++);
    u32 value2 = *(ctx->scriptPtr++);
    u32 value3 = *(ctx->scriptPtr++);
    return (((((value3 << 8) + value2) << 8) + value1) << 8) + value0;
}

void script_env_2_enable(void)
{
    sScriptContext2Enabled = TRUE;
}

void script_env_2_disable(void)
{
    sScriptContext2Enabled = FALSE;
}

bool8 script_env_2_is_enabled(void)
{
    return sScriptContext2Enabled;
}

void script_env_1_init(void)
{
    script_env_init(&sScriptContext1, gScriptCmdTable, gScriptCmdTableEnd);
    sScriptContext1Status = 2;
}

bool8 script_env_2_run_current_script(void)
{
    if (sScriptContext1Status == 2)
        return 0;

    if (sScriptContext1Status == 1)
        return 0;

    script_env_2_enable();

    if (!sub_80653EC(&sScriptContext1))
    {
        sScriptContext1Status = 2;
        script_env_2_disable();
        return 0;
    }

    return 1;
}

void script_env_1_execute_new_script(u8 *ptr)
{
    script_env_init(&sScriptContext1, gScriptCmdTable, gScriptCmdTableEnd);
    script_setup_bytecode_script(&sScriptContext1, ptr);
    script_env_2_enable();
    sScriptContext1Status = 0;
}

void sub_80655F0(void)
{
    sScriptContext1Status = 1;
}

void script_env_2_enable_and_set_ctx_running()
{
    sScriptContext1Status = 0;
    script_env_2_enable();
}

void script_env_2_execute_new_script(u8 *ptr)
{
    script_env_init(&sScriptContext2, &gScriptCmdTable, &gScriptCmdTableEnd);
    script_setup_bytecode_script(&sScriptContext2, ptr);
    while (sub_80653EC(&sScriptContext2) == 1)
        ;
}

u8 *mapheader_get_tagged_pointer(u8 tag)
{
    u8 *mapScripts = gMapHeader.mapScripts;

    if (!mapScripts)
        return NULL;

    while (1)
    {
        if (!*mapScripts)
            return NULL;
        if (*mapScripts == tag)
        {
            mapScripts++;
            return (u8 *)(mapScripts[0] + (mapScripts[1] << 8) + (mapScripts[2] << 16) + (mapScripts[3] << 24));
        }
        mapScripts += 5;
    }
}

void mapheader_run_script_by_tag(u8 tag)
{
    u8 *ptr = mapheader_get_tagged_pointer(tag);
    if (ptr)
        script_env_2_execute_new_script(ptr);
}

u8 *mapheader_get_first_match_from_tagged_ptr_list(u8 tag)
{
    u8 *ptr = mapheader_get_tagged_pointer(tag);

    if (!ptr)
        return NULL;

    while (1)
    {
        u16 varIndex1;
        u16 varIndex2;
        varIndex1 = ptr[0] | (ptr[1] << 8);
        if (!varIndex1)
            return NULL;
        ptr += 2;
        varIndex2 = ptr[0] | (ptr[1] << 8);
        ptr += 2;
        if (VarGet(varIndex1) == VarGet(varIndex2))
            return (u8 *)(ptr[0] + (ptr[1] << 8) + (ptr[2] << 16) + (ptr[3] << 24));
        ptr += 4;
    }
}

void mapheader_run_script_with_tag_x1(void)
{
    mapheader_run_script_by_tag(1);
}

void mapheader_run_script_with_tag_x3(void)
{
    mapheader_run_script_by_tag(3);
}

void mapheader_run_script_with_tag_x5(void)
{
    mapheader_run_script_by_tag(5);
}

void mapheader_run_script_with_tag_x6(void)
{
    mapheader_run_script_by_tag(6);
}

bool8 mapheader_run_first_tag2_script_list_match(void)
{
    u8 *ptr = mapheader_get_first_match_from_tagged_ptr_list(2);

    if (!ptr)
        return 0;

    script_env_1_execute_new_script(ptr);
    return 1;
}

void mapheader_run_first_tag4_script_list_match()
{
    u8 *ptr = mapheader_get_first_match_from_tagged_ptr_list(4);
    if (ptr)
        script_env_2_execute_new_script(ptr);
}

u32 sub_8065760(void)
{
    u32 i;
    u32 sum = 0;
    for (i = 0; i < sizeof(struct RamScriptData); i++)
        sum += ((u8 *)&gSaveBlock1.ramScript.data)[i];
    return sum;
}

void killram(void)
{
    CpuFill32(0, &gSaveBlock1.ramScript, sizeof(struct RamScript));
}

bool8 sub_80657A8(u8 *a1, u16 a2, u8 a3, u8 a4, u8 a5)
{
    struct RamScriptData *scriptData = &gSaveBlock1.ramScript.data;

    killram();

    if (a2 > 995)
        return FALSE;

    scriptData->magic = 51;
    scriptData->mapGroup = a3;
    scriptData->mapNum = a4;
    scriptData->objectId = a5;
    memcpy(scriptData->script, a1, a2);
    gSaveBlock1.ramScript.checksum = sub_8065760();
    return TRUE;
}

u8 *sub_806580C(u8 a1, u8 *a2)
{
    struct RamScriptData *scriptData = &gSaveBlock1.ramScript.data;
    gUnknown_0202E8AC = 0;
    if (scriptData->magic == 51
     && scriptData->mapGroup == gSaveBlock1.location.mapGroup
     && scriptData->mapNum == gSaveBlock1.location.mapNum
     && scriptData->objectId == a1)
    {
        if (sub_8065760() == gSaveBlock1.ramScript.checksum)
        {
            gUnknown_0202E8AC = a2;
            return scriptData->script;
        }
        killram();
    }
    return a2;
}
