//MapEditNH Ver.3.39 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : field.cell
//Part Cell File Name (512-1023) : nidai.cell

#define	MapSizeX_truck	5
#define	MapSizeY_truck	5

const u16	truck_OutRangeCell[4]={
0x0206,0x0206,0x0206,0x0206,
};

const u16	truck_MapData[MapSizeX_truck*MapSizeY_truck]={
0x0601,0x0602,0x0603,0x0604,0x0605,
0x0609,0x320a,0x320b,0x320c,0x0208,
0x0611,0x3212,0x3213,0x3214,0x0210,
0x0619,0x061a,0x061b,0x321c,0x0218,
0x0621,0x0622,0x0623,0x0624,0x0620,
};

const MapScreenData	truck_map_data =
{
	MapSizeX_truck,
	MapSizeY_truck,
	truck_OutRangeCell,
	truck_MapData,
	&field_char_data,
	&nidai_char_data
};
