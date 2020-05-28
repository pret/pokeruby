//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : hall.cell

#define	MapSizeX_contest02_2	1
#define	MapSizeY_contest02_2	1

const u16	contest02_2_OutRangeCell[4]={
0x0201,0x0201,0x0201,0x0201,
};

const u16	contest02_2_MapData[MapSizeX_contest02_2*MapSizeY_contest02_2]={
0x061d,
};

const MapScreenData	contest02_2_map_data =
{
	MapSizeX_contest02_2,
	MapSizeY_contest02_2,
	contest02_2_OutRangeCell,
	contest02_2_MapData,
	&room_char_data,
	&hall_char_data
};
