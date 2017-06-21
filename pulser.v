/***********************************************************
	Arquivo: pulser.v
	Descrição:
	Implementação do controlador de pulso, ele armazena um estado interno
	que pode adquirir os valores 'executado' ou 'parado'. O clock de saida
	só é repassado se o status interno é executando.
************************************************************/

module pulser
(
	iClk,
	iStateTrigger,
	oClk
);

input iClk, iStateTrigger;
output reg oClk;
reg state = 0;  // estado 0 parado, estado 1 executando

// Atualizando estado interno
always @(negedge iStateTrigger) begin
	state <= ~state;
end

// Sempre que o estado mudar, atualiza o clock 
always @(state or iClk) begin
	if (state) 
		oClk <= iClk;
	else
		oClk <= 0;
end

endmodule