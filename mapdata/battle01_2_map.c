//MapEditNH Ver.3.55 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : b_tower.cell

#define	MapSizeX_battle01_2	4
#define	MapSizeY_battle01_2	7

const u16	battle01_2_OutRangeCell[4]={
0x0001,0x0001,0x0001,0x0001,
};

const u16	battle01_2_MapData[MapSizeX_battle01_2*MapSizeY_battle01_2]={
0x0668,0x0669,0x0669,0x066a,
0x0670,0x0671,0x0671,0x0672,
0x0678,0x0679,0x0679,0x067a,
0x325c,0x325d,0x325d,0x325d,
0x3264,0x3265,0x3265,0x3266,
0x3264,0x3265,0x3265,0x3266,
0x3264,0x324f,0x3257,0x3266,
};

const MapScreenData	battle01_2_map_data =
{
	MapSizeX_battle01_2,
	MapSizeY_battle01_2,
	battle01_2_OutRangeCell,
	battle01_2_MapData,
	&room_char_data,
	&b_tower_char_data
};
