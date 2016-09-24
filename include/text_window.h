#ifndef GUARD_TEXT_WINDOW_H
#define GUARD_TEXT_WINDOW_H

#include "global.h"

u16 SetTextWindowBaseTileNum(u16);
void LoadTextWindowGraphics(struct Window *);
void LoadTextWindowGraphics_OverridePalSlot(struct Window *, u8);
void LoadTextWindowGraphics_OverrideFrameType(struct Window *, u8);
void DrawTextWindow(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
const struct FrameGraphics *GetTextWindowFrameGraphics(u8 frameType);
u16 SetMessageBoxBaseTileNum(u16);
void unref_sub_80651DC(struct Window *, u8 *);
void DisplayMessageBox(struct Window *);
void DrawStandardMessageBox(struct Window *win);
void LoadMessageBoxTiles(struct Window *win);
void ClearStandardMessageBox(struct Window *win);

#endif // GUARD_TEXT_WINDOW_H
