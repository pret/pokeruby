#ifndef GUARD_MENU_HELPERS_H
#define GUARD_MENU_HELPERS_H

struct YesNoFuncTable
{
    void (*yesFunc)(u8);
    void (*noFunc)(u8);
};

void DoYesNoFuncWithChoice(u8, const struct YesNoFuncTable *);

#endif // GUARD_MENU_HELPERS_H
