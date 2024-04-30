module LM70(TEMP_SET, RSTN, CS, SCK, SIO);
	output SIO;
	input SCK, CS, RSTN;
	input [15:0] TEMP_SET;
	reg [15:0] shift_reg;
	wire clk_gated;

	assign SIO = shift_reg[15];
	assign clk_gated = ~CS & SCK;
	always @(negedge CS or negedge RSTN)
		begin
			shift_reg <= TEMP_SET;
		end
	always @(negedge clk_gated)
		begin
			shift_reg = shift_reg<<1;
		end
endmodule


