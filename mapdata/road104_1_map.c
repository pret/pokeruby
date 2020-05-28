//MapEditNH Ver.3.48 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : field.cell
//Part Cell File Name (512-1023) : field_2.cell

#define	MapSizeX_road104_1	1
#define	MapSizeY_road104_1	1

const u16	road104_1_OutRangeCell[4]={
0x01d4,0x01d5,0x01dc,0x01dd,
};

const u16	road104_1_MapData[MapSizeX_road104_1*MapSizeY_road104_1]={
0x0201,
};

const MapScreenData	road104_1_map_data =
{
	MapSizeX_road104_1,
	MapSizeY_road104_1,
	road104_1_OutRangeCell,
	road104_1_MapData,
	&field_char_data,
	&field_2_char_data
};
