#include "global.h"
#include "gba/m4a_internal.h"
#include "battle.h"
#include "battle_anim_813F0F4.h"
#include "decompress.h"
#include "graphics.h"
#include "m4a.h"
#include "main.h"
#include "pokeball.h"
#include "pokemon.h"
#include "rom_8077ABC.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "ewram.h"

extern struct MusicPlayerInfo gMPlay_BGM;
extern u16 gBattleTypeFlags;
extern u8 gBankTarget;
extern u8 gActiveBattler;
extern u16 gBattlerPartyIndexes[];
extern u8 gBankSpriteIds[];
extern u8 gDoingBattleAnim;
extern u8 gHealthboxIDs[];

#define GFX_TAG_POKEBALL    55000
#define GFX_TAG_GREATBALL   55001
#define GFX_TAG_SAFARIBALL  55002
#define GFX_TAG_ULTRABALL   55003
#define GFX_TAG_MASTERBALL  55004
#define GFX_TAG_NETBALL     55005
#define GFX_TAG_DIVEBALL    55006
#define GFX_TAG_NESTBALL    55007
#define GFX_TAG_REPEATBALL  55008
#define GFX_TAG_TIMERBALL   55009
#define GFX_TAG_LUXURYBALL  55010
#define GFX_TAG_PREMIERBALL 55011

static const struct CompressedSpriteSheet sBallSpriteSheets[] =
{
    {gInterfaceGfx_PokeBall,    384, GFX_TAG_POKEBALL},
    {gInterfaceGfx_GreatBall,   384, GFX_TAG_GREATBALL},
    {gInterfaceGfx_SafariBall,  384, GFX_TAG_SAFARIBALL},
    {gInterfaceGfx_UltraBall,   384, GFX_TAG_ULTRABALL},
    {gInterfaceGfx_MasterBall,  384, GFX_TAG_MASTERBALL},
    {gInterfaceGfx_NetBall,     384, GFX_TAG_NETBALL},
    {gInterfaceGfx_DiveBall,    384, GFX_TAG_DIVEBALL},
    {gInterfaceGfx_NestBall,    384, GFX_TAG_NESTBALL},
    {gInterfaceGfx_RepeatBall,  384, GFX_TAG_REPEATBALL},
    {gInterfaceGfx_TimerBall,   384, GFX_TAG_TIMERBALL},
    {gInterfaceGfx_LuxuryBall,  384, GFX_TAG_LUXURYBALL},
    {gInterfaceGfx_PremierBall, 384, GFX_TAG_PREMIERBALL},
};

static const struct CompressedSpritePalette sBallSpritePalettes[] =
{
    {gInterfacePal_PokeBall,    GFX_TAG_POKEBALL},
    {gInterfacePal_GreatBall,   GFX_TAG_GREATBALL},
    {gInterfacePal_SafariBall,  GFX_TAG_SAFARIBALL},
    {gInterfacePal_UltraBall,   GFX_TAG_ULTRABALL},
    {gInterfacePal_MasterBall,  GFX_TAG_MASTERBALL},
    {gInterfacePal_NetBall,     GFX_TAG_NETBALL},
    {gInterfacePal_DiveBall,    GFX_TAG_DIVEBALL},
    {gInterfacePal_NestBall,    GFX_TAG_NESTBALL},
    {gInterfacePal_RepeatBall,  GFX_TAG_REPEATBALL},
    {gInterfacePal_TimerBall,   GFX_TAG_TIMERBALL},
    {gInterfacePal_LuxuryBall,  GFX_TAG_LUXURYBALL},
    {gInterfacePal_PremierBall, GFX_TAG_PREMIERBALL},
};

static const struct OamData sBallOamData =
{
    .y = 0,
    .affineMode = 3,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sBallAnimSeq3[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sBallAnimSeq5[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sBallAnimSeq4[] =
{
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sBallAnimSeq6[] =
{
    ANIMCMD_FRAME(12, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sBallAnimSeq0[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

static const union AnimCmd sBallAnimSeq1[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

static const union AnimCmd sBallAnimSeq2[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sBallAnimSequences[] =
{
    sBallAnimSeq0,
    sBallAnimSeq1,
    sBallAnimSeq2,

    // unused?
    sBallAnimSeq3,
    sBallAnimSeq4,
    sBallAnimSeq5,
    sBallAnimSeq6,
};

static const union AffineAnimCmd sBallAffineAnimSeq0[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 0, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sBallAffineAnimSeq1[] =
{
    AFFINEANIMCMD_FRAME(0, 0, -3, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sBallAffineAnimSeq2[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 3, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd sBallAffineAnimSeq3[] =
{
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sBallAffineAnimSeq4[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 25, 1),
    AFFINEANIMCMD_JUMP(0),
};

static const union AffineAnimCmd *const sBallAffineAnimSequences[] =
{
    sBallAffineAnimSeq0,
    sBallAffineAnimSeq1,
    sBallAffineAnimSeq2,
    sBallAffineAnimSeq3,
    sBallAffineAnimSeq4,
};

static void objc_0804ABD4(struct Sprite *sprite);
const struct SpriteTemplate gBallSpriteTemplates[] =
{
    {
        .tileTag = GFX_TAG_POKEBALL,
        .paletteTag = GFX_TAG_POKEBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_GREATBALL,
        .paletteTag = GFX_TAG_GREATBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_SAFARIBALL,
        .paletteTag = GFX_TAG_SAFARIBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_ULTRABALL,
        .paletteTag = GFX_TAG_ULTRABALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_MASTERBALL,
        .paletteTag = GFX_TAG_MASTERBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_NETBALL,
        .paletteTag = GFX_TAG_NETBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_DIVEBALL,
        .paletteTag = GFX_TAG_DIVEBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_NESTBALL,
        .paletteTag = GFX_TAG_NESTBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_REPEATBALL,
        .paletteTag = GFX_TAG_REPEATBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_TIMERBALL,
        .paletteTag = GFX_TAG_TIMERBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_LUXURYBALL,
        .paletteTag = GFX_TAG_LUXURYBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
    {
        .tileTag = GFX_TAG_PREMIERBALL,
        .paletteTag = GFX_TAG_PREMIERBALL,
        .oam = &sBallOamData,
        .anims = sBallAnimSequences,
        .images = NULL,
        .affineAnims = sBallAffineAnimSequences,
        .callback = objc_0804ABD4,
    },
};

extern void InitAnimArcTranslation();
extern bool8 TranslateAnimArc(struct Sprite *);

static void SendOutMonAnimation(u8);
static void sub_80466E8(struct Sprite *);
static void sub_80466F4(struct Sprite *);
static void sub_8046760(struct Sprite *);
static void sub_80467F8(struct Sprite *);
static void sub_804684C(struct Sprite *);
static void sub_8046944(struct Sprite *);
static void sub_8046984(struct Sprite *);
static void sub_8046C78(struct Sprite *);
static void sub_8046E7C(struct Sprite *);
static void sub_8046E9C(struct Sprite *);
static void sub_8046FBC(struct Sprite *);
static void SendOutPlayerMonAnimation_Step0(struct Sprite *);
static void SendOutPlayerMonAnimation_Step1(struct Sprite *);
static void SendOutMonAnimation_Delay(struct Sprite *);
static void SendOutOpponentMonAnimation_Step0(struct Sprite *);
static void sub_80473D0(struct Sprite *);
static void sub_804748C(struct Sprite *);
static void sub_8047638(struct Sprite *);
static void sub_80476E0(struct Sprite *);
static void sub_8047754(struct Sprite *);
static void sub_804780C(struct Sprite *);
static void sub_8047830(struct Sprite *);
static void oamc_804BEB4(struct Sprite *);
static u16 GetBattlerBall(u8);

u8 StartSendOutMonAnimation(u16 a, u8 side)
{
    u8 taskId;

    gDoingBattleAnim = 1;
    ewram17810[gActiveBattler].unk0_3 = 1;
    taskId = CreateTask(SendOutMonAnimation, 5);
    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = side;
    gTasks[taskId].data[3] = gActiveBattler;
    return 0;
}

static void SendOutMonAnimation(u8 taskId)
{
    bool8 debug = FALSE;
    u16 side;
    u8 battler;
    u16 ball;
    u8 ballIndex;
    u8 spriteId;

    if (gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].data[0]++;
        return;
    }

    side = gTasks[taskId].data[2];
    battler = gTasks[taskId].data[3];
    if (GetBattlerSide(battler) != B_SIDE_PLAYER)
        ball = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_POKEBALL);
    else
        ball = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_POKEBALL);

    ballIndex = ball_number_to_ball_processing_index(ball);
    LoadBallGraphics(ballIndex);
    spriteId = CreateSprite(&gBallSpriteTemplates[ballIndex], 32, 80, 29);
    gSprites[spriteId].data[0] = 0x80;
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].data[7] = side;

    switch (side)
    {
    case 0xFF: // Player's side
        gBankTarget = battler;
        gSprites[spriteId].pos1.x = 24;
        gSprites[spriteId].pos1.y = 68;
        gSprites[spriteId].callback = SendOutPlayerMonAnimation_Step0;
        break;
    case 0xFE: // Opponent's side
        gSprites[spriteId].pos1.x = GetBattlerSpriteCoord(battler, 0);
        gSprites[spriteId].pos1.y = GetBattlerSpriteCoord(battler, 1) + 24;
        gBankTarget = battler;
        gSprites[spriteId].data[0] = 0;
        gSprites[spriteId].callback = SendOutOpponentMonAnimation_Step0;
        break;
    default:
        gBankTarget = GetBattlerAtPosition(1);
        debug = TRUE;
        break;
    }

    gSprites[spriteId].data[6] = gBankTarget;
    if (!debug)
    {
        DestroyTask(taskId);
        return;
    }

    gSprites[spriteId].data[0] = 0x22;
    gSprites[spriteId].data[2] = GetBattlerSpriteCoord(gBankTarget, 0);
    gSprites[spriteId].data[4] = GetBattlerSpriteCoord(gBankTarget, 1) - 16;
    gSprites[spriteId].data[5] = -40;
    InitAnimArcTranslation(&gSprites[spriteId]);
    gSprites[spriteId].oam.affineParam = taskId;
    gTasks[taskId].data[4] = gBankTarget;
    gTasks[taskId].func = TaskDummy;
    PlaySE(SE_NAGERU);
}

static void objc_0804ABD4(struct Sprite *sprite)
{
    if (TranslateAnimArc(sprite))
    {
        u8 taskId = sprite->oam.affineParam;
        u8 r5 = gTasks[taskId].data[4];
        u8 r8 = gTasks[taskId].data[2];
        u32 r4;  // not sure of this type

        StartSpriteAnim(sprite, 1);
        sprite->affineAnimPaused = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[5] = 0;
        r4 = ball_number_to_ball_processing_index(GetBattlerBall(r5));
        AnimateBallOpenParticles(sprite->pos1.x, sprite->pos1.y - 5, 1, 0x1C, r4);
        sprite->data[0] = sub_8141314(0, r5, 14, r4);
        sprite->data[6] = r5;
        sprite->data[7] = r8;
        DestroyTask(taskId);
        sprite->callback = sub_80466E8;
    }
}

static void sub_80466E8(struct Sprite *sprite)
{
    sprite->callback = sub_80466F4;
}

static void sub_80466F4(struct Sprite *sprite)
{
    sprite->data[5]++;
    if (sprite->data[5] == 10)
    {
        sprite->data[5] = 0;
        sprite->callback = sub_8046760;
        StartSpriteAffineAnim(&gSprites[gBankSpriteIds[sprite->data[6]]], 2);
        AnimateSprite(&gSprites[gBankSpriteIds[sprite->data[6]]]);
        gSprites[gBankSpriteIds[sprite->data[6]]].data[1] = 0;
    }
}

static void sub_8046760(struct Sprite *sprite)
{
    sprite->data[5]++;
    if (sprite->data[5] == 11)
        PlaySE(SE_SUIKOMU);
    if (gSprites[gBankSpriteIds[sprite->data[6]]].affineAnimEnded)
    {
        StartSpriteAnim(sprite, 2);
        gSprites[gBankSpriteIds[sprite->data[6]]].invisible = TRUE;
        sprite->data[5] = 0;
        sprite->callback = sub_80467F8;
    }
    else
    {
        gSprites[gBankSpriteIds[sprite->data[6]]].data[1] += 0x60;
        gSprites[gBankSpriteIds[sprite->data[6]]].pos2.y = -gSprites[gBankSpriteIds[sprite->data[6]]].data[1] >> 8;
    }
}

static void sub_80467F8(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sprite->data[5]++;
        if (sprite->data[5] == 1)
        {
            sprite->data[3] = 0;
            sprite->data[4] = 32;
            sprite->data[5] = 0;
            sprite->pos1.y += Cos(0, 32);
            sprite->pos2.y = -Cos(0, sprite->data[4]);
            sprite->callback = sub_804684C;
        }
    }
}

static void sub_804684C(struct Sprite *sprite)
{
    bool8 r5 = FALSE;

    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] += 4 + (sprite->data[3] >> 8);
        if (sprite->data[5] >= 64)
        {
            sprite->data[4] -= 10;
            sprite->data[3] += 0x101;
            if (sprite->data[3] >> 8 == 4)
                r5 = TRUE;
            switch (sprite->data[3] >> 8)
            {
            case 1:
                PlaySE(SE_KON);
                break;
            case 2:
                PlaySE(SE_KON2);
                break;
            case 3:
                PlaySE(SE_KON3);
                break;
            default:
                PlaySE(SE_KON4);
                break;
            }
        }
        break;
    case 1:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] -= 4 + (sprite->data[3] >> 8);
        if (sprite->data[5] <= 0)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= 0xFF00;
        }
        break;
    }
    if (r5)
    {
        sprite->data[3] = 0;
        sprite->pos1.y += Cos(64, 32);
        sprite->pos2.y = 0;
        if (sprite->data[7] == 0)
        {
            sprite->callback = sub_8046C78;
        }
        else
        {
            sprite->callback = sub_8046944;
            sprite->data[4] = 1;
            sprite->data[5] = 0;
        }
    }
}

static void sub_8046944(struct Sprite *sprite)
{
    sprite->data[3]++;
    if (sprite->data[3] == 31)
    {
        sprite->data[3] = 0;
        sprite->affineAnimPaused = TRUE;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_8046984;
        PlaySE(SE_BOWA);
    }
}

static void sub_8046984(struct Sprite *sprite)
{
    switch (sprite->data[3] & 0xFF)
    {
    case 0:
    case 2:
        sprite->pos2.x += sprite->data[4];
        sprite->data[5] += sprite->data[4];
        sprite->affineAnimPaused = FALSE;
        if (sprite->data[5] > 3 || sprite->data[5] < -3)
        {
            sprite->data[3]++;
            sprite->data[5] = 0;
        }
        break;
    case 1:
        sprite->data[5]++;
        if (sprite->data[5] == 1)
        {
            sprite->data[5] = 0;
            sprite->data[4] = -sprite->data[4];
            sprite->data[3]++;
            sprite->affineAnimPaused = FALSE;
            if (sprite->data[4] < 0)
                ChangeSpriteAffineAnim(sprite, 2);
            else
                ChangeSpriteAffineAnim(sprite, 1);
        }
        else
        {
            sprite->affineAnimPaused = TRUE;
        }
        break;
    case 3:
        sprite->data[3] += 0x100;
        if (sprite->data[3] >> 8 == sprite->data[7])
        {
            sprite->callback = sub_8046C78;
        }
        else
        {
            if (sprite->data[7] == 4 && sprite->data[3] >> 8 == 3)
            {
                sprite->callback = sub_8046E7C;
                sprite->affineAnimPaused = TRUE;
            }
            else
            {
                sprite->data[3]++;
                sprite->affineAnimPaused = TRUE;
            }
        }
        break;
    case 4:
    default:
        sprite->data[5]++;
        if (sprite->data[5] == 31)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= 0xFF00;
            StartSpriteAffineAnim(sprite, 3);
            if (sprite->data[4] < 0)
                StartSpriteAffineAnim(sprite, 2);
            else
                StartSpriteAffineAnim(sprite, 1);
            PlaySE(SE_BOWA);
        }
        break;
    }
}

static void sub_8046AD0(u8 taskId)
{
    u8 r6 = gTasks[taskId].data[2];
    u8 r3 = gTasks[taskId].data[1];
    u16 species = gTasks[taskId].data[0];

    switch (gTasks[taskId].data[15])
    {
    case 0:
    default:
        if (gTasks[taskId].data[8] < 3)
            gTasks[taskId].data[8]++;
        else
            gTasks[taskId].data[15] = r6 + 1;
        break;
    case 1:
        PlayCry1(species, r3);
        DestroyTask(taskId);
        break;
    case 2:
        StopCryAndClearCrySongs();
        gTasks[taskId].data[10] = 3;
        gTasks[taskId].data[15] = 20;
        break;
    case 20:
        if (gTasks[taskId].data[10] != 0)
        {
            gTasks[taskId].data[10]--;
            break;
        }
        PlayCry4(species, r3, 1);
        DestroyTask(taskId);
        break;
    case 3:
        gTasks[taskId].data[10] = 6;
        gTasks[taskId].data[15] = 30;
        break;
    case 30:
        if (gTasks[taskId].data[10] != 0)
        {
            gTasks[taskId].data[10]--;
            break;
        }
        gTasks[taskId].data[15]++;
        // fall through
    case 31:
        if (!IsCryPlayingOrClearCrySongs())
        {
            StopCryAndClearCrySongs();
            gTasks[taskId].data[10] = 3;
            gTasks[taskId].data[15]++;
        }
        break;
    case 32:
        if (gTasks[taskId].data[10] != 0)
        {
            gTasks[taskId].data[10]--;
            break;
        }
        PlayCry4(species, r3, 0);
        DestroyTask(taskId);
        break;
    }
}

static void sub_8046C78(struct Sprite *sprite)
{
    int ballIndex;
    u8 battler = sprite->data[6];

    StartSpriteAnim(sprite, 1);
    ballIndex = ball_number_to_ball_processing_index(GetBattlerBall(battler));
    AnimateBallOpenParticles(sprite->pos1.x, sprite->pos1.y - 5, 1, 28, ballIndex);
    sprite->data[0] = sub_8141314(1, sprite->data[6], 14, ballIndex);
    sprite->callback = sub_8046E9C;
    if (gMain.inBattle)
    {
        struct Pokemon *mon;
        u16 species;
        s8 cryPanning;
        u16 cryBehavior;
        u8 taskId;

        if (GetBattlerSide(battler) != 0)
        {
            mon = &gEnemyParty[gBattlerPartyIndexes[battler]];
            cryPanning = 25;
        }
        else
        {
            mon = &gPlayerParty[gBattlerPartyIndexes[battler]];
            cryPanning = -25;
        }

        species = GetMonData(mon, MON_DATA_SPECIES);
        if ((battler == GetBattlerAtPosition(0) || battler == GetBattlerAtPosition(1))
         && IsDoubleBattle() && ewram17840.unk9_0)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (IsBGMPlaying())
                    m4aMPlayStop(&gMPlay_BGM);
            }
            else
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
            }
        }

        if (!IsDoubleBattle() || !ewram17840.unk9_0)
            cryBehavior = 0;
        else if (battler == GetBattlerAtPosition(0) || battler == GetBattlerAtPosition(1))
            cryBehavior = 1;
        else
            cryBehavior = 2;

        taskId = CreateTask(sub_8046AD0, 3);
        gTasks[taskId].data[0] = species;
        gTasks[taskId].data[1] = cryPanning;
        gTasks[taskId].data[2] = cryBehavior;
        gTasks[taskId].data[15] = 0;
    }

    StartSpriteAffineAnim(&gSprites[gBankSpriteIds[sprite->data[6]]], 1);
    AnimateSprite(&gSprites[gBankSpriteIds[sprite->data[6]]]);
    gSprites[gBankSpriteIds[sprite->data[6]]].data[1] = 0x1000;
}

static void sub_8046E7C(struct Sprite *sprite)
{
    sprite->animPaused = TRUE;
    sprite->callback = sub_8046FBC;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

static void sub_8046E9C(struct Sprite *sprite)
{
    bool8 r7 = FALSE;
    u8 r4 = sprite->data[6];

    gSprites[gBankSpriteIds[r4]].invisible = FALSE;
    if (sprite->animEnded)
        sprite->invisible = TRUE;
    if (gSprites[gBankSpriteIds[r4]].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[gBankSpriteIds[r4]], 0);
        r7 = TRUE;
    }
    else
    {
        gSprites[gBankSpriteIds[r4]].data[1] -= 288;
        gSprites[gBankSpriteIds[r4]].pos2.y = gSprites[gBankSpriteIds[r4]].data[1] >> 8;
    }
    if (sprite->animEnded && r7)
    {
        s32 i;
        u32 r3;

        gSprites[gBankSpriteIds[r4]].pos2.y = 0;
        gDoingBattleAnim = 0;
        ewram17810[r4].unk0_3 = 0;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
        for (r3 = 0, i = 0; i < 4; i++)
        {
            if (ewram17810[i].unk0_3 == 0)
                r3++;
        }
        if (r3 == 4)
        {
            for (i = 0; i < 12; i++)
                FreeBallGraphics(i);
        }
    }
}

static void sub_8046FBC(struct Sprite *sprite)
{
    u8 r7 = sprite->data[6];

    sprite->data[4]++;
    if (sprite->data[4] == 40)
    {
        return;
    }
    else if (sprite->data[4] == 95)
    {
        gDoingBattleAnim = 0;
        m4aMPlayAllStop();
        PlaySE(MUS_FANFA5);
    }
    else if (sprite->data[4] == 315)
    {
        FreeOamMatrix(gSprites[gBankSpriteIds[sprite->data[6]]].oam.matrixNum);
        DestroySprite(&gSprites[gBankSpriteIds[sprite->data[6]]]);
        DestroySpriteAndFreeResources(sprite);
        if (gMain.inBattle)
            ewram17810[r7].unk0_3 = 0;
    }
}

static void SendOutPlayerMonAnimation_Step0(struct Sprite *sprite)
{
    sprite->data[0] = 25;
    sprite->data[2] = GetBattlerSpriteCoord(sprite->data[6], 2);
    sprite->data[4] = GetBattlerSpriteCoord(sprite->data[6], 3) + 24;
    sprite->data[5] = -30;
    sprite->oam.affineParam = sprite->data[6];
    InitAnimArcTranslation(sprite);
    sprite->callback = SendOutPlayerMonAnimation_Step1;
}

#define HIBYTE(x) (((x) >> 8) & 0xFF)

static void SendOutPlayerMonAnimation_Step1(struct Sprite *sprite)
{
    u32 r6;
    u32 r7;

    if (HIBYTE(sprite->data[7]) >= 35 && HIBYTE(sprite->data[7]) < 80)
    {
        s16 r4;

        if ((sprite->oam.affineParam & 0xFF00) == 0)
        {
            r6 = sprite->data[1] & 1;
            r7 = sprite->data[2] & 1;
            sprite->data[1] = ((sprite->data[1] / 3) & ~1) | r6;
            sprite->data[2] = ((sprite->data[2] / 3) & ~1) | r7;
            StartSpriteAffineAnim(sprite, 4);
        }

        r4 = sprite->data[0];
        TranslateAnimLinear(sprite);
        sprite->data[7] += sprite->data[6] / 3;
        sprite->pos2.y += Sin(HIBYTE(sprite->data[7]), sprite->data[5]);
        sprite->oam.affineParam += 0x100;
        if ((sprite->oam.affineParam >> 8) % 3 != 0)
            sprite->data[0] = r4;
        else
            sprite->data[0] = r4 - 1;

        if (HIBYTE(sprite->data[7]) >= 80)
        {
            r6 = sprite->data[1] & 1;
            r7 = sprite->data[2] & 1;
            sprite->data[1] = ((sprite->data[1] * 3) & ~1) | r6;
            sprite->data[2] = ((sprite->data[2] * 3) & ~1) | r7;
        }
    }
    else
    {
        if (TranslateAnimArc(sprite))
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.y = 0;
            sprite->pos2.x = 0;
            sprite->data[6] = sprite->oam.affineParam & 0xFF;
            sprite->data[0] = 0;
            if (IsDoubleBattle() && ewram17840.unk9_0 && sprite->data[6] == GetBattlerAtPosition(2))
                sprite->callback = SendOutMonAnimation_Delay;
            else
                sprite->callback = sub_8046C78;

            StartSpriteAffineAnim(sprite, 0);
        }
    }
}

static void SendOutMonAnimation_Delay(struct Sprite *sprite)
{
    if (sprite->data[0]++ > 24)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_8046C78;
    }
}

static void SendOutOpponentMonAnimation_Step0(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] > 15)
    {
        sprite->data[0] = 0;
        if (IsDoubleBattle() && ewram17840.unk9_0 && sprite->data[6] == GetBattlerAtPosition(3))
            sprite->callback = SendOutMonAnimation_Delay;
        else
            sprite->callback = sub_8046C78;
    }
}

static u8 sub_80472B0(u8 a, u8 b, u8 c, u8 d)
{
    return AnimateBallOpenParticles(a, b, c, d, 0);
}

static u8 sub_80472D8(u8 a, u8 b, u32 c)
{
    return sub_8141314(a, b, c, 0);
}

void CreatePokeballSprite(u8 a, u8 b, u8 x, u8 y, u8 e, u8 f, u8 g, u32 h)
{
    u8 spriteId;

    LoadCompressedObjectPic(&sBallSpriteSheets[0]);
    LoadCompressedObjectPalette(&sBallSpritePalettes[0]);
    spriteId = CreateSprite(&gBallSpriteTemplates[0], x, y, f);
    gSprites[spriteId].data[0] = a;
    gSprites[spriteId].data[5] = gSprites[a].pos1.x;
    gSprites[spriteId].data[6] = gSprites[a].pos1.y;
    gSprites[a].pos1.x = x;
    gSprites[a].pos1.y = y;
    gSprites[spriteId].data[1] = g;
    gSprites[spriteId].data[2] = b;
    gSprites[spriteId].data[3] = h;
    gSprites[spriteId].data[4] = h >> 16;
    gSprites[spriteId].oam.priority = e;
    gSprites[spriteId].callback = sub_80473D0;
    gSprites[a].invisible = TRUE;
}

static void sub_80473D0(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        u8 r5;
        u8 r7 = sprite->data[0];
        u8 r8 = sprite->data[2];
        u32 r4 = (u16)sprite->data[3] | ((u16)sprite->data[4] << 16);

        if (sprite->subpriority != 0)
            r5 = sprite->subpriority - 1;
        else
            r5 = 0;
        StartSpriteAnim(sprite, 1);
        sub_80472B0(sprite->pos1.x, sprite->pos1.y - 5, sprite->oam.priority, r5);
        sprite->data[1] = sub_80472D8(1, r8, r4);
        sprite->callback = sub_804748C;
        gSprites[r7].invisible = FALSE;
        StartSpriteAffineAnim(&gSprites[r7], 1);
        AnimateSprite(&gSprites[r7]);
        gSprites[r7].data[1] = 0x1000;
        sprite->data[7] = 0;
    }
    else
    {
        sprite->data[1]--;
    }
}

static void sub_804748C(struct Sprite *sprite)
{
    bool8 r12 = FALSE;
    bool8 r6 = FALSE;
    u8 r3 = sprite->data[0];
    u16 var1;
    u16 var2;

    if (sprite->animEnded)
        sprite->invisible = TRUE;
    if (gSprites[r3].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[r3], 0);
        r12 = TRUE;
    }
    var1 = (sprite->data[5] - sprite->pos1.x) * sprite->data[7] / 128 + sprite->pos1.x;
    var2 = (sprite->data[6] - sprite->pos1.y) * sprite->data[7] / 128 + sprite->pos1.y;
    gSprites[r3].pos1.x = var1;
    gSprites[r3].pos1.y = var2;
    if (sprite->data[7] < 128)
    {
        s16 sine = -(gSineTable[(u8)sprite->data[7]] / 8);

        sprite->data[7] += 4;
        gSprites[r3].pos2.x = sine;
        gSprites[r3].pos2.y = sine;
    }
    else
    {
        gSprites[r3].pos1.x = sprite->data[5];
        gSprites[r3].pos1.y = sprite->data[6];
        gSprites[r3].pos2.x = 0;
        gSprites[r3].pos2.y = 0;
        r6 = TRUE;
    }
    if (sprite->animEnded && r12 && r6)
        DestroySpriteAndFreeResources(sprite);
}

u8 sub_8047580(u8 a, u8 b, u8 x, u8 y, u8 e, u8 f, u8 g, u32 h)
{
    u8 spriteId;

    LoadCompressedObjectPic(&sBallSpriteSheets[0]);
    LoadCompressedObjectPalette(&sBallSpritePalettes[0]);
    spriteId = CreateSprite(&gBallSpriteTemplates[0], x, y, f);
    gSprites[spriteId].data[0] = a;
    gSprites[spriteId].data[1] = g;
    gSprites[spriteId].data[2] = b;
    gSprites[spriteId].data[3] = h;
    gSprites[spriteId].data[4] = h >> 16;
    gSprites[spriteId].oam.priority = e;
    gSprites[spriteId].callback = sub_8047638;
    return spriteId;
}

static void sub_8047638(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        u8 r6;
        u8 r7 = sprite->data[0];
        u8 r8 = sprite->data[2];
        u32 r5 = (u16)sprite->data[3] | ((u16)sprite->data[4] << 16);

        if (sprite->subpriority != 0)
            r6 = sprite->subpriority - 1;
        else
            r6 = 0;
        StartSpriteAnim(sprite, 1);
        sub_80472B0(sprite->pos1.x, sprite->pos1.y - 5, sprite->oam.priority, r6);
        sprite->data[1] = sub_80472D8(1, r8, r5);
        sprite->callback = sub_80476E0;
        StartSpriteAffineAnim(&gSprites[r7], 2);
        AnimateSprite(&gSprites[r7]);
        gSprites[r7].data[1] = 0;
    }
    else
    {
        sprite->data[1]--;
    }
}

static void sub_80476E0(struct Sprite *sprite)
{
    u8 r1;

    sprite->data[5]++;
    if (sprite->data[5] == 11)
        PlaySE(SE_SUIKOMU);
    r1 = sprite->data[0];
    if (gSprites[r1].affineAnimEnded)
    {
        StartSpriteAnim(sprite, 2);
        gSprites[r1].invisible = TRUE;
        sprite->data[5] = 0;
        sprite->callback = sub_8047754;
    }
    else
    {
        gSprites[r1].data[1] += 96;
        gSprites[r1].pos2.y = -gSprites[r1].data[1] >> 8;
    }
}

static void sub_8047754(struct Sprite *sprite)
{
    if (sprite->animEnded)
        sprite->callback = SpriteCallbackDummy;
}

void obj_delete_and_free_associated_resources_(struct Sprite *sprite)
{
    DestroySpriteAndFreeResources(sprite);
}

void sub_804777C(u8 a)
{
    struct Sprite *sprite = &gSprites[gHealthboxIDs[a]];

    sprite->data[0] = 5;
    sprite->data[1] = 0;
    sprite->pos2.x = 0x73;
    sprite->pos2.y = 0;
    sprite->callback = sub_8047830;
    if (GetBattlerSide(a) != 0)
    {
        sprite->data[0] = -sprite->data[0];
        sprite->data[1] = -sprite->data[1];
        sprite->pos2.x = -sprite->pos2.x;
        sprite->pos2.y = -sprite->pos2.y;
    }
    gSprites[sprite->data[5]].callback(&gSprites[sprite->data[5]]);
    if (GetBattlerPosition(a) == 2)
        sprite->callback = sub_804780C;
}

static void sub_804780C(struct Sprite *sprite)
{
    sprite->data[1]++;
    if (sprite->data[1] == 20)
    {
        sprite->data[1] = 0;
        sprite->callback = sub_8047830;
    }
}

static void sub_8047830(struct Sprite *sprite)
{
    sprite->pos2.x -= sprite->data[0];
    sprite->pos2.y -= sprite->data[1];
    if (sprite->pos2.x == 0 && sprite->pos2.y == 0)
        sprite->callback = SpriteCallbackDummy;
}

void sub_8047858(u8 a)
{
    u8 spriteId;

    spriteId = CreateInvisibleSpriteWithCallback(oamc_804BEB4);
    gSprites[spriteId].data[0] = 1;
    gSprites[spriteId].data[1] = gHealthboxIDs[a];
    gSprites[spriteId].callback = oamc_804BEB4;
}

static void oamc_804BEB4(struct Sprite *sprite)
{
    u8 r1 = sprite->data[1];

    gSprites[r1].pos2.y = sprite->data[0];
    sprite->data[0] = -sprite->data[0];
    sprite->data[2]++;
    if (sprite->data[2] == 21)
    {
        gSprites[r1].pos2.x = 0;
        gSprites[r1].pos2.y = 0;
        DestroySprite(sprite);
    }
}

void LoadBallGraphics(u8 ballIndex)
{
    u16 tileStart;

    if (GetSpriteTileStartByTag(sBallSpriteSheets[ballIndex].tag) == 0xFFFF)
    {
        LoadCompressedObjectPic(&sBallSpriteSheets[ballIndex]);
        LoadCompressedObjectPalette(&sBallSpritePalettes[ballIndex]);
    }

    switch (ballIndex)
    {
    case 6:
    case 10:
    case 11:
        break;
    default:
        tileStart = GetSpriteTileStartByTag(sBallSpriteSheets[ballIndex].tag);
        LZDecompressVram(gUnknown_08D030D0, (void *)(VRAM + 0x10100 + tileStart * 32));
        break;
    }
}

void FreeBallGraphics(u8 ballIndex)
{
    FreeSpriteTilesByTag(sBallSpriteSheets[ballIndex].tag);
    FreeSpritePaletteByTag(sBallSpritePalettes[ballIndex].tag);
}

static u16 GetBattlerBall(u8 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        return GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_POKEBALL);
    else
        return GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_POKEBALL);
}
