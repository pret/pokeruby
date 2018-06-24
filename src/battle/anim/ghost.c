#include "global.h"
#include "sound.h"
#include "constants/songs.h"
#include "trig.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gUnknown_0202F7D2;

void sub_80DDB6C(struct Sprite *sprite);
void sub_80DDBD8(struct Sprite *);
void sub_80DDC4C(struct Sprite *);
void sub_80DDCC8(struct Sprite *);
void sub_80DDD58(struct Sprite *sprite);
void sub_80DDD78(struct Sprite *);
void sub_80DDE7C(u8 taskId);
void sub_80DDED0(u8 taskId);
void sub_80DDF40(struct Sprite *sprite);
void sub_80DDFE8(struct Sprite *);
void sub_80DE0FC(struct Sprite *sprite);
void sub_80DE114(struct Sprite *);
void sub_80DE2DC(u8 taskId);
void sub_80DE3D4(u8 taskId);
void sub_80DE7B8(struct Sprite *sprite);
void sub_80DEF3C(struct Sprite *sprite);
void sub_80DF0B8(struct Sprite *sprite);
void sub_80DF0B8(struct Sprite *sprite);
void sub_80DF3D8(struct Sprite *sprite);
void sub_80DF49C(struct Sprite *sprite);

const union AffineAnimCmd gSpriteAffineAnim_83DAE48[] =
{
    AFFINEANIMCMD_FRAME(0x1E, 0x1E, 10, 5),
    AFFINEANIMCMD_FRAME(0xFFE2, 0xFFE2, 10, 5),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAE60[] =
{
    gSpriteAffineAnim_83DAE48,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE64 =
{
    .tileTag = 10013,
    .paletteTag = 10013,
    .oam = &gOamData_837DFEC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAE60,
    .callback = sub_80DDB6C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE7C =
{
    .tileTag = 10013,
    .paletteTag = 10013,
    .oam = &gOamData_837E04C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DDD58,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAE94[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 10, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAEA4[] =
{
    gSpriteAffineAnim_83DAE94,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAEA8 =
{
    .tileTag = 10176,
    .paletteTag = 10176,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAEA4,
    .callback = sub_80DDF40,
};

const union AnimCmd gSpriteAnim_83DAEC0[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(8, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(24, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DAED8[] =
{
    gSpriteAnim_83DAEC0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAEDC =
{
    .tileTag = 10177,
    .paletteTag = 10177,
    .oam = &gOamData_837DF74,
    .anims = gSpriteAnimTable_83DAED8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DE0FC,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAEF4[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAF04[] =
{
    gSpriteAffineAnim_83DAEF4,
};

const struct SpriteTemplate gSpriteTemplate_83DAF08 =
{
    .tileTag = 10188,
    .paletteTag = 10188,
    .oam = &gOamData_837E07C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DE7B8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAF20 =
{
    .tileTag = 10199,
    .paletteTag = 10199,
    .oam = &gOamData_837E074,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DEF3C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAF38 =
{
    .tileTag = 10200,
    .paletteTag = 10200,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF0B8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAF50 =
{
    .tileTag = 10221,
    .paletteTag = 10221,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF0B8,
};

const union AnimCmd gSpriteAnim_83DAF68[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DAF7C[] =
{
    gSpriteAnim_83DAF68,
};

const struct SpriteTemplate gSpriteTemplate_83DAF80 =
{
    .tileTag = 10253,
    .paletteTag = 10253,
    .oam = &gOamData_837E094,
    .anims = gSpriteAnimTable_83DAF7C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF3D8,
};

const struct SpriteTemplate gSpriteTemplate_83DAF98 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF49C,
};

void sub_80DDB6C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sub_8078BD4(sprite);
    sprite->callback = sub_80DDBD8;
    sprite->data[6] = 16;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = sprite->data[6];
}

void sub_80DDBD8(struct Sprite *sprite)
{
    s16 r0;
    s16 r2;
    sub_80DDCC8(sprite);
    if (TranslateAnimSpriteByDeltas(sprite))
    {
        sprite->callback = sub_80DDC4C;
        return;
    }
    sprite->pos2.x += Sin(sprite->data[5], 10);
    sprite->pos2.y += Cos(sprite->data[5], 15);
    r2 = sprite->data[5];
    sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    r0 = sprite->data[5];
    if (r2 != 0 && r2 <= 196)
        return;
    if (r0 <= 0)
        return;
    PlaySE12WithPanning(SE_W109, gUnknown_0202F7D2);
}

void sub_80DDC4C(struct Sprite *sprite)
{
    s16 r2;
    s16 r0;
    sprite->data[0] = 1;
    TranslateAnimSpriteByDeltas(sprite);
    sprite->pos2.x += Sin(sprite->data[5],10);
    sprite->pos2.y += Cos(sprite->data[5],15);
    
    r2 = sprite->data[5];
    sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    r0 = sprite->data[5];
    
    if(r2 == 0 || r2 > 196)
        if(r0 > 0)
            PlaySE(SE_W109);
    
    if(sprite->data[6] == 0)
    {
        sprite->invisible = TRUE; 
        sprite->callback = sub_807861C;
    }
    else
        sub_80DDCC8(sprite);
}

void sub_80DDCC8(struct Sprite *sprite)
{
    
    s16 r0; 
    if(sprite->data[6] > 0xFF)
    {
        if(++sprite->data[6] == 0x10d)
            sprite->data[6] = 0;
        return;
    }
    
    r0 = sprite->data[7];
    sprite->data[7]++;
    
    if((r0 & 0xFF) == 0)
    {
        sprite->data[7] &= 0xff00;
        if((sprite->data[7] & 0x100) != 0)
            sprite->data[6]++;
        else
            sprite->data[6]--;
    }
    else
        return;
    
    REG_BLDALPHA = BLDALPHA_BLEND(sprite->data[6], 16 - sprite->data[6]);
    if(sprite->data[6] == 0 || sprite->data[6] == 16)
        sprite->data[7] ^= 0x100;
    if(sprite->data[6] == 0)
        sprite->data[6] = 0x100;
}

void sub_80DDD58(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    sprite->callback = sub_80DDD78;
    sub_80DDD78(sprite);
}

void sub_80DDD78(struct Sprite *sprite)
{
    u16 temp1;
    sprite->pos2.x = Sin(sprite->data[0], 32);
    sprite->pos2.y = Cos(sprite->data[0], 8);
    temp1 = sprite->data[0] - 65;
    if (temp1 <= 130)
        sprite->oam.priority = 2;
    else
        sprite->oam.priority = 1;
    sprite->data[0] = (sprite->data[0] + 19) & 0xFF;
    sprite->data[2] += 80;
    sprite->pos2.y += sprite->data[2] >> 8;
    sprite->data[7] += 1;
    if (sprite->data[7] == 61)
        DestroyAnimSprite(sprite);
}

void sub_80DDDF0(u8 taskId)
{
    u8 spriteId;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x1000;
    spriteId = GetAnimBattlerSpriteId(0);
    sub_8078E70(spriteId, 1);
    obj_id_set_rotscale(spriteId, 128, 128, 0);
    gSprites[spriteId].invisible = FALSE;
    gTasks[taskId].data[0] = 128;
    gTasks[taskId].data[1] = *gBattleAnimArgs;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 16;
    gTasks[taskId].func = sub_80DDE7C;
}

void sub_80DDE7C(u8 taskId)
{
    gTasks[taskId].data[10] += 1;
    if (gTasks[taskId].data[10] == 3)
    {
        gTasks[taskId].data[10] = 0;
        gTasks[taskId].data[2] += 1;
        gTasks[taskId].data[3] -= 1;
        REG_BLDALPHA = gTasks[taskId].data[3] << 8 | gTasks[taskId].data[2];
        if (gTasks[taskId].data[2] != 9)
            return;
        gTasks[taskId].func = sub_80DDED0;
    }
}

void sub_80DDED0(u8 taskId)
{
    u8 spriteId;
    if (gTasks[taskId].data[1] > 0)
    {
        gTasks[taskId].data[1] -= 1;
        return;
    }
    spriteId = GetAnimBattlerSpriteId(0);
    gTasks[taskId].data[0] += 8;
    if (gTasks[taskId].data[0] <= 0xFF)
    {
        obj_id_set_rotscale(spriteId, gTasks[taskId].data[0], gTasks[taskId].data[0], 0);
        return;
    }
    sub_8078F40(spriteId);
    DestroyAnimVisualTask(taskId);
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

void sub_80DDF40(struct Sprite *sprite)
{
    u16 r5, r6;
    r5 = sprite->pos1.x;
    r6 = sprite->pos1.y;
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[0];
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sprite->data[6] = (((s16)r5 - sprite->pos1.x) << 4) / (gBattleAnimArgs[0] << 1);
    sprite->data[7] = (((s16)r6 - sprite->pos1.y) << 4) / (gBattleAnimArgs[0] << 1);
    sprite->callback = sub_80DDFE8;
}

void sub_80DDFE8(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[4] += sprite->data[6];
        sprite->data[5] += sprite->data[7];
        sprite->pos1.x = sprite->data[4] >> 4;
        sprite->pos1.y = sprite->data[5] >> 4;
        sprite->data[1] -= 1;
        if (sprite->data[1] > 0)
            break;
        sprite->data[0] += 1;
        break;
    case 1:
        sprite->data[2] -= 1;
        if (sprite->data[2] > 0)
            break;
        sprite->data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
        sprite->data[4] = sprite->pos1.x << 4;
        sprite->data[5] = sprite->pos1.y << 4;
        sprite->data[6] = ((sprite->data[1] - sprite->pos1.x) << 4) / sprite->data[3];
        sprite->data[7] = ((sprite->data[2] - sprite->pos1.y) << 4) / sprite->data[3];
        sprite->data[0] += 1;
        break;
    case 2:
        sprite->data[4] += sprite->data[6];
        sprite->data[5] += sprite->data[7];
        sprite->pos1.x = sprite->data[4] >> 4;
        sprite->pos1.y = sprite->data[5] >> 4;
        sprite->data[3] -= 1;
        if (sprite->data[3] > 0)
            break;
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
        sprite->data[0] += 1;
        break;
    case 3:
        move_anim_8074EE0(sprite);
        break;
    }
}

void sub_80DE0FC(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    sprite->callback = sub_80DE114;
}

/* NONMATCHING */
NAKED
void sub_80DE114(struct Sprite *sprite)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tadds r3, r0, 0\n"
                "\tmovs r5, 0\n"
                "\tmovs r6, 0\n"
                "\tadds r0, 0x3F\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x10\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080DE1AA\n"
                "\tadds r1, r3, 0\n"
                "\tadds r1, 0x3E\n"
                "\tldrb r2, [r1]\n"
                "\tmovs r0, 0x4\n"
                "\tands r0, r2\n"
                "\tadds r4, r1, 0\n"
                "\tcmp r0, 0\n"
                "\tbne _080DE13E\n"
                "\tmovs r0, 0x4\n"
                "\torrs r0, r2\n"
                "\tstrb r0, [r4]\n"
                "_080DE13E:\n"
                "\tmovs r1, 0x2E\n"
                "\tldrsh r0, [r3, r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080DE14E\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _080DE158\n"
                "\tmovs r6, 0x1\n"
                "\tb _080DE162\n"
                "_080DE14E:\n"
                "\tmovs r1, 0x30\n"
                "\tldrsh r0, [r3, r1]\n"
                "\tcmp r0, 0x2\n"
                "\tbne _080DE162\n"
                "\tb _080DE166\n"
                "_080DE158:\n"
                "\tmovs r1, 0x30\n"
                "\tldrsh r0, [r3, r1]\n"
                "\tcmp r0, 0x4\n"
                "\tbne _080DE162\n"
                "\tmovs r5, 0x1\n"
                "_080DE162:\n"
                "\tcmp r5, 0\n"
                "\tbeq _080DE198\n"
                "_080DE166:\n"
                "\tldrb r2, [r4]\n"
                "\tlsls r0, r2, 29\n"
                "\tlsrs r0, 31\n"
                "\tmovs r1, 0x1\n"
                "\teors r1, r0\n"
                "\tlsls r1, 2\n"
                "\tmovs r0, 0x5\n"
                "\tnegs r0, r0\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r4]\n"
                "\tldrh r0, [r3, 0x32]\n"
                "\tadds r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r3, 0x32]\n"
                "\tstrh r1, [r3, 0x30]\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tcmp r0, 0x5\n"
                "\tbne _080DE1AA\n"
                "\tstrh r1, [r3, 0x32]\n"
                "\tldrh r0, [r3, 0x2E]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x2E]\n"
                "\tb _080DE1AA\n"
                "_080DE198:\n"
                "\tcmp r6, 0\n"
                "\tbeq _080DE1A4\n"
                "\tadds r0, r3, 0\n"
                "\tbl DestroyAnimSprite\n"
                "\tb _080DE1AA\n"
                "_080DE1A4:\n"
                "\tldrh r0, [r3, 0x30]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3, 0x30]\n"
                "_080DE1AA:\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n");
}

void sub_80DE1B0(u8 taskId)
{
    struct Task *task;
    
    task = &gTasks[taskId];
    task->data[0] = duplicate_obj_of_side_rel2move_in_transparent_mode(1);
    if (task->data[0] < 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    task->data[1] = 0;
    task->data[2] = 15;
    task->data[3] = 2;
    task->data[4] = 0;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = (task->data[3] << 8) | task->data[2];
    gSprites[task->data[0]].data[0] = 80;
    if (GetBattlerSide(gAnimBankTarget) == 0)
    {
        gSprites[task->data[0]].data[1] = -144;
        gSprites[task->data[0]].data[2] = 112;
    }
    else
    {
        gSprites[task->data[0]].data[1] = 144;
        gSprites[task->data[0]].data[2] = -112;
    }
    gSprites[task->data[0]].data[3] = 0;
    gSprites[task->data[0]].data[4] = 0;
    StoreSpriteCallbackInData(&gSprites[task->data[0]], SpriteCallbackDummy);
    gSprites[task->data[0]].callback = sub_8078394;
    task->func = sub_80DE2DC;
}

void sub_80DE2DC(u8 taskId)
{
    struct Task *task;

    task = &gTasks[taskId];
    switch (task->data[4])
    {
    case 0:
        task->data[1] += 1;
        task->data[5] = task->data[1] & 3;
        if (task->data[5] == 1)
            if (task->data[2] > 0)
                task->data[2] -= 1;
        if (task->data[5] == 3)
            if (task->data[3] <= 15)
                task->data[3] += 1;
        REG_BLDALPHA = (task->data[3] << 8) | task->data[2];
        if (task->data[3] != 16 || task->data[2] != 0)
            break;
        if (task->data[1] <= 80)
            break;
        obj_delete_but_dont_free_vram(&gSprites[task->data[0]]);
        task->data[4] = 1;
        break;
    case 1:
        if (++task->data[6] <= 1)
            break;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        task->data[4] += 1;
        break;
    case 2:
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80DE3AC(u8 taskId)
{
    struct Task *task;

    task = &gTasks[taskId];
    task->data[15] = 0;
    task->func = sub_80DE3D4;
    sub_80DE3D4(taskId);
}
