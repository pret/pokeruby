//
// Created by scott on 6/27/2017.
//

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "text.h"
#include "palette.h"
#include "pokeblock.h"

void sub_810B674(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

void sub_810B68C(void)
{
    u16 *src;
    vu16 *dest;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    src = gBGTilemapBuffers[2];
    dest = (vu16 *)(VRAM + 0x7800);
    DmaCopy16(3, src, dest, sizeof gBGTilemapBuffers[2]);
}
