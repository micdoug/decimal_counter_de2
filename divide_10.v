/****************************************************************
	Arquivo: divide_10.v
	Descrição:
	Divide um sinal de clock por fator de 10.
***************************************************************/

module divide_10
(
	iClk,
	iRst,
	oClk
);

input wire iClk, iRst;
output reg oClk = 1'b0;
reg [4:0] counter = 5'h0;

always @(posedge iClk or negedge iRst) begin
	
	if (~iRst) begin
		counter <= 5'b0;
		oClk <= 1'b0;
	end
	else if (counter < 5'd4) begin
		counter <= counter + 5'b1;
	end
	else begin
		oClk = ~oClk;
		counter <= 5'b0;
	end
end

endmodule