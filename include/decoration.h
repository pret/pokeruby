#ifndef GUARD_DECORATION_H
#define GUARD_DECORATION_H

enum {
    DECOCAT_DESK,
    DECOCAT_CHAIR,
    DECOCAT_PLANT,
    DECOCAT_ORNAMENT,
    DECOCAT_MAT,
    DECOCAT_POSTER,
    DECOCAT_DOLL,
    DECOCAT_CUSHION
};

struct Decoration
{
    /*0x00*/ u8 id;
    /*0x01*/ u8 name[16];
    /*0x11*/ u8 decor_field_11;
    /*0x12*/ u8 decor_field_12;
    /*0x13*/ u8 decor_field_13;
    /*0x14*/ u16 price;
    /*0x18*/ u8 *description;
    /*0x1c*/ u16 *tiles;
};

struct DecoPCPointers
{
    /* 0x00 */ u8 *items;
    /* 0x04 */ u8 *pos;
    /* 0x08 */ u8 size;
    /* 0x09 */ u8 isPlayerRoom;
};

struct DecorationInventory
{
    u8 *items;
    u8 size;
};

extern u8 ewram[];
#define ewram_1f000 (*(struct DecoPCPointers *)(ewram + 0x1f000))

extern struct Decoration gDecorations[0x77];
extern void sub_80FF394(u16 unkr0, u16 unkr1, u16 unkr2);

extern Script gUnknown_0815F399;
extern u8 *gUnknown_020388D0;
extern u8 gUnknown_020388D4;
extern u8 gUnknown_020388D5;
extern u8 gUnknown_020388F2;
extern u8 gUnknown_020388F3;
extern u8 gUnknown_020388F4;
extern u8 gUnknown_020388F6;

extern const u16 gUnknown_083EC654[3];
extern const struct DecorationInventory gDecorationInventories[];
extern const u8 *gUnknown_083EC5E4[];
extern const u8 *gUnknown_083EC624[];
extern u8 *gUnknown_020388F7[];
extern const struct MenuAction2 gUnknown_083EC604[];

extern void sub_80B3068(u8); // src/shop
extern u8 sub_8134194(u8); // src/decoration_inventory
extern void sub_8134104(u8); // src/decoration_inventory
extern void sub_80F944C(void); // src/menu_helpers
extern void sub_80F9480(u8 *[], u8); // src/menu_helpers
extern void LoadScrollIndicatorPalette(void); // src/menu_helpers
extern void DisplayItemMessageOnField(u8, const u8 *, TaskFunc, u16); // src/menu_helpers
extern void ReshowPlayerPC(u8); // src/player_pc

void sub_80FE2B4(void);
void Task_DecorationPCProcessMenuInput(u8);
void sub_80FE394(void);
void gpu_pal_decompress_alloc_tag_and_upload(u8);
void sub_80FE5AC(u8);
void sub_80FE604(u8);
void sub_80FE728(u8);
void sub_80FE758(u8);
void sub_80FE868(u8);
void sub_80FE948(u8);
void sub_80FEC94(u8);
void sub_80FECB8(u8);
void sub_80FECE0(u8);
void sub_80FEF50(u8);
void sub_8109DAC(u8);

#endif // GUARD_DECORATION_H
