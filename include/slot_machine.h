#ifndef GUARD_SLOT_MACHINE_H
#define GUARD_SLOT_MACHINE_H

enum
{
    SLOT_MACHINE_TAG_7_RED,
    SLOT_MACHINE_TAG_7_BLUE,
    SLOT_MACHINE_TAG_AZURILL,
    SLOT_MACHINE_TAG_LOTAD,
    SLOT_MACHINE_TAG_CHERRY,
    SLOT_MACHINE_TAG_POWER,
    SLOT_MACHINE_TAG_REPLAY
};

enum
{
    SLOT_MACHINE_MATCHED_1CHERRY,
    SLOT_MACHINE_MATCHED_2CHERRY,
    SLOT_MACHINE_MATCHED_REPLAY,
    SLOT_MACHINE_MATCHED_LOTAD,
    SLOT_MACHINE_MATCHED_AZURILL,
    SLOT_MACHINE_MATCHED_POWER,
    SLOT_MACHINE_MATCHED_777_MIXED,
    SLOT_MACHINE_MATCHED_777_RED,
    SLOT_MACHINE_MATCHED_777_BLUE,
    SLOT_MACHINE_MATCHED_NONE
};

struct SlotMachineEwramStruct
{
    /*0x00*/ u8 state;
    /*0x01*/ u8 unk01;
    /*0x02*/ u8 pikaPower;
    /*0x03*/ u8 unk03;
    /*0x04*/ u8 unk04;
    /*0x05*/ u8 unk05;
    /*0x06*/ u8 unk06;
    /*0x07*/ u8 unk07;
    /*0x08*/ u16 matchedSymbols;
    /*0x0A*/ u8 unk0A;
    /*0x0B*/ u8 unk0B;
    /*0x0C*/ s16 coins;
    /*0x0E*/ s16 payout;
    /*0x10*/ s16 unk10;
    /*0x12*/ s16 bet;
    /*0x14*/ s16 unk14;
    /*0x16*/ s16 unk16;
    /*0x18*/ s16 unk18;
    /*0x1A*/ s16 unk1A;
    /*0x1C*/ s16 unk1C[3];
    /*0x22*/ u16 unk22[3];
    /*0x28*/ s16 reelPositions[3];
    /*0x2E*/ s16 unk2E[3];
    /*0x34*/ s16 unk34[3];
    /*0x3A*/ u8 reelTasks[3];
    /*0x3D*/ u8 unk3D;
    /*0x3E*/ u8 unk3E;
    /*0x3F*/ u8 unk3F;
    /*0x40*/ u8 unk40;
    /*0x41*/ u8 unk41;
    /*0x42*/ u8 unk42;
    /*0x43*/ u8 unk43;
    /*0x44*/ u8 unk44[5];
    /*0x49*/ u8 unk49[2];
    /*0x49*/ u8 unk4B[3];
    /*0x4E*/ u8 unk4E[2];
    /*0x50*/ u8 unk50[2];
    /*0x52*/ u8 unk52[2];
    /*0x54*/ u8 unk54[4];
    /*0x58*/ u16 win0h;
    /*0x5a*/ u16 win0v;
    /*0x5c*/ u16 winIn;
    /*0x5e*/ u16 winOut;
    /*0x60*/ u16 backupMapMusic;
    /*0x64*/ MainCallback prevMainCb;
#if DEBUG
             u8 unk68[4];
             u8 unk6C[0];
#endif
};

void PlaySlotMachine(u8 arg0, MainCallback cb);
void sub_8104DA4(void);
u8 sub_8105BB4(u8 templateIdx, u8 cbAndCoordsIdx, s16 a2);
void debug_sub_811609C(u8, void (*)(void));

#endif // GUARD_SLOT_MACHINE_H
