#ifndef GUARD_TEXT_WINDOW_H
#define GUARD_TEXT_WINDOW_H

#include "text.h"

struct FrameGraphics
{
    u8 *tiles;
    u16 *palette;
};

u16 SetTextWindowBaseTileNum(u16 baseTileNum);
void LoadTextWindowGraphics(struct Window *win);
void LoadTextWindowGraphics_OverridePalSlot(struct Window *win, u8 palSlot);
void LoadTextWindowGraphics_OverrideFrameType(struct Window *win, u8 frameType);
void DrawTextWindow(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
const struct FrameGraphics *GetTextWindowFrameGraphics(u8 frameType);
u16 SetMessageBoxBaseTileNum(u16 baseTileNum);
void unref_sub_80651DC(struct Window *, u8 *);
void DisplayMessageBox(struct Window *);
void DrawStandardMessageBox(struct Window *win);
void LoadMessageBoxTiles(struct Window *win);
void ClearStandardMessageBox(struct Window *win);

#endif // GUARD_TEXT_WINDOW_H
