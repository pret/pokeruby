//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : room.cell
//Part Cell File Name (512-1023) : hall.cell

#define	MapSizeX_contest03_6	1
#define	MapSizeY_contest03_6	1

const u16	contest03_6_OutRangeCell[4]={
0x0201,0x0201,0x0201,0x0201,
};

const u16	contest03_6_MapData[MapSizeX_contest03_6*MapSizeY_contest03_6]={
0x060c,
};

const MapScreenData	contest03_6_map_data =
{
	MapSizeX_contest03_6,
	MapSizeY_contest03_6,
	contest03_6_OutRangeCell,
	contest03_6_MapData,
	&room_char_data,
	&hall_char_data
};
