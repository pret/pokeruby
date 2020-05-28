//MapEditNH Ver.3.55 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : b_tower.cell

#define	MapSizeX_dep01_7	4
#define	MapSizeY_dep01_7	6

const u16	dep01_7_OutRangeCell[4]={
0x0001,0x0001,0x0001,0x0001,
};

const u16	dep01_7_MapData[MapSizeX_dep01_7*MapSizeY_dep01_7]={
0x0668,0x0669,0x0669,0x066a,
0x0670,0x0671,0x0671,0x0672,
0x0678,0x0679,0x0679,0x067a,
0x325c,0x325d,0x325d,0x325d,
0x3264,0x3265,0x3265,0x3266,
0x3264,0x324f,0x3257,0x3266,
};

const MapScreenData	dep01_7_map_data =
{
	MapSizeX_dep01_7,
	MapSizeY_dep01_7,
	dep01_7_OutRangeCell,
	dep01_7_MapData,
	&room_char_data,
	&b_tower_char_data
};
