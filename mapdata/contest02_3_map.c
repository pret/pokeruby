//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : hall.cell

#define	MapSizeX_contest02_3	1
#define	MapSizeY_contest02_3	1

const u16	contest02_3_OutRangeCell[4]={
0x0201,0x0201,0x0201,0x0201,
};

const u16	contest02_3_MapData[MapSizeX_contest02_3*MapSizeY_contest02_3]={
0x061d,
};

const MapScreenData	contest02_3_map_data =
{
	MapSizeX_contest02_3,
	MapSizeY_contest02_3,
	contest02_3_OutRangeCell,
	contest02_3_MapData,
	&room_char_data,
	&hall_char_data
};
