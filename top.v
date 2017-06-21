/*************************************************
 Arquivo: top.v
 Descrição:
 Implementação do módulo principal do circuito, responsável
 por interligar módulos menores e fazer as conexões com os
 dispositivos externos do FPGA.
*************************************************/

module top
(
	// Displays de 7 segmentos
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6, 
	HEX7,
	// Push buttons
	KEY,    
	// Clock de 50 MHz
	CLOCK_50
);

// Declaração das portas do módulo
output wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
input wire [3:0] KEY;
input wire CLOCK_50;
// Fim declaração de portas.

// Configuração do clock e reset
wire clock_adjusted, reset, clock;
assign reset = KEY[0];

// Ajusta o clock de 50 MHz para 2Hz
clock_adjust clk_ad(.iClk(CLOCK_50), .iRst(reset), .oClk1Hz(clock_adjusted));

pulser p0(clock_adjusted, KEY[3], clock);


// Desativa últimos 4 displays de 7 segmentos
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;
assign HEX6 = 7'b1111111;
assign HEX7 = 7'b1111111;

// Ligando os controladores dos displays de 7 segmentos
wire [3:0] digit [3:0];		// Fios para transmissão dos valores dos 4 dígitos
wire [3:0] ov;	// Sinalizadores de overflow

display7 d7_0(digit[0], HEX0);
display7 d7_1(digit[1], HEX1);
display7 d7_2(digit[2], HEX2);
display7 d7_3(digit[3], HEX3);

// Ligando os contadores decimais,
// Eles são ligados em cascata, o overflow de 1 serve como entrada de clock para o próximo
decimal_counter dc_0(clock, reset, digit[0], ov[0]);
decimal_counter dc_1(ov[0], reset, digit[1], ov[1]);
decimal_counter dc_2(ov[1], reset, digit[2], ov[2]);
decimal_counter dc_3(ov[2], reset, digit[3], ov[3]);




endmodule


























