#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
#include "task.h"
#include "trig.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG2_X;
extern u8 gBankSpriteIds[];

void sub_80DB74C(struct Sprite *sprite);
void sub_80DBA4C(struct Sprite *sprite);
void sub_80DBAF4(struct Sprite *sprite);
void sub_80DBB70(struct Sprite *sprite);
void sub_80DC068(struct Sprite *sprite);
void sub_80DC2B0(struct Sprite *sprite);
void sub_80DC700(struct Sprite *sprite);
static void sub_80DB88C(struct Sprite *sprite);
static void sub_80DB8C0(struct Sprite *sprite);
static void sub_80DB92C(struct Sprite *sprite);
static void sub_80DB9E4(struct Sprite *sprite);
static void sub_80DBC00(struct Sprite *sprite);
static void sub_80DBC34(struct Sprite *sprite);
static void sub_80DBCD0(u8 taskId);
static void sub_80DBD58(u8 taskId);
static void sub_80DBE98(u8 taskId);
static void sub_80DC1FC(u8 taskId);
static void sub_80DC3F4(u8 taskId);
void sub_80DC5F4(u8 taskId);

const union AffineAnimCmd gSpriteAffineAnim_83DA674[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFFE, 0xFFFE, -10, 120),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA68C[] =
{
    gSpriteAffineAnim_83DA674,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA690 =
{
    .tileTag = 10196,
    .paletteTag = 10196,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA68C,
    .callback = sub_80793C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6A8 =
{
    .tileTag = 10166,
    .paletteTag = 10166,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6C0 =
{
    .tileTag = 10167,
    .paletteTag = 10167,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6D8 =
{
    .tileTag = 10168,
    .paletteTag = 10168,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6F0 =
{
    .tileTag = 10169,
    .paletteTag = 10169,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA708 =
{
    .tileTag = 10170,
    .paletteTag = 10170,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const union AnimCmd gSpriteAnim_83DA720[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA738[] =
{
    gSpriteAnim_83DA720,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA73C =
{
    .tileTag = 10071,
    .paletteTag = 10071,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DA738,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DBA4C,
};

const union AnimCmd gSpriteAnim_83DA754[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(12, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA768[] =
{
    gSpriteAnim_83DA754,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA76C =
{
    .tileTag = 10070,
    .paletteTag = 10070,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83DA768,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DBA4C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA784 =
{
    .tileTag = 10163,
    .paletteTag = 10163,
    .oam = &gOamData_837DF74,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const union AnimCmd gSpriteAnim_83DA79C[] =
{
    ANIMCMD_FRAME(8, 60, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 22, .hFlip = TRUE),
    ANIMCMD_LOOP(0),
    ANIMCMD_FRAME(16, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 5, .hFlip = TRUE),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(8, 22, .hFlip = TRUE),
    ANIMCMD_FRAME(24, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(40, 22, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA7DC[] =
{
    ANIMCMD_FRAME(8, 60),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(8, 22),
    ANIMCMD_LOOP(0),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(8, 22),
    ANIMCMD_FRAME(24, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(40, 22),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA81C[] =
{
    gSpriteAnim_83DA79C,
    gSpriteAnim_83DA7DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA824 =
{
    .tileTag = 10097,
    .paletteTag = 10097,
    .oam = &gOamData_837DF74,
    .anims = gSpriteAnimTable_83DA81C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DBAF4,
};

const union AnimCmd gSpriteAnim_83DA83C[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_FRAME(64, 6),
    ANIMCMD_FRAME(80, 6),
    ANIMCMD_FRAME(96, 18),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA85C[] =
{
    gSpriteAnim_83DA83C,
};

const union AffineAnimCmd gSpriteAffineAnim_3DA860[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 4, 4),
    AFFINEANIMCMD_FRAME(0, 0, -4, 8),
    AFFINEANIMCMD_FRAME(0, 0, 4, 4),
    AFFINEANIMCMD_LOOP(2),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_083DA888[] =
{
    gSpriteAffineAnim_3DA860,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA88C =
{
    .tileTag = 10093,
    .paletteTag = 10093,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DA85C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DBB70,
};

const union AffineAnimCmd gSpriteAffineAnim_083DA8A4[] =
{
    AFFINEANIMCMD_FRAME(-8, 10, 0, 16),
    AFFINEANIMCMD_FRAME(18, -18, 0, 16),
    AFFINEANIMCMD_FRAME(-20, 16, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_083DA8C4[] =
{
    AFFINEANIMCMD_FRAME(64, -4, 0, 20),
    AFFINEANIMCMD_FRAME(0, 0, 0, -56),
    AFFINEANIMCMD_END,
};

const struct SpriteTemplate gSpriteTemplate_83DA8DC =
{
    .tileTag = 10249,
    .paletteTag = 10249,
    .oam = &gOamData_837E04C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA8F4 =
{
    .tileTag = 10250,
    .paletteTag = 10250,
    .oam = &gOamData_837DF3C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DC068,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA90C[] =
{
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 8),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_83DA924[] =
{
    AFFINEANIMCMD_FRAME(0xF0, 0xF0, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 6),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 2),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83DA94C[] =
{
    AFFINEANIMCMD_FRAME(0xD0, 0xD0, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 4),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 4),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83DA974[] =
{
    AFFINEANIMCMD_FRAME(0xB0, 0xB0, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 2),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 6),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA99C[] =
{
    gSpriteAffineAnim_83DA90C,
    gSpriteAffineAnim_83DA924,
    gSpriteAffineAnim_83DA94C,
    gSpriteAffineAnim_83DA974,
};

const struct SpriteTemplate gSpriteTemplate_83DA9AC =
{
    .tileTag = 10251,
    .paletteTag = 10251,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA99C,
    .callback = sub_80DC2B0,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA9C4[] =
{
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 120),
    AFFINEANIMCMD_END_ALT(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA9DC[] =
{
    gSpriteAffineAnim_83DA9C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA9E0 =
{
    .tileTag = 10267,
    .paletteTag = 10267,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA9DC,
    .callback = sub_80793C4,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA9F8[] =
{
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 0),
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 17),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 10),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 10),
    AFFINEANIMCMD_LOOP(4),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0xFFF0, 0xFFF0, 0, 5),
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 5),
    AFFINEANIMCMD_LOOP(7),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAA50[] =
{
    AFFINEANIMCMD_FRAME(0xFFEC, 0x18, 0, 15),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAA60[] =
{
    gSpriteAffineAnim_83DA9F8,
    gSpriteAffineAnim_83DAA50,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAA68 =
{
    .tileTag = 10212,
    .paletteTag = 10212,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAA60,
    .callback = sub_80DC700,
};

void sub_80DB74C(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER || IsContest())
    {
        sprite->oam.priority = 2;
        sprite->subpriority = 200;
    }

    if (!IsContest())
    {
        u8 bankCopy;
        u8 bank = bankCopy = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        u8 identity = GetBattlerPosition_permutated(bank);
        int var0 = 1;
        u8 toBG_2 = (identity ^ var0) != 0;

        if (IsAnimBankSpriteVisible(bank))
            MoveBattlerSpriteToBG(bank, toBG_2);

        bank = bankCopy ^ 2;
        if (IsAnimBankSpriteVisible(bank))
            MoveBattlerSpriteToBG(bank, toBG_2 ^ var0);
    }

    if (!IsContest() && IsDoubleBattle())
    {
        if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
        {
            sprite->pos1.x = 72;
            sprite->pos1.y = 80;
        }
        else
        {
            sprite->pos1.x = 176;
            sprite->pos1.y = 40;
        }
    }
    else
    {
        if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + gBattleAnimArgs[1];
    }

    if (IsContest())
        sprite->pos1.y += 9;

    sprite->data[0] = 256 + IndexOfSpritePaletteTag(gBattleAnimArgs[2]) * 16;
    sprite->callback = sub_80DB88C;
    sprite->callback(sprite);
}

static void sub_80DB88C(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[3]) << 8) | sprite->data[3];

    if (sprite->data[3] == 13)
        sprite->callback = sub_80DB8C0;
    else
        sprite->data[3]++;
}

static void sub_80DB8C0(struct Sprite *sprite)
{
    u16 color;
    u16 startOffset;
    int i;

    if (++sprite->data[1] == 2)
    {
        sprite->data[1] = 0;
        startOffset = sprite->data[0];
        color = gPlttBufferFaded[startOffset + 8];

        for (i = 8; i > 0; i--)
            gPlttBufferFaded[startOffset + i] = gPlttBufferFaded[startOffset + i - 1];

        gPlttBufferFaded[startOffset + 1] = color;

        if (++sprite->data[2] == 16)
            sprite->callback = sub_80DB92C;
    }
}

static void sub_80DB92C(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[3]) << 8) | sprite->data[3];

    if (--sprite->data[3] == -1)
    {
        if (!IsContest())
        {
            u8 bankCopy;
            u8 bank = bankCopy = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);

            if (IsAnimBankSpriteVisible(bank))
                gSprites[gBankSpriteIds[bank]].invisible = 0;

            bank = bankCopy ^ 2;
            if (IsAnimBankSpriteVisible(bank))
                gSprites[gBankSpriteIds[bank]].invisible = 0;
        }

        sprite->invisible = 1;
        sprite->callback = sub_80DB9E4;
    }
}

static void sub_80DB9E4(struct Sprite *sprite)
{
    if (!IsContest())
    {
        u8 bankCopy;
        u8 bank = bankCopy = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        u8 identity = GetBattlerPosition_permutated(bank);
        int var0 = 1;
        u8 toBG_2 = (identity ^ var0) != 0;

        if (IsAnimBankSpriteVisible(bank))
            sub_8076464(toBG_2);

        bank = bankCopy ^ 2;
        if (IsAnimBankSpriteVisible(bank))
            sub_8076464(toBG_2 ^ var0);
    }

    sprite->callback = DestroyAnimSprite;
}

void sub_80DBA4C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        int arg3 = gBattleAnimArgs[3];
        u8 var0 = 0;
        if (arg3 == 0)
            var0 = 1;

        if (!IsContest() && IsDoubleBattle())
        {
            if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
            {
                sprite->pos1.x = 72 - gBattleAnimArgs[0];
                sprite->pos1.y = gBattleAnimArgs[1] + 80;
            }
            else
            {
                sprite->pos1.x = gBattleAnimArgs[0] + 176;
                sprite->pos1.y = gBattleAnimArgs[1] + 40;
            }
        }
        else
        {
            if (gBattleAnimArgs[2] == 0)
                InitAnimSpritePos(sprite, var0);
            else
                sub_8078764(sprite, var0);
        }

        sprite->data[0]++;
    }
    else
    {
        if (sprite->animEnded || sprite->affineAnimEnded)
            move_anim_8074EE0(sprite);
    }
}

void sub_80DBAF4(struct Sprite *sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x -= 40;
        sprite->pos1.y += 10;
        sprite->data[1] = -1;
    }
    else
    {
        sprite->pos1.x += 40;
        sprite->pos1.y -= 10;
        sprite->data[1] = 1;
    }

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078600;
}

void sub_80DBB70(struct Sprite *sprite)
{
    s16 x = sub_807A100(gAnimBankAttacker, 1) /  2;
    s16 y = sub_807A100(gAnimBankAttacker, 0) / -2;

    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_OPPONENT)
    {
        x = -x;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + x;
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + y;

    if (sprite->pos1.y < 16)
    {
        sprite->pos1.y = 16;
    }

    StoreSpriteCallbackInData(sprite, sub_80DBC00);
    sprite->callback = sub_8078600;
}

static void sub_80DBC00(struct Sprite *sprite)
{
    sprite->oam.affineMode = 1;
    sprite->affineAnims = gSpriteAffineAnimTable_083DA888;
    sprite->data[0] = 0;
    InitSpriteAffineAnim(sprite);
    sprite->callback = sub_80DBC34;
}

static void sub_80DBC34(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (sprite->affineAnimEnded)
        {
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->oam.affineMode = 0;
            sprite->data[1] = 18;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (--sprite->data[1] == -1)
        {
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

void sub_80DBC94(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(0);
    task->data[0] = spriteId;
    sub_80798F4(task, spriteId, &gSpriteAffineAnim_083DA8A4);
    task->func = sub_80DBCD0;
}

static void sub_80DBCD0(u8 taskId)
{
    if (!sub_807992C(&gTasks[taskId]))
    {
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80DBCFC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(0);
    task->data[0] = spriteId;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER ? 4 : 8;

    sub_80798F4(task, task->data[0], &gSpriteAffineAnim_083DA8C4);
    task->func = sub_80DBD58;
}

static void sub_80DBD58(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[1])
    {
    case 0:
        sub_807992C(task);
        if (++task->data[2] > 19)
            task->data[1]++;
        break;
    case 1:
        if (task->data[3] != 0)
        {
            gSprites[task->data[0]].pos2.y -= 8;
            task->data[3]--;
        }
        else
        {
            gSprites[task->data[0]].invisible = 1;
            gSprites[task->data[0]].pos1.x = 272;
            sub_8078F40(task->data[0]);
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_80DBE00(u8 taskId)
{
    u16 var0, var1;

    struct Task *task = &gTasks[taskId];

    task->data[3] = 16;
    task->data[4] = 0;
    task->data[13] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    task->data[14] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);

    var0 = sub_807A100(gAnimBankAttacker, 1) / 3;
    var1 = sub_807A100(gAnimBankAttacker, 0) / 3;
    task->data[12] = var0 > var1 ? var0 : var1;

    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x10;

    task->func = sub_80DBE98;
}

static void sub_80DBE98(u8 taskId)
{
    u16 i;
    u8 spriteId;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 8)
        {
            task->data[1] = 0;
            spriteId = CreateSprite(&gSpriteTemplate_83DA8DC, task->data[13], task->data[14], 0);
            task->data[task->data[2] + 8] = spriteId;

            if (spriteId != 64)
            {
                switch (task->data[2])
                {
                case 0:
                    gSprites[spriteId].pos2.x = task->data[12];
                    gSprites[spriteId].pos2.y = -task->data[12];
                    break;
                case 1:
                    gSprites[spriteId].pos2.x = -task->data[12];
                    gSprites[spriteId].pos2.y = task->data[12];
                    break;
                case 2:
                    gSprites[spriteId].pos2.x = task->data[12];
                    gSprites[spriteId].pos2.y = task->data[12];
                    break;
                case 3:
                    gSprites[spriteId].pos2.x = -task->data[12];
                    gSprites[spriteId].pos2.y = -task->data[12];
                    break;
                }
            }

            if (++task->data[2] == 5)
                task->data[0]++;
        }
        break;
    case 1:
        if (task->data[1] & 1)
            task->data[3]--;
        else
            task->data[4]++;

        REG_BLDALPHA = (task->data[4] << 8) | task->data[3];

        if (++task->data[1] == 32)
        {
            for (i = 8; i < 13; i++)
            {
                if (task->data[i] != 64)
                    DestroySprite(&gSprites[task->data[i]]);
            }

            task->data[0]++;
        }
        break;
    case 2:
        task->data[0]++;
        break;
    case 3:
        REG_BLDALPHA = 0;
        REG_BLDCNT = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80DC020(struct Sprite *sprite)
{
    if (sprite->data[1] > sprite->data[0] - 10)
        sprite->invisible = sprite->data[1] & 1;

    if (sprite->data[1] == sprite->data[0])
        DestroyAnimSprite(sprite);

    sprite->data[1]++;
}

void sub_80DC068(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    }

    sprite->data[0] = gBattleAnimArgs[1];
    sprite->callback = sub_80DC020;
}

void sub_80DC0B0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (IsContest())
    {
        if (gBattleAnimArgs[0] == 1)
        {
            task->data[10] = -10;
            task->data[11] = sub_807A100(gAnimBankTarget, 5) - 8;
            task->data[12] = sub_807A100(gAnimBankTarget, 2) + 8;
            task->data[13] = sub_807A100(gAnimBankAttacker, 5) - 8;
            task->data[14] = sub_807A100(gAnimBankAttacker, 2) + 8;
        }
        else
        {
            task->data[10] = 10;
            task->data[11] = sub_807A100(gAnimBankAttacker, 4) + 8;
            task->data[12] = sub_807A100(gAnimBankAttacker, 3) - 8;
            task->data[13] = sub_807A100(gAnimBankTarget, 4) + 8;
            task->data[14] = sub_807A100(gAnimBankTarget, 3) - 8;
        }
    }
    else
    {
        if (gBattleAnimArgs[0] == 1)
        {
            task->data[10] = -10;
            task->data[11] = sub_807A100(gAnimBankTarget, 4) + 8;
            task->data[12] = sub_807A100(gAnimBankTarget, 2) + 8;
            task->data[13] = sub_807A100(gAnimBankAttacker, 4) + 8;
            task->data[14] = sub_807A100(gAnimBankAttacker, 2) + 8;
        }
        else
        {
            task->data[10] = 10;
            task->data[11] = sub_807A100(gAnimBankAttacker, 5) - 8;
            task->data[12] = sub_807A100(gAnimBankAttacker, 3) - 8;
            task->data[13] = sub_807A100(gAnimBankTarget, 5) - 8;
            task->data[14] = sub_807A100(gAnimBankTarget, 3) - 8;
        }
    }

    task->data[1] = 6;
    task->func = sub_80DC1FC;
}

static void sub_80DC1FC(u8 taskId)
{
    u8 spriteId;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 6)
        {
            task->data[1] = 0;
            spriteId = CreateSprite(&gSpriteTemplate_83DA9AC, task->data[11], task->data[12], 0);
            if (spriteId != 64)
            {
                gSprites[spriteId].data[0] = 16;
                gSprites[spriteId].data[2] = task->data[13];
                gSprites[spriteId].data[4] = task->data[14];
                gSprites[spriteId].data[5] = task->data[10];

                InitAnimArcTranslation(&gSprites[spriteId]);
                StartSpriteAffineAnim(&gSprites[spriteId], task->data[2] & 3);
            }

            if (++task->data[2] == 12)
                task->data[0]++;
        }
        break;
    case 1:
        if (++task->data[1] > 17)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80DC2B0(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
}

void sub_80DC2D4(u8 taskId)
{
    s16 i;
    u8 var1;
    struct ScanlineEffectParams scanlineParams;
    struct Task *task = &gTasks[taskId];
    
    var1 = sub_8077FC0(gAnimBankTarget);
    task->data[14] = var1 - 32;

    switch (gBattleAnimArgs[0])
    {
    case 0:
        task->data[11] = 2;
        task->data[12] = 5;
        task->data[13] = 64;
        task->data[15] = var1 + 32;
        break;
    case 1:
        task->data[11] = 2;
        task->data[12] = 5;
        task->data[13] = 192;
        task->data[15] = var1 + 32;
        break;
    case 2:
        task->data[11] = 4;
        task->data[12] = 4;
        task->data[13] = 0;
        task->data[15] = var1 + 32;
        break;
    }

    if (task->data[14] < 0)
        task->data[14] = 0;

    if (GetBattlerPosition_permutated(gAnimBankTarget) == 1)
    {
        task->data[10] = gBattle_BG1_X;
        scanlineParams.dmaDest = &REG_BG1HOFS;
    }
    else
    {
        task->data[10] = gBattle_BG2_X;
        scanlineParams.dmaDest = &REG_BG2HOFS;
    }

    i = task->data[14];
    while (i <= task->data[14] + 64)
    {
        gScanlineEffectRegBuffers[0][i] = task->data[10];
        gScanlineEffectRegBuffers[1][i] = task->data[10];
        i++;
    }

    scanlineParams.dmaControl = 0XA2600001;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);

    task->func = sub_80DC3F4;
}

static void sub_80DC3F4(u8 taskId)
{
    s16 sineIndex, i;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sineIndex = task->data[13];
        i = task->data[14];
        while (i <= task->data[15])
        {
            s16 var2 = (gSineTable[sineIndex] >> task->data[12]);
            if (var2 > 0)
            {
                var2 += (task->data[1] & 3);
            }
            else if (var2 < 0)
            {
                var2 -= (task->data[1] & 3);
            }

            gScanlineEffectRegBuffers[0][i] = task->data[10] + var2;
            gScanlineEffectRegBuffers[1][i] = task->data[10] + var2;

            sineIndex += task->data[11];
            i++;
        }

        if (++task->data[1] > 23)
        {
            task->data[0]++;
        }
        break;
    case 1:
        gScanlineEffect.state = 3;
        task->data[0]++;
        break;
    case 2:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

#ifdef NONMATCHING
void sub_80DC4F4(u8 taskId)
{
    s16 spriteId;
    u8 matrixNum;
    register u8 matrixNum2 asm("r6");
    struct Task *task = &gTasks[taskId];
    
    matrixNum = AllocOamMatrix();
    matrixNum2 = matrixNum;
    if (matrixNum2 == 0xFF)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }

    spriteId = duplicate_obj_of_side_rel2move_in_transparent_mode(gBattleAnimArgs[0]);
    if (spriteId < 0)
    {
        FreeOamMatrix(matrixNum);
        DestroyAnimVisualTask(taskId);
        return;
    }

    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    gSprites[spriteId].oam.matrixNum = matrixNum2;
    gSprites[spriteId].affineAnimPaused = 1;
    gSprites[spriteId].subpriority++;
    obj_id_set_rotscale(spriteId, 256, 256, 0);
    CalcCenterToCornerVec(&gSprites[spriteId], gSprites[spriteId].oam.shape, gSprites[spriteId].oam.size, gSprites[spriteId].oam.affineMode);

    task->data[13] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    task->data[14] = matrixNum;
    task->data[15] = spriteId;
    task->func = sub_80DC5F4;
}
#else
NAKED
void sub_80DC4F4(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    mov r8, r4\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    ldr r1, _080DC528 @ =gTasks\n\
    adds r7, r0, r1\n\
    bl AllocOamMatrix\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    mov r10, r5\n\
    adds r6, r5, 0\n\
    cmp r6, 0xFF\n\
    bne _080DC52C\n\
    adds r0, r4, 0\n\
    bl DestroyAnimVisualTask\n\
    b _080DC5D6\n\
    .align 2, 0\n\
_080DC528: .4byte gTasks\n\
_080DC52C:\n\
    ldr r1, _080DC550 @ =gBattleAnimArgs\n\
    ldrb r0, [r1]\n\
    bl duplicate_obj_of_side_rel2move_in_transparent_mode\n\
    lsls r0, 16\n\
    lsrs r1, r0, 16\n\
    mov r9, r1\n\
    asrs r0, 16\n\
    cmp r0, 0\n\
    bge _080DC554\n\
    adds r0, r5, 0\n\
    bl FreeOamMatrix\n\
    mov r0, r8\n\
    bl DestroyAnimVisualTask\n\
    b _080DC5D6\n\
    .align 2, 0\n\
_080DC550: .4byte gBattleAnimArgs\n\
_080DC554:\n\
    ldr r2, _080DC5E4 @ =gSprites\n\
    lsls r4, r0, 4\n\
    adds r4, r0\n\
    lsls r4, 2\n\
    adds r0, r2, 0\n\
    adds r0, 0x1C\n\
    adds r0, r4, r0\n\
    ldr r1, _080DC5E8 @ =SpriteCallbackDummy\n\
    str r1, [r0]\n\
    adds r4, r2\n\
    ldrb r0, [r4, 0x1]\n\
    movs r1, 0x3\n\
    orrs r0, r1\n\
    strb r0, [r4, 0x1]\n\
    movs r0, 0x1F\n\
    ands r6, r0\n\
    lsls r2, r6, 1\n\
    ldrb r1, [r4, 0x3]\n\
    movs r0, 0x3F\n\
    negs r0, r0\n\
    ands r0, r1\n\
    orrs r0, r2\n\
    strb r0, [r4, 0x3]\n\
    adds r2, r4, 0\n\
    adds r2, 0x2C\n\
    ldrb r0, [r2]\n\
    movs r1, 0x80\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    adds r1, r4, 0\n\
    adds r1, 0x43\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    mov r1, r9\n\
    lsls r0, r1, 24\n\
    lsrs r0, 24\n\
    movs r2, 0x80\n\
    lsls r2, 1\n\
    adds r1, r2, 0\n\
    movs r3, 0\n\
    bl obj_id_set_rotscale\n\
    ldrb r3, [r4, 0x1]\n\
    lsrs r1, r3, 6\n\
    ldrb r2, [r4, 0x3]\n\
    lsrs r2, 6\n\
    lsls r3, 30\n\
    lsrs r3, 30\n\
    adds r0, r4, 0\n\
    bl CalcCenterToCornerVec\n\
    ldr r1, _080DC5EC @ =gBattleAnimArgs\n\
    ldrb r0, [r1]\n\
    bl GetAnimBattlerSpriteId\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    strh r0, [r7, 0x22]\n\
    mov r0, r10\n\
    strh r0, [r7, 0x24]\n\
    mov r1, r9\n\
    strh r1, [r7, 0x26]\n\
    ldr r0, _080DC5F0 @ =sub_80DC5F4\n\
    str r0, [r7]\n\
_080DC5D6:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080DC5E4: .4byte gSprites\n\
_080DC5E8: .4byte SpriteCallbackDummy\n\
_080DC5EC: .4byte gBattleAnimArgs\n\
_080DC5F0: .4byte sub_80DC5F4\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80DC5F4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[1] += 4;
        task->data[2] = 256 - (gSineTable[task->data[1]] >> 1);
        obj_id_set_rotscale(task->data[15], task->data[2], task->data[2], 0);
        sub_8079AB8(task->data[15], task->data[13]);
        if (task->data[1] == 48)
            task->data[0]++;
        break;
    case 1:
        task->data[1] -= 4;
        task->data[2] = 256 - (gSineTable[task->data[1]] >> 1);;
        obj_id_set_rotscale(task->data[15], task->data[2], task->data[2], 0);
        sub_8079AB8(task->data[15], task->data[13]);
        if (task->data[1] == 0)
            task->data[0]++;
        break;
    case 2:
        obj_delete_but_dont_free_vram(&gSprites[task->data[15]]);
        task->data[0]++;
        break;
    case 3:
        FreeOamMatrix(task->data[14]);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80DC700(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 1);

        if (IsContest())
            sprite->pos1.y += 12;

        sprite->data[1] = 8;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
        sprite->data[0]++;
        break;
    case 1:
        if (sprite->affineAnimEnded)
        {
            PlaySE12WithPanning(SE_W100, BattleAnimAdjustPanning(-64));
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[0]++;
        }
        break;
    case 2:
        if (sprite->data[2]++ > 1)
        {
            sprite->data[2] = 0;
            sprite->data[1]--;
            REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];

            if (sprite->data[1] == 0)
            {
                sprite->data[0]++;
                sprite->invisible = 1;
            }
        }

        sprite->data[3] += 896;
        sprite->pos2.y -= sprite->data[3] >> 8;
        sprite->data[3] &= 0xFF;
        break;
    case 3:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyAnimSprite(sprite);
        break;
    }
}
