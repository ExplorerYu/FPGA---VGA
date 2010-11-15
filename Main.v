`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:00 11/14/2010 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
	clock,
	hs,
	vs,
	r,
	g,
	b
    );
			
	input clock;
	output hs, vs, r, g, b;
	
	reg[10:0] x_counter;
	reg[10:0] y_counter;
	
	//wire clk;
	
	initial begin
		x_counter = 0;
		y_counter = 0;
	end
	
	always @(posedge clock) begin
		if(x_counter == 1055)
		begin
			x_counter = 0;
			
			if(y_counter == 627)
				y_counter = 0;
			else
				y_counter = y_counter + 1;
		end
		else
			x_counter = x_counter + 1;
		
	end
	
	assign r = x_counter < 800 && y_counter < 600;
	assign g = x_counter < 800 && y_counter < 600;
	assign b = x_counter < 800 && y_counter < 600;
	
	assign hs = x_counter > 839 && x_counter < 968;
	assign vs = y_counter > 600 && y_counter < 605;

endmodule

module clk_div_4012(
	input clk,
	output reg out
);	
	reg [25:0]count;
	
	initial
	begin
		out = 0;
		count = 0;
	end
	
	always @(posedge clk)begin
		count = count + 1;
		
		if(count > 20060000) begin
			count = 0;
			out = ~out;
		
		end
		
	end
	
endmodule
