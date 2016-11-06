#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

struct Trainer
{
	/*0x00*/ u8 partyFlags;
	/*0x01*/ u8 trainerClass;
	/*0x02*/ u8 encounterMusic:7;
	/*0x02*/ u8 gender:1;
	/*0x03*/ u8 trainerPic;
	/*0x04*/ u8 trainerName[12];
	/*0x10*/ u16 items[4];
	/*0x18*/ bool8 doubleBattle;
	/*0x1C*/ u32 aiFlags;
	/*0x20*/ u8 partySize;
	/*0x24*/ void *party;
};

#endif // GUARD_BATTLE_H
