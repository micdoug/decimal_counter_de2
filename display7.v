/*********************************************************
 Arquivo: display7.v
 Descrição:
 Implementação do módulo controlador do display de 7 segmentos.
 Ele é responsável por converter um número de 4 bits para 
 representação no display.
*********************************************************/

module display7
(
	iDigit, 		// Dígito de entrada 
	oDisplay		// Saída para o display
);

input wire [3:0] iDigit;
output reg [6:0] oDisplay;

always @(iDigit) begin
	case (iDigit)
	  4'h0: oDisplay = 7'b1000000;
	  4'h1: oDisplay = 7'b1111001;     // ---a(0)---
	  4'h2: oDisplay = 7'b0100100;     // |      |
	  4'h3: oDisplay = 7'b0110000;     // f(5)   b(1)
	  4'h4: oDisplay = 7'b0011001;     // |      |
	  4'h5: oDisplay = 7'b0010010;     // ---g(6)-
	  4'h6: oDisplay = 7'b0000010;     // |      |
	  4'h7: oDisplay = 7'b1111000;     // e(4)   c(2)
	  4'h8: oDisplay = 7'b0000000;     // |      |
	  4'h9: oDisplay = 7'b0011000;     // ---d(3)--
	  4'ha: oDisplay = 7'b0001000;
	  4'hb: oDisplay = 7'b0000011;
	  4'hc: oDisplay = 7'b1000110;
	  4'hd: oDisplay = 7'b0100001;
	  4'he: oDisplay = 7'b0000110;
	  4'hf: oDisplay = 7'b0001110;
	endcase
end

endmodule