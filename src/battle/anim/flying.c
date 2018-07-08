#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;

void sub_80785E4(struct Sprite *sprite);
void sub_80DA034(struct Sprite *sprite);
void sub_80DA05C(struct Sprite *sprite);
void sub_80DA16C(struct Sprite *sprite);
void sub_80DA1EC(struct Sprite *sprite);
void sub_80DA208(struct Sprite *sprite);
void sub_80DA300(struct Sprite *sprite);
void sub_80DA348(struct Sprite *sprite);
void sub_80DA38C(struct Sprite *sprite);
void sub_80DA4D8(struct Sprite *sprite);
void sub_80DA410(struct Sprite *sprite);
void sub_80DAD30(struct Sprite *sprite);
void sub_80DAD84(struct Sprite *sprite);
void sub_80DB000(struct Sprite *sprite);
void sub_80DB194(struct Sprite *sprite);
void sub_80DB1F4(struct Sprite *sprite);
void sub_80DB288(struct Sprite *sprite);
void sub_80DB374(struct Sprite *sprite);
void sub_80DB458(struct Sprite *sprite);
void sub_80DB564(struct Sprite *sprite);
void sub_80DB5E4(struct Sprite *sprite);

void sub_80DA0DC(u8 taskId);

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA380 =
{
    .tileTag = 10009,
    .paletteTag = 10009,
    .oam = &gOamData_837DF7C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA034,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA398[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xA, 0x0, 0, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA3B0[] =
{
    gSpriteAffineAnim_83DA398,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA3B4 =
{
    .tileTag = 10009,
    .paletteTag = 10009,
    .oam = &gOamData_837DFDC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA3B0,
    .callback = sub_80DA16C,
};

const union AnimCmd gSpriteAnim_83DA3CC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DA3E0[] =
{
    gSpriteAnim_83DA3CC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA3E4 =
{
    .tileTag = 10154,
    .paletteTag = 10154,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83DA3E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA208,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA3FC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA424[] =
{
    gSpriteAffineAnim_83DA3FC,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA428[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 50, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA438[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -40, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA448[] =
{
    gSpriteAffineAnim_83DA428,
    gSpriteAffineAnim_83DA438,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA450 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA424,
    .callback = sub_80DA300,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA468 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DF9C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA448,
    .callback = sub_80DA38C,
};

const union AnimCmd gSpriteAnim_83DA480[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA488[] =
{
    ANIMCMD_FRAME(16, 0, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA490[] =
{
    gSpriteAnim_83DA480,
    gSpriteAnim_83DA488,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA498 =
{
    .tileTag = 10270,
    .paletteTag = 10270,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA4D8,
};

const u16 gUnknownPalette_83DA4B0[] = INCBIN_U16("graphics/unknown/unknown_3DA4B0.gbapal");

const struct SpriteTemplate gSpriteTemplate_83DA4D0 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD30,
};

const struct SpriteTemplate gSpriteTemplate_83DA4E8 =
{
    .tileTag = 10270,
    .paletteTag = 10270,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD84,
};

const union AnimCmd gSpriteAnim_83DA500[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA518[] =
{
    gSpriteAnim_83DA500,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA51C =
{
    .tileTag = 10162,
    .paletteTag = 10162,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83DA518,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB000,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA534[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFEC, 0x0, 0, 7),
    AFFINEANIMCMD_FRAME(0xFFEC, 0xFFEC, 0, 5),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA564[] =
{
    gSpriteAffineAnim_83DA534,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA568 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA564,
    .callback = sub_80DB194,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA580[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA590[] =
{
    gSpriteAffineAnim_83DA580,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA594 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA590,
    .callback = sub_80DB1F4,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA5AC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA5D4[] =
{
    gSpriteAffineAnim_83DA5AC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA5D8 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA5D4,
    .callback = sub_80DB288,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA5F0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x20, 0, 12),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 11),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA610[] =
{
    gSpriteAffineAnim_83DA5F0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA614 =
{
    .tileTag = 10272,
    .paletteTag = 10272,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB374,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA62C =
{
    .tileTag = 10273,
    .paletteTag = 10273,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB458,
};

const struct SpriteTemplate gSpriteTemplate_83DA644 =
{
    .tileTag = 10212,
    .paletteTag = 10212,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB564,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA65C =
{
    .tileTag = 10284,
    .paletteTag = 10284,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB5E4,
};

void sub_80DA034(struct Sprite *sprite) 
{
    sub_8078764(sprite, 0);
    sprite->pos1.y += 20;
    sprite->data[1] = 0xBF;
    sprite->callback = sub_80DA05C;
    sub_80DA05C(sprite);
}

void sub_80DA05C(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], 0x20);
    sprite->pos2.y = Cos(sprite->data[1], 0x8);
    sprite->data[1] = (sprite->data[1] + 5) & 0xFF;
    if(++sprite->data[0] == 0x47)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA09C(u8 taskId) 
{
    gTasks[taskId].data[0] = gBattleAnimArgs[1];
    gTasks[taskId].data[1] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(0x2719);
    gTasks[taskId].func = sub_80DA0DC;
}

#ifdef NONMATCHING
void sub_80DA0DC(u8 taskId)
{
    gTasks[taskId].data[10]++;
    if(gTasks[taskId].data[10] == gTasks[taskId].data[1])
    {
        u16 r0;
        u16 r2;
        s32 i;
    
        gTasks[taskId].data[10] = 0;
        r0 = gTasks[taskId].data[2];
        r2 = gPlttBufferFaded[r0 * 8];
        for(i = 0; i < 8; i++) 
            gPlttBufferFaded[r0 * 8 + i + 0x107] = gPlttBufferFaded[r0 * 8 + i + 0x107];
        gTasks[taskId].data[2] = ((r0 + 0x101) * 2) + r2;
    }
    gTasks[taskId].data[0] = gTasks[taskId].data[0] * 32;
    if(gTasks[taskId].data[0] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
}
#else
NAKED
void sub_80DA0DC(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	ldr r2, _080DA15C @ =gTasks\n\
	lsls r0, r5, 2\n\
	adds r0, r5\n\
	lsls r0, 3\n\
	adds r3, r0, r2\n\
	ldrh r0, [r3, 0x1C]\n\
	adds r1, r0, 0x1\n\
	strh r1, [r3, 0x1C]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	movs r4, 0xA\n\
	ldrsh r1, [r3, r4]\n\
	adds r7, r2, 0\n\
	cmp r0, r1\n\
	bne _080DA13A\n\
	movs r0, 0\n\
	strh r0, [r3, 0x1C]\n\
	ldrb r0, [r3, 0xC]\n\
	ldr r2, _080DA160 @ =gPlttBufferFaded\n\
	lsls r0, 4\n\
	movs r3, 0x84\n\
	lsls r3, 1\n\
	adds r1, r0, r3\n\
	lsls r1, 1\n\
	adds r1, r2\n\
	ldrh r6, [r1]\n\
	movs r4, 0x7\n\
	mov r12, r0\n\
	ldr r0, _080DA164 @ =0x00000107\n\
	add r0, r12\n\
	lsls r0, 1\n\
	adds r3, r0, r2\n\
_080DA122:\n\
	ldrh r0, [r3]\n\
	strh r0, [r1]\n\
	subs r3, 0x2\n\
	subs r1, 0x2\n\
	subs r4, 0x1\n\
	cmp r4, 0\n\
	bgt _080DA122\n\
	ldr r0, _080DA168 @ =0x00000101\n\
	add r0, r12\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	strh r6, [r0]\n\
_080DA13A:\n\
	lsls r0, r5, 2\n\
	adds r0, r5\n\
	lsls r0, 3\n\
	adds r0, r7\n\
	ldrh r1, [r0, 0x8]\n\
	subs r1, 0x1\n\
	strh r1, [r0, 0x8]\n\
	lsls r1, 16\n\
	cmp r1, 0\n\
	bne _080DA154\n\
	adds r0, r5, 0\n\
	bl DestroyAnimVisualTask\n\
_080DA154:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
    .align 2, 0\n\
_080DA15C: .4byte gTasks\n\
_080DA160: .4byte gPlttBufferFaded\n\
_080DA164: .4byte 0x00000107\n\
_080DA168: .4byte 0x00000101\n\
    .syntax divided\n");
}
#endif

void sub_80DA16C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80DA1EC);
}

void sub_80DA1EC(struct Sprite *sprite)
{
    if (TranslateAnimLinear(sprite) != 0)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA208(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    if (IsContest())
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];

    if (gBattleAnimArgs[6] == 0)
    {
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sprite->data[2] = sprite->data[2] + gBattleAnimArgs[2];
    sprite->data[4] = sprite->data[4] + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    SeekSpriteAnim(sprite, gBattleAnimArgs[5]);
}

void sub_80DA300(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80DA348;
    gSprites[GetAnimBattlerSpriteId(0)].invisible = 1;
}

void sub_80DA348(struct Sprite *sprite)
{
    if (sprite->data[0] > 0)
    {
        sprite->data[0]--;
    }
    else
    {
        sprite->data[2] += sprite->data[1];
        sprite->pos2.y -= (sprite->data[2] >> 8);
    }

    if (sprite->pos1.y + sprite->pos2.y < -32)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA38C(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        sprite->pos1.x = 272;
        sprite->pos1.y = -32;
        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->pos1.x = -32;
        sprite->pos1.y = -32;
    }

    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    InitAnimLinearTranslation(sprite);
    sprite->callback = sub_80DA410;
}

void sub_80DA410(struct Sprite *sprite)
{
    sprite->data[0] = 1;
    TranslateAnimLinear(sprite);

    if (((u16)sprite->data[3] >> 8) > 200)
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.x = 0;
        sprite->data[3] &= 0xFF;
    }

    if ((u32)(sprite->pos1.x + sprite->pos2.x + 32) > 304 || sprite->pos1.y + sprite->pos2.y > 160)
    {
        gSprites[GetAnimBattlerSpriteId(0)].invisible = 0;
        DestroyAnimSprite(sprite);
    }
}

void sub_80DA48C(struct Sprite *sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        if (sprite->oam.affineMode & 1)
        {
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->oam.affineMode = 0;
        }
        
        DestroySprite(sprite);
        gAnimVisualTaskCount--;
    }
}
