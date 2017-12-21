#ifndef GUARD_SLOT_MACHINE_H
#define GUARD_SLOT_MACHINE_H

struct SlotMachineEwramStruct {
    /*0x00*/ u8 unk00;
    /*0x01*/ u8 unk01;
    /*0x02*/ u8 unk02;
    /*0x03*/ u8 unk03;
    /*0x04*/ u8 unk04;
    /*0x05*/ u8 filler05[3];
    /*0x08*/ u16 unk08;
    /*0x0A*/ u8 unk0A;
    /*0x0B*/ u8 unk0B;
    /*0x0C*/ u16 coins;
    /*0x0E*/ u16 unk0E;
    /*0x10*/ u16 unk10;
    /*0x12*/ u16 unk12;
    /*0x14*/ u8 filler14[4];
    /*0x18*/ u16 unk18;
    /*0x1A*/ u16 unk1A;
    /*0x1C*/ s16 unk1C[3];
    /*0x22*/ u16 unk22[3];
    /*0x28*/ s16 unk28[3];
    /*0x2E*/ u8 filler2E[15];
    /*0x3D*/ u8 unk3D;
    /*0x3E*/ u8 filler3E[26];
    /*0x58*/ u16 win0h;
    /*0x5a*/ u16 win0v;
    /*0x5c*/ u16 winIn;
    /*0x5e*/ u16 winOut;
    /*0x60*/ u16 backupMapMusic;
    /*0x64*/ void *unk64;
};

void PlaySlotMachine(u8, void *);
void sub_8104DA4(void);
u8 sub_8105BB4(u8, u8, s16);

#endif // GUARD_SLOT_MACHINE_H
