#ifndef GUARD_BRAILLEPUZZLES_H
#define GUARD_BRAILLEPUZZLES_H

bool8 ShouldDoBrailleStrengthEffect(void);
bool8 ShouldDoBrailleFlyEffect(void);
void DoBrailleStrengthEffect(void);
void UseFlyAncientTomb_Callback(void);
void UseFlyAncientTomb_Finish(void);
void Task_BrailleWait(u8 taskId);
bool32 BrailleWait_CheckButtonPress(void);
void SealedChamberShakingEffect(u8 taskId);
bool8 ShouldDoBrailleDigEffect(void);
void DoBrailleDigEffect(void);
void DoBrailleFlyEffect(void);

#endif
