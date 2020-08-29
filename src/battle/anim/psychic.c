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
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG2_X;
extern u8 gBattlerSpriteIds[];

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
    .tileTag = ANIM_TAG_SPIRAL,
    .paletteTag = ANIM_TAG_SPIRAL,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA68C,
    .callback = sub_80793C4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6A8 =
{
    .tileTag = ANIM_TAG_GREEN_LIGHT_WALL,
    .paletteTag = ANIM_TAG_GREEN_LIGHT_WALL,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6C0 =
{
    .tileTag = ANIM_TAG_BLUE_LIGHT_WALL,
    .paletteTag = ANIM_TAG_BLUE_LIGHT_WALL,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6D8 =
{
    .tileTag = ANIM_TAG_RED_LIGHT_WALL,
    .paletteTag = ANIM_TAG_RED_LIGHT_WALL,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA6F0 =
{
    .tileTag = ANIM_TAG_GRAY_LIGHT_WALL,
    .paletteTag = ANIM_TAG_GRAY_LIGHT_WALL,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB74C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA708 =
{
    .tileTag = ANIM_TAG_ORANGE_LIGHT_WALL,
    .paletteTag = ANIM_TAG_ORANGE_LIGHT_WALL,
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
    .tileTag = ANIM_TAG_SPARKLE_4,
    .paletteTag = ANIM_TAG_SPARKLE_4,
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
    .tileTag = ANIM_TAG_SPARKLE_3,
    .paletteTag = ANIM_TAG_SPARKLE_3,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83DA768,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DBA4C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA784 =
{
    .tileTag = ANIM_TAG_GOLD_RING,
    .paletteTag = ANIM_TAG_GOLD_RING,
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
    .tileTag = ANIM_TAG_BENT_SPOON,
    .paletteTag = ANIM_TAG_BENT_SPOON,
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
    .tileTag = ANIM_TAG_AMNESIA,
    .paletteTag = ANIM_TAG_AMNESIA,
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
    .tileTag = ANIM_TAG_HOLLOW_ORB,
    .paletteTag = ANIM_TAG_HOLLOW_ORB,
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
    .tileTag = ANIM_TAG_BLUEGREEN_ORB,
    .paletteTag = ANIM_TAG_BLUEGREEN_ORB,
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
    .tileTag = ANIM_TAG_WHITE_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_WHITE_CIRCLE_OF_LIGHT,
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
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_837E11C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAA60,
    .callback = sub_80DC700,
};

void sub_80DB74C(struct Sprite *sprite)
{
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER || IsContest())
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
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
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
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + gBattleAnimArgs[1];
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
                gSprites[gBattlerSpriteIds[bank]].invisible = 0;

            bank = bankCopy ^ 2;
            if (IsAnimBankSpriteVisible(bank))
                gSprites[gBattlerSpriteIds[bank]].invisible = 0;
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
        bool8 var0 = FALSE;
        if (arg3 == 0)
            var0 = TRUE;

        if (!IsContest() && IsDoubleBattle())
        {
            if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
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
            DestroySpriteAndMatrix(sprite);
    }
}

void sub_80DBAF4(struct Sprite *sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);

    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
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
    s16 x = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 1) /  2;
    s16 y = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 0) / -2;

    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
    {
        x = -x;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2) + x;
    sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3) + y;

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
    PrepareAffineAnimInTaskData(task, spriteId, &gSpriteAffineAnim_083DA8A4);
    task->func = sub_80DBCD0;
}

static void sub_80DBCD0(u8 taskId)
{
    if (!RunAffineAnimFromTaskData(&gTasks[taskId]))
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
    task->data[3] = GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER ? 4 : 8;

    PrepareAffineAnimInTaskData(task, task->data[0], &gSpriteAffineAnim_083DA8C4);
    task->func = sub_80DBD58;
}

static void sub_80DBD58(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[1])
    {
    case 0:
        RunAffineAnimFromTaskData(task);
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
    task->data[13] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    task->data[14] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);

    var0 = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 1) / 3;
    var1 = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 0) / 3;
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
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
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
            task->data[11] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 5) - 8;
            task->data[12] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 2) + 8;
            task->data[13] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 5) - 8;
            task->data[14] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 2) + 8;
        }
        else
        {
            task->data[10] = 10;
            task->data[11] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 4) + 8;
            task->data[12] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 3) - 8;
            task->data[13] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 4) + 8;
            task->data[14] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 3) - 8;
        }
    }
    else
    {
        if (gBattleAnimArgs[0] == 1)
        {
            task->data[10] = -10;
            task->data[11] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 4) + 8;
            task->data[12] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 2) + 8;
            task->data[13] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 4) + 8;
            task->data[14] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 2) + 8;
        }
        else
        {
            task->data[10] = 10;
            task->data[11] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 5) - 8;
            task->data[12] = GetBattlerSpriteCoordAttr(gBattleAnimAttacker, 3) - 8;
            task->data[13] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 5) - 8;
            task->data[14] = GetBattlerSpriteCoordAttr(gBattleAnimTarget, 3) - 8;
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
    
    var1 = sub_8077FC0(gBattleAnimTarget);
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

    if (GetBattlerPosition_permutated(gBattleAnimTarget) == 1)
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

void sub_80DC4F4(u8 taskId)
{
    s16 spriteId;
    s16 matrixNum;
    struct Task *task = &gTasks[taskId];
    
    matrixNum = AllocOamMatrix();
    if (matrixNum == 0xFF)
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
    gSprites[spriteId].oam.matrixNum = matrixNum;
    gSprites[spriteId].affineAnimPaused = 1;
    gSprites[spriteId].subpriority++;
    obj_id_set_rotscale(spriteId, 256, 256, 0);
    CalcCenterToCornerVec(&gSprites[spriteId], gSprites[spriteId].oam.shape, gSprites[spriteId].oam.size, gSprites[spriteId].oam.affineMode);

    task->data[13] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
    task->data[14] = matrixNum;
    task->data[15] = spriteId;
    task->func = sub_80DC5F4;
}

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
        sprite->pos1.x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0);
        sprite->pos1.y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1);

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
            PlaySE12WithPanning(SE_M_TELEPORT, BattleAnimAdjustPanning(SOUND_PAN_ATTACKER_NEG));
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
