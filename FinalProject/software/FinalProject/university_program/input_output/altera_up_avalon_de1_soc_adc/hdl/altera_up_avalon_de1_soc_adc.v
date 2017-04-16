// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

/******************************************************************************
 *                                                                            *
 * This module is designed for use on an Altera DE0-Nano Development Board.   *
 *  It allows a user to interface with the on-board Analog-to-Digital         *
 *  Converter.                                                                *
 *                                                                            *
 ******************************************************************************/
 
module altera_up_avalon_de1_soc_adc (
	clock, 
	reset, 
	read, 
	write, 
	readdata, 
	writedata, 
	address,
	waitrequest,
	adc_sclk,
	adc_cs_n,
	adc_din,
	adc_dout
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
parameter tsclk = 8'd6;
parameter numch = 3'd7;
/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
	input clock, reset, read, write;
	input [31:0] writedata;
	input [2:0] address;
	output reg [31:0] readdata;
	output reg waitrequest;

	input adc_dout;
	output adc_sclk, adc_cs_n, adc_din;

	reg go;
	reg [11:0] values [7:0];
	reg auto_run;

	wire done;
	wire [11:0] outs [7:0];

	defparam ADC_CTRL.T_SCLK = tsclk, ADC_CTRL.NUM_CH = numch;
	altera_up_avalon_de1_soc_adv_adc ADC_CTRL (clock, reset, go, adc_sclk, adc_cs_n, adc_din, adc_dout, done, outs[0],
						 outs[1], outs[2], outs[3], outs[4], outs [5], outs[6], outs[7]);
// - - - - - - - readdata & waitrequest - - - - - - -
	always @(*)
	begin
		readdata =0;
		waitrequest =0;
		if (write && done)	//need done to be lowered before re-raising go
			waitrequest=1; 
		if (read) begin
			if (go&&!auto_run)
				waitrequest=1;
			else
				readdata = {20'b0, values[address]};
		end
	end	
// - - - - - - - - - - go  - - - - - - - - - 	
	always @ (posedge clock)
	begin
		if (reset) 
			go<=1'b0;
		else if (done) 
			go<=1'b0;
		else if (write && address == 3'b0)
			go<=1'b1;
		else if (auto_run)
			go<=1'b1;
	end
// - - - - - - - values - - - - - - - - - - - - -	
	always @ (posedge clock) 
		if (done) begin
			values[0] <= outs[0];
			values[1] <= outs[1];
			values[2] <= outs[2];
			values[3] <= outs[3];
			values[4] <= outs[4];
			values[5] <= outs[5];
			values[6] <= outs[6];
			values[7] <= outs[7];
		end
// - - - - - - - - - - auto run - - - - - - - - - - 
	always @(posedge clock) 
		if (write && address == 3'd1)
			auto_run <= writedata[0];

endmodule
