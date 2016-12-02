#include "global.h"
#include "script.h"
#include "asm_fieldmap.h"
#include "var.h"

#define RAM_SCRIPT_MAGIC 51

extern u8 *gUnknown_0202E8AC;
extern u32 gUnknown_0202E8B0;

static u8 sScriptContext1Status;
static struct ScriptContext sScriptContext1;
static struct ScriptContext sScriptContext2;
static bool8 sScriptContext2Enabled;

extern ScrCmdFunc gScriptCmdTable[];
extern ScrCmdFunc gScriptCmdTableEnd[];
extern void *gUnknown_083762D8;

void InitScriptContext(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd)
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

u8 SetupBytecodeScript(struct ScriptContext *ctx, void *ptr)
{
    ctx->scriptPtr = ptr;
    ctx->mode = 1;
    return 1;
}

void SetupNativeScript(struct ScriptContext *ctx, void *ptr)
{
    ctx->mode = 2;
    ctx->nativePtr = ptr;
}

void StopScript(struct ScriptContext *ctx)
{
    ctx->mode = 0;
    ctx->scriptPtr = 0;
}

u8 RunScript(struct ScriptContext *ctx)
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

u8 ScriptPush(struct ScriptContext *ctx, u8 *ptr)
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

u8 *ScriptPop(struct ScriptContext *ctx)
{
    if (ctx->stackDepth == 0)
        return NULL;

    ctx->stackDepth--;
    return ctx->stack[ctx->stackDepth];
}

void ScriptJump(struct ScriptContext *ctx, u8 *ptr)
{
    ctx->scriptPtr = ptr;
}

void ScriptCall(struct ScriptContext *ctx, u8 *ptr)
{
    ScriptPush(ctx, ctx->scriptPtr);
    ctx->scriptPtr = ptr;
}

void ScriptReturn(struct ScriptContext *ctx)
{
    ctx->scriptPtr = ScriptPop(ctx);
}

u16 ScriptReadHalfword(struct ScriptContext *ctx)
{
    u16 value = *(ctx->scriptPtr++);
    value |= *(ctx->scriptPtr++) << 8;
    return value;
}

u32 ScriptReadWord(struct ScriptContext *ctx)
{
    u32 value0 = *(ctx->scriptPtr++);
    u32 value1 = *(ctx->scriptPtr++);
    u32 value2 = *(ctx->scriptPtr++);
    u32 value3 = *(ctx->scriptPtr++);
    return (((((value3 << 8) + value2) << 8) + value1) << 8) + value0;
}

void ScriptContext2_Enable(void)
{
    sScriptContext2Enabled = TRUE;
}

void ScriptContext2_Disable(void)
{
    sScriptContext2Enabled = FALSE;
}

bool8 ScriptContext2_IsEnabled(void)
{
    return sScriptContext2Enabled;
}

void ScriptContext1_Init(void)
{
    InitScriptContext(&sScriptContext1, gScriptCmdTable, gScriptCmdTableEnd);
    sScriptContext1Status = 2;
}

bool8 ScriptContext2_RunScript(void)
{
    if (sScriptContext1Status == 2)
        return 0;

    if (sScriptContext1Status == 1)
        return 0;

    ScriptContext2_Enable();

    if (!RunScript(&sScriptContext1))
    {
        sScriptContext1Status = 2;
        ScriptContext2_Disable();
        return 0;
    }

    return 1;
}

void ScriptContext1_SetupScript(u8 *ptr)
{
    InitScriptContext(&sScriptContext1, gScriptCmdTable, gScriptCmdTableEnd);
    SetupBytecodeScript(&sScriptContext1, ptr);
    ScriptContext2_Enable();
    sScriptContext1Status = 0;
}

void ScriptContext1_Stop(void)
{
    sScriptContext1Status = 1;
}

void EnableBothScriptContexts()
{
    sScriptContext1Status = 0;
    ScriptContext2_Enable();
}

void ScriptContext2_RunNewScript(u8 *ptr)
{
    InitScriptContext(&sScriptContext2, &gScriptCmdTable, &gScriptCmdTableEnd);
    SetupBytecodeScript(&sScriptContext2, ptr);
    while (RunScript(&sScriptContext2) == 1)
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
        ScriptContext2_RunNewScript(ptr);
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

    ScriptContext1_SetupScript(ptr);
    return 1;
}

void mapheader_run_first_tag4_script_list_match(void)
{
    u8 *ptr = mapheader_get_first_match_from_tagged_ptr_list(4);
    if (ptr)
        ScriptContext2_RunNewScript(ptr);
}

u32 CalculateRamScriptChecksum(void)
{
    u32 i;
    u32 sum = 0;
    for (i = 0; i < sizeof(struct RamScriptData); i++)
        sum += ((u8 *)&gSaveBlock1.ramScript.data)[i];
    return sum;
}

void ClearRamScript(void)
{
    CpuFill32(0, &gSaveBlock1.ramScript, sizeof(struct RamScript));
}

bool8 InitRamScript(u8 *script, u16 scriptSize, u8 mapGroup, u8 mapNum, u8 objectId)
{
    struct RamScriptData *scriptData = &gSaveBlock1.ramScript.data;

    ClearRamScript();

    if (scriptSize > sizeof(scriptData->script))
        return FALSE;

    scriptData->magic = RAM_SCRIPT_MAGIC;
    scriptData->mapGroup = mapGroup;
    scriptData->mapNum = mapNum;
    scriptData->objectId = objectId;
    memcpy(scriptData->script, script, scriptSize);
    gSaveBlock1.ramScript.checksum = CalculateRamScriptChecksum();
    return TRUE;
}

u8 *GetRamScript(u8 objectId, u8 *script)
{
    struct RamScriptData *scriptData = &gSaveBlock1.ramScript.data;
    gUnknown_0202E8AC = 0;
    if (scriptData->magic == RAM_SCRIPT_MAGIC
     && scriptData->mapGroup == gSaveBlock1.location.mapGroup
     && scriptData->mapNum == gSaveBlock1.location.mapNum
     && scriptData->objectId == objectId)
    {
        if (CalculateRamScriptChecksum() == gSaveBlock1.ramScript.checksum)
        {
            gUnknown_0202E8AC = script;
            return scriptData->script;
        }
        ClearRamScript();
    }
    return script;
}
