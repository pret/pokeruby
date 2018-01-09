#ifndef GUARD_TEXT_WINDOW_H
#define GUARD_TEXT_WINDOW_H

#include "text.h"

struct FrameGraphics
{
    const u8 *tiles;
    const u16 *palette;
};

u16 TextWindow_SetBaseTileNum(u16 baseTileNum);
void TextWindow_LoadStdFrameGraphics(struct Window *win);
void TextWindow_LoadStdFrameGraphicsOverridePal(struct Window *win, u8 palSlot);
void TextWindow_LoadStdFrameGraphicsOverrideStyle(struct Window *win, u8 frameType);
void TextWindow_DrawStdFrame(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
const struct FrameGraphics *TextWindow_GetFrameGraphics(u8 frameType);
u16 TextWindow_SetDlgFrameBaseTileNum(u16 baseTileNum);
void unref_sub_80651DC(struct Window *, u8 *);
void TextWindow_DisplayDialogueFrame(struct Window *);
void TextWindow_DrawDialogueFrame(struct Window *win);
void TextWindow_LoadDialogueFrameTiles(struct Window *win);
void TextWindow_EraseDialogueFrame(struct Window *win);

#endif // GUARD_TEXT_WINDOW_H
