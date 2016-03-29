void RemoveTask(u8 taskId)
{
	if (gTasks[taskId].isActive)
	{
		gTasks[taskId].isActive = FALSE;

		if (gTasks[taskId].prev == HEAD_SENTINEL)
		{
			if (gTasks[taskId].next != TAIL_SENTINEL)
			{
				gTasks[gTasks[taskId].next].prev = HEAD_SENTINEL;
			}
		}
		else
		{
			if (gTasks[taskId].next == TAIL_SENTINEL)
			{
				gTasks[gTasks[taskId].prev].next = TAIL_SENTINEL;
			}
			else
			{
				gTasks[gTasks[taskId].prev].next = gTasks[taskId].next;
				gTasks[gTasks[taskId].next].prev = gTasks[taskId].prev;
			}
		}
	}
}
