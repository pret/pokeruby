#include "global.h"

#include "roulette_util.h"
#include "task.h"
#include "palette.h"

extern u8 gUnknown_02019000[];

extern u8 ewram[];
//#define ewram190B8  ((struct UnkStruct0 *)  (ewram + 0x190B8))
#define ewram19000  ((u8 *)                 (ewram + 0x19000))


void sub_81150FC(void)
{
	struct UnkStruct0 *s;
    u8 *p;
	RunTasks();
	AnimateSprites();
	BuildOamBuffer();
    p = ewram19000;
	s = (struct UnkStruct0 *)(&p[0xB8]);
	if (s->val0)
	task_tutorial_controls_fadein(s);
}

void sub_8115124(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    
}
