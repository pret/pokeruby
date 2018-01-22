#ifndef GUARD_DATA2_H
#define GUARD_DATA2_H

#include "sprite.h"

struct ScanlineEffectParams;

struct MonCoords
{
    // This would use a bitfield, but sub_8079F44
    // uses it as a u8 and casting won't match.
    u8 coords; // u8 x:4, y:4;
    u8 y_offset;
};

extern const struct OamData gOamData_81F96F0;
extern const struct OamData gOamData_81F96E8;
extern const struct SpriteFrameImage gSpriteImageTable_81E7A10[];
extern const struct SpriteFrameImage gSpriteImageTable_81E7A30[];
extern const struct SpriteFrameImage gSpriteImageTable_81E7A50[];
extern const struct SpriteFrameImage gSpriteImageTable_81E7A70[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7B70[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7BEC[];

extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7C18[];
extern const union AnimCmd *const gSpriteAnimTable_81E7C64[];
extern const struct MonCoords gMonFrontPicCoords[];
extern const struct MonCoords gMonBackPicCoords[];
extern const struct CompressedSpriteSheet gMonFrontPicTable[];
extern const struct CompressedSpriteSheet gMonBackPicTable[];
extern const struct CompressedSpritePalette gMonPaletteTable[];
extern const struct CompressedSpritePalette gMonShinyPaletteTable[];
extern const union AnimCmd *const *const gUnknown_081EC2A4[];
extern const union AnimCmd *const *const gUnknown_081ECACC[];
extern const struct MonCoords gTrainerBackPicCoords[];
extern const struct CompressedSpriteSheet gTrainerBackPicTable[];
extern const struct CompressedSpritePalette gTrainerBackPicPaletteTable[];
extern const u8 gEnemyMonElevation[];
extern const u8 gTrainerClassNames[][13];
extern const struct Trainer gTrainers[];
extern const u8 gSpeciesNames[][11];
extern const u8 gMoveNames[][13];
extern const u8 gAbilityNames[][13];
extern const u8 gTypeNames[][7];
extern const struct ScanlineEffectParams gUnknown_081F9674;
extern const u8 gUnknown_081F96C8[];
extern const struct CompressedSpriteSheet gUnknown_081FAEA4;
extern const struct CompressedSpritePalette gUnknown_081FAEAC;
extern const struct SpriteTemplate gSpriteTemplate_81FAF0C;
extern u8 *const gUnknown_081FAF4C[];
//extern u8 (*const gUnknown_081FAF4C[])[0x800];
extern const struct BattleMove gBattleMoves[];

// data/graphics/trainers/front_pic_coords.inc
extern const struct MonCoords gTrainerFrontPicCoords[];

// data/graphics/trainers/front_pic_table.inc
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];

// data/graphics/trainers/front_pic_palette_table.inc
extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[];


#endif // GUARD_DATA2_H
