#ifndef GUARD_DATA_MENU_CURSOR_H
#define GUARD_DATA_MENU_CURSOR_H

const u8 OutlineCursorTiles_00[] = INCBIN_U8("graphics/interface/outline_cursor_00.4bpp");
const u8 OutlineCursorTiles_01[] = INCBIN_U8("graphics/interface/outline_cursor_01.4bpp");
const u8 OutlineCursorTiles_02[] = INCBIN_U8("graphics/interface/outline_cursor_02.4bpp");
const u8 OutlineCursorTiles_03[] = INCBIN_U8("graphics/interface/outline_cursor_03.4bpp");
const u8 OutlineCursorTiles_04[] = INCBIN_U8("graphics/interface/outline_cursor_04.4bpp");
const u8 OutlineCursorTiles_05[] = INCBIN_U8("graphics/interface/outline_cursor_05.4bpp");
const u8 OutlineCursorTiles_06[] = INCBIN_U8("graphics/interface/outline_cursor_06.4bpp");
const u8 OutlineCursorTiles_07[] = INCBIN_U8("graphics/interface/outline_cursor_07.4bpp");
const u8 OutlineCursorTiles_08[] = INCBIN_U8("graphics/interface/outline_cursor_08.4bpp");
const u8 OutlineCursorTiles_09[] = INCBIN_U8("graphics/interface/outline_cursor_09.4bpp");
const u8 OutlineCursorTiles_10[] = INCBIN_U8("graphics/interface/outline_cursor_10.4bpp");
const u8 OutlineCursorTiles_11[] = INCBIN_U8("graphics/interface/outline_cursor_11.4bpp");
const u8 OutlineCursorTiles_12[] = INCBIN_U8("graphics/interface/outline_cursor_12.4bpp");
const u8 OutlineCursorTiles_13[] = INCBIN_U8("graphics/interface/outline_cursor_13.4bpp");
const u8 OutlineCursorTiles_14[] = INCBIN_U8("graphics/interface/outline_cursor_14.4bpp");
const u8 OutlineCursorTiles_15[] = INCBIN_U8("graphics/interface/outline_cursor_15.4bpp");

const struct OamData gOamData_842F11C = {
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = ST_OAM_V_RECTANGLE
};
const struct OamData gOamData_842F124 = {
    .objMode = ST_OAM_OBJ_WINDOW,
    .shape = ST_OAM_V_RECTANGLE
};
const struct OamData gOamData_842F12C = {
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = ST_OAM_V_RECTANGLE
};

const union AnimCmd gSpriteAnim_842F134[] = {
    ANIMCMD_FRAME(0, 63),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_842F13C[] = {
    gSpriteAnim_842F134
};

const struct SpriteSheet gUnknown_0842F140[] = {
    { OutlineCursorTiles_00, 0x380, 0xFFF0 },
    { OutlineCursorTiles_01, 0x380, 0xFFF0 },
    { OutlineCursorTiles_02, 0x380, 0xFFF0 },
    { OutlineCursorTiles_03, 0x380, 0xFFF0 },
    { OutlineCursorTiles_04, 0x380, 0xFFF0 },
    { OutlineCursorTiles_05, 0x380, 0xFFF0 },
    { OutlineCursorTiles_06, 0x380, 0xFFF0 },
    { OutlineCursorTiles_07, 0x380, 0xFFF0 },
    { OutlineCursorTiles_08, 0x380, 0xFFF0 },
    { OutlineCursorTiles_09, 0x380, 0xFFF0 },
    { OutlineCursorTiles_10, 0x380, 0xFFF0 },
    { OutlineCursorTiles_11, 0x380, 0xFFF0 },
    { OutlineCursorTiles_12, 0x380, 0xFFF0 },
    { OutlineCursorTiles_13, 0x380, 0xFFF0 },
    { OutlineCursorTiles_14, 0x380, 0xFFF0 },
    { OutlineCursorTiles_15, 0x380, 0xFFF0 }
};

const struct SpriteSheet gUnknown_0842F1C0[] = {
    { OutlineCursorTiles_00, 0x380, 0xFFF1 },
    { OutlineCursorTiles_01, 0x380, 0xFFF1 },
    { OutlineCursorTiles_02, 0x380, 0xFFF1 },
    { OutlineCursorTiles_03, 0x380, 0xFFF1 },
    { OutlineCursorTiles_04, 0x380, 0xFFF1 },
    { OutlineCursorTiles_05, 0x380, 0xFFF1 },
    { OutlineCursorTiles_06, 0x380, 0xFFF1 },
    { OutlineCursorTiles_07, 0x380, 0xFFF1 },
    { OutlineCursorTiles_08, 0x380, 0xFFF1 },
    { OutlineCursorTiles_09, 0x380, 0xFFF1 },
    { OutlineCursorTiles_10, 0x380, 0xFFF1 },
    { OutlineCursorTiles_11, 0x380, 0xFFF1 },
    { OutlineCursorTiles_12, 0x380, 0xFFF1 },
    { OutlineCursorTiles_13, 0x380, 0xFFF1 },
    { OutlineCursorTiles_14, 0x380, 0xFFF1 },
    { OutlineCursorTiles_15, 0x380, 0xFFF1 }
};

const struct SpritePalette gUnknown_0842F240 = {
    gUnknown_0203A360, 0xfff0
};
const struct SpritePalette gUnknown_0842F248 = {
    gUnknown_0203A360, 0xfff1
};

const struct SpriteTemplate gSpriteTemplate_842F250[] = {
    {
        0xfff0, 0xfff0, &gOamData_842F11C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    }, {
        0xfff0, 0xffff, &gOamData_842F11C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    }, {
        0xfff0, 0xffff, &gOamData_842F124, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    }
};
const struct SpriteTemplate gSpriteTemplate_842F298[] = {
    {
        0xfff1, 0xfff1, &gOamData_842F12C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    }, {
        0xfff1, 0xffff, &gOamData_842F12C, gSpriteAnimTable_842F13C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    }
};


const struct Subsprite gSubspriteTable_842F2C8[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F2D8[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {   9,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F2F0[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {   9,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {  17,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F310[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  25,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F328[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F340[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {   9,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  41,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F360[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  17,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  49,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F380[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  25,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  57,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F3A0[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  65,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F3C0[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {   9,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  41,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  73,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F3E8[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  49,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  81,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F410[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  57,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  89,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F438[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  65,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  97,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F460[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {   9,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  41,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  73,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    { 105,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F490[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  65,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  81,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    { 113,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F4C0[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  65,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  89,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    { 121,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F4F0[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  33,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  65,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  97,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    { 129,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F520[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 1,   0, 0 },
    {   1,  -1, ST_OAM_V_RECTANGLE, 1,   4, 0 },
    {   9,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  41,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  73,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    { 105,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    { 137,  -1, ST_OAM_V_RECTANGLE, 1,   8, 0 }
};

const struct Subsprite gSubspriteTable_842F558[] = {
    {  -1,  -1, ST_OAM_V_RECTANGLE, 0,   0, 0 },
    {   7,  -1, ST_OAM_SQUARE, 2,  12, 0 },
    {  35,  -1, ST_OAM_V_RECTANGLE, 0,   8, 0 }
};

const struct Subsprite *const gUnknown_0842F5BC[] = {
    gSubspriteTable_842F558
};

const struct SubspriteTable gSubspriteTables_842F5C0[] = {
    {1, gMenuCursorSubsprites},
    {1, gMenuCursorSubsprites},
    {2, gMenuCursorSubsprites},
    {3, gMenuCursorSubsprites},
    {4, gMenuCursorSubsprites},
    {5, gMenuCursorSubsprites},
    {6, gMenuCursorSubsprites},
    {7, gMenuCursorSubsprites},
    {8, gMenuCursorSubsprites},
    {9, gMenuCursorSubsprites},
    {10, gMenuCursorSubsprites},
    {11, gMenuCursorSubsprites},
    {12, gMenuCursorSubsprites},
    {13, gMenuCursorSubsprites},
    {14, gMenuCursorSubsprites},
    {15, gMenuCursorSubsprites},
    {16, gMenuCursorSubsprites},
    {17, gMenuCursorSubsprites},
    {18, gMenuCursorSubsprites},
    {19, gMenuCursorSubsprites},
    {20, gMenuCursorSubsprites},
    {21, gMenuCursorSubsprites},
    {22, gMenuCursorSubsprites},
    {23, gMenuCursorSubsprites},
    {24, gMenuCursorSubsprites},
    {25, gMenuCursorSubsprites},
    {26, gMenuCursorSubsprites},
    {27, gMenuCursorSubsprites},
    {28, gMenuCursorSubsprites},
    {29, gMenuCursorSubsprites},
    {30, gMenuCursorSubsprites},
    {31, gMenuCursorSubsprites}
};

const struct SubspriteTable gSubspriteTables_842F6C0[] = {
    {2, gSubspriteTable_842F2C8},
    {2, gSubspriteTable_842F2C8},
    {3, gSubspriteTable_842F2D8},
    {4, gSubspriteTable_842F2F0},
    {3, gSubspriteTable_842F310},
    {3, gSubspriteTable_842F328},
    {4, gSubspriteTable_842F340},
    {4, gSubspriteTable_842F360},
    {4, gSubspriteTable_842F380},
    {4, gSubspriteTable_842F3A0},
    {5, gSubspriteTable_842F3C0},
    {5, gSubspriteTable_842F3E8},
    {5, gSubspriteTable_842F410},
    {5, gSubspriteTable_842F438},
    {6, gSubspriteTable_842F460},
    {6, gSubspriteTable_842F490},
    {6, gSubspriteTable_842F4C0},
    {6, gSubspriteTable_842F4F0},
    {7, gSubspriteTable_842F520}
};

const struct SubspriteTable gUnknown_0842F758[] = {
    {3, gMenuCursorSubsprites}
};

const struct Subsprite gUnknown_0842F760 = {
    .y = -1, .shape = ST_OAM_V_RECTANGLE, .size = 1
};

const struct Subsprite gUnknown_0842F768 = {
    .y = -1, .shape = ST_OAM_V_RECTANGLE, .size = 1, .tileOffset = 8
};

const struct Subsprite gUnknown_0842F770 = {
    .y = -1, .shape = ST_OAM_SQUARE, .size = 2, .tileOffset = 12
};

const struct Subsprite gUnknown_0842F778 = {
    .y = -1, .shape = ST_OAM_V_RECTANGLE, .size = 1, .tileOffset = 4
};

const struct Subsprite gUnknown_0842F780 = {
    .y = -1, .shape = ST_OAM_V_RECTANGLE, .size = 1
};

const struct Subsprite gUnknown_0842F788 = {
    .y = -1, .shape = ST_OAM_SQUARE, .size = 2, .tileOffset = 12
};

const struct Subsprite gUnknown_0842F790 = {
    .y = -1, .shape = ST_OAM_V_RECTANGLE, .size = 1, .tileOffset = 4
};

const struct Subsprite gUnknown_0842F798 = {
    .y = -1, .shape = ST_OAM_V_RECTANGLE, .size = 1, .tileOffset = 8
};

#endif //GUARD_DATA_MENU_CURSOR_H
