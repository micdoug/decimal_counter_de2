/*************************************************************
 Arquivo: decimal_counter.v
 Descrição:
 Implementação de um contador decimal de 1 dígito com reset.
 ************************************************************/
 
 module decimal_counter
 (
	iClk,		// Clock
	iRst,		// Reset
	oDigit,	// Saída com a representação do valor atual
	oOverflow, // Vai um
 );
 
 input iClk, iRst;
 output reg [3:0] oDigit = 4'h0;
 output reg oOverflow = 1'b0;
 
 // Bloco ativado com o clock e pressionando o botão reset
 always @(posedge iClk or negedge iRst) begin
	// Se o reset foi pressionado, reseta estado do contador
	if (~iRst) begin
		oDigit <= 4'h0;
		oOverflow <= 1'b0;
	end
	// Se o valor ainda for menor que 9, incrementa
	else if (oDigit < 9) begin
		oDigit <= oDigit + 4'h1;
		oOverflow <= 1'b0;
	end
	// Caso contrário sinaliza o vai um e recomeça a contagem.
	else begin
		oDigit <= 4'h0;
		oOverflow <= 1'b1;
	end
	
 end
 
 endmodule