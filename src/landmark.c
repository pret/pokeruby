#include "global.h"
#include "landmark.h"
#include "flag.h"

#define MAPSEC_NONE 0x58

struct Landmark
{
    u8 *name;
    u16 flag;
};

struct LandmarkList
{
    u8 mapSection;
    u8 id;
    const struct Landmark **landmarks;
};

extern const struct LandmarkList gLandmarkLists[];

static const struct Landmark **GetLandmarks(u8 mapSection, u8 id);

u8 *GetLandmarkName(u8 mapSection, u8 id, u8 count)
{
    const struct Landmark **landmarks = GetLandmarks(mapSection, id);

    if (!landmarks)
        return NULL;

    while (1)
    {
        const struct Landmark *landmark = *landmarks;

        if (landmark->flag == 0xFFFF || FlagGet(landmark->flag) == TRUE)
        {
            if (count == 0)
                break;
            else
                count--;
        }

        landmarks++;
        if (!*landmarks)
            return NULL;
    }

    return (*landmarks)->name;
}

static const struct Landmark **GetLandmarks(u8 mapSection, u8 id)
{
    u16 i = 0;

    for (; gLandmarkLists[i].mapSection != MAPSEC_NONE; i++)
    {
        if (gLandmarkLists[i].mapSection > mapSection)
            return NULL;
        if (gLandmarkLists[i].mapSection == mapSection)
            break;
    }

    if (gLandmarkLists[i].mapSection == MAPSEC_NONE)
        return NULL;

    for (; gLandmarkLists[i].mapSection == mapSection; i++)
    {
        if (gLandmarkLists[i].id == id)
            return gLandmarkLists[i].landmarks;
    }

    return NULL;
}
