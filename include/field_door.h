#ifndef GUARD_FIELDDOOR_H
#define GUARD_FIELDDOOR_H

struct DoorGraphics
{
    u16 metatileNum;
    u8 sound;
    const void *tiles;
    const void *palette;
};

struct DoorAnimFrame
{
    u8 time;
    u16 offset;
};

void FieldSetDoorOpened(int, int);
void FieldSetDoorClosed(int, int);
s8 FieldAnimateDoorClose(int, int);
s8 FieldAnimateDoorOpen(int, int);
bool8 FieldIsDoorAnimationRunning(void);
u16 GetDoorSoundEffect(int, int);

#endif
