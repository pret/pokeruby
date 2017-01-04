#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

#define BATTLE_TYPE_DOUBLE          0x0001
#define BATTLE_TYPE_LINK            0x0002
#define BATTLE_TYPE_WILD            0x0004
#define BATTLE_TYPE_TRAINER         0x0008
#define BATTLE_TYPE_FIRST_BATTLE    0x0010
#define BATTLE_TYPE_20              0x0020
#define BATTLE_TYPE_40              0x0040
#define BATTLE_TYPE_SAFARI          0x0080
#define BATTLE_TYPE_BATTLE_TOWER    0x0100
#define BATTLE_TYPE_WALLY_TUTORIAL  0x0200
#define BATTLE_TYPE_ROAMER          0x0400
#define BATTLE_TYPE_EREADER_TRAINER 0x0800
#define BATTLE_TYPE_KYOGRE_GROUDON  0x1000
#define BATTLE_TYPE_LEGENDARY       0x2000
#define BATTLE_TYPE_REGI            0x4000

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
