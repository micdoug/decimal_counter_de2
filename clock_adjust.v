/*************************************************
 Arquivo: clock_adjust.v
 Descrição:
 Ajusta um clock de entrada de 50MHz para níveis inferiores.
*************************************************/

module clock_adjust
(
	iClk,
	iRst,
	oClk1MHz,
	oClk100KHz,
	oClk10KHz,
	oClk1KHz,
	oClk100Hz,
	oClk10Hz,
	oClk2Hz,
	oClk1Hz
);

input wire iClk, iRst;
output wire oClk1MHz, oClk100KHz, oClk10KHz, oClk1KHz, oClk100Hz, oClk10Hz, oClk2Hz, oClk1Hz;

divide_50 dv50_0(iClk, iRst, oClk1MHz);
divide_10 dv10_0(oClk1MHz, iRst, oClk100KHz);
divide_10 dv10_1(oClk100KHz, iRst, oClk10KHz);
divide_10 dv10_2(oClk10KHz, iRst, oClk1KHz);
divide_10 dv10_3(oClk1KHz, iRst, oClk100Hz);
divide_10 dv10_4(oClk100Hz, iRst, oClk10Hz);
divide_10 dv10_5(oClk10Hz, iRst, oClk1Hz);
divide_50 dv50_6(oClk100Hz, iRst, oClk2Hz);


endmodule