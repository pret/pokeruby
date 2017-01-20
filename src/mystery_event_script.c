#include "global.h"
#include "script.h"
#include "string_util.h"
#include "text.h"

#ifdef SAPPHIRE
#define UNK_MASK 0x100
#else
#define UNK_MASK 0x80
#endif

extern struct ScriptContext gUnknown_02039288;

extern ScrCmdFunc gScriptFuncs[];
extern ScrCmdFunc gScriptFuncs_End[];

extern u8 gOtherText_DataCannotUseVersion[];

void sub_8126160(u32 val);

bool32 sub_8126098(u16 a1, u32 a2, u16 a3, u32 a4)
{
    if (!(a1 & 0x2))
        return FALSE;

    if (!(a2 & 0x2))
        return FALSE;

    if (!(a3 & 0x4))
        return FALSE;

    if (!(a4 & UNK_MASK))
        return FALSE;

    return TRUE;
}

void sub_81260D0(void)
{
    StringExpandPlaceholders(gStringVar4, gOtherText_DataCannotUseVersion);
    sub_8126160(3);
}

void sub_81260EC(struct ScriptContext *ctx, u8 *ptr)
{
    InitScriptContext(ctx, gScriptFuncs, gScriptFuncs_End);
    SetupBytecodeScript(ctx, ptr);
    ctx->data[0] = (u32)ptr;
    ctx->data[1] = 0;
    ctx->data[2] = 0;
    ctx->data[3] = 0;
}

bool32 sub_812611C(struct ScriptContext *ctx)
{
    if (RunScript(ctx) && ctx->data[3])
        return TRUE;
    else
        return FALSE;
}

u32 sub_812613C(u8 *ptr)
{
    struct ScriptContext *ctx = &gUnknown_02039288;
    sub_81260EC(ctx, ptr);
    while (sub_812611C(ctx))
        ;
    return ctx->data[2];
}

void sub_8126160(u32 val)
{
    gUnknown_02039288.data[2] = val;
}

int sub_812616C(u8 *a1, int a2)
{
    unsigned int i;
    int sum = 0;

    for (i = 0; i < a2; i++)
        sum += a1[i];

    return sum;
}

u32 sub_812618C(u8 *ptr)
{
    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

void sub_81261A4(u8 *ptr, u32 val)
{
    ptr[0] = val;
    ptr[1] = val >> 8;
    ptr[2] = val >> 16;
    ptr[3] = val >> 24;
}
