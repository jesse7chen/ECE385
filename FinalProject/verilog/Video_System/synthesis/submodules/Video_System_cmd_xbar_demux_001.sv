<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
// (C) 2001-2011 Altera Corporation. All rights reserved.
=======
// (C) 2001-2015 Altera Corporation. All rights reserved.
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
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


<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
// $Id: //acds/rel/11.0sp1/ip/merlin/altera_merlin_demultiplexer/altera_merlin_demultiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2011/04/07 $
// $Author: max $
=======
// $Id: //acds/rel/15.0/ip/merlin/altera_merlin_demultiplexer/altera_merlin_demultiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2015/02/08 $
// $Author: swbranch $
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv

// -------------------------------------
// Merlin Demultiplexer
//
// Asserts valid on the appropriate output
// given a one-hot channel signal.
// -------------------------------------

`timescale 1 ns / 1 ns

// ------------------------------------------
// Generation parameters:
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
//   output_name:         Video_System_cmd_xbar_demux_001
//   ST_DATA_W:           87
//   ST_CHANNEL_W:        6
//   NUM_OUTPUTS:         6
//   VALID_WIDTH:         6
=======
//   output_name:         nios_system_mm_interconnect_0_cmd_demux_001
//   ST_DATA_W:           107
//   ST_CHANNEL_W:        9
//   NUM_OUTPUTS:         8
//   VALID_WIDTH:         1
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
// ------------------------------------------

//------------------------------------------
// Message Supression Used
// QIS Warnings
// 15610 - Warning: Design contains x input pin(s) that do not drive logic
//------------------------------------------

module Video_System_cmd_xbar_demux_001
(
    // -------------------
    // Sink
    // -------------------
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    input  [6-1      : 0]   sink_valid,
    input  [87-1    : 0]   sink_data, // ST_DATA_W=87
    input  [6-1 : 0]   sink_channel, // ST_CHANNEL_W=6
=======
    input  [1-1      : 0]   sink_valid,
    input  [107-1    : 0]   sink_data, // ST_DATA_W=107
    input  [9-1 : 0]   sink_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    input                         sink_startofpacket,
    input                         sink_endofpacket,
    output                        sink_ready,

    // -------------------
    // Sources 
    // -------------------
    output reg                      src0_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    output reg [87-1    : 0] src0_data, // ST_DATA_W=87
    output reg [6-1 : 0] src0_channel, // ST_CHANNEL_W=6
=======
    output reg [107-1    : 0] src0_data, // ST_DATA_W=107
    output reg [9-1 : 0] src0_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    output reg                      src0_startofpacket,
    output reg                      src0_endofpacket,
    input                           src0_ready,

    output reg                      src1_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    output reg [87-1    : 0] src1_data, // ST_DATA_W=87
    output reg [6-1 : 0] src1_channel, // ST_CHANNEL_W=6
=======
    output reg [107-1    : 0] src1_data, // ST_DATA_W=107
    output reg [9-1 : 0] src1_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    output reg                      src1_startofpacket,
    output reg                      src1_endofpacket,
    input                           src1_ready,

    output reg                      src2_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    output reg [87-1    : 0] src2_data, // ST_DATA_W=87
    output reg [6-1 : 0] src2_channel, // ST_CHANNEL_W=6
=======
    output reg [107-1    : 0] src2_data, // ST_DATA_W=107
    output reg [9-1 : 0] src2_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    output reg                      src2_startofpacket,
    output reg                      src2_endofpacket,
    input                           src2_ready,

    output reg                      src3_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    output reg [87-1    : 0] src3_data, // ST_DATA_W=87
    output reg [6-1 : 0] src3_channel, // ST_CHANNEL_W=6
=======
    output reg [107-1    : 0] src3_data, // ST_DATA_W=107
    output reg [9-1 : 0] src3_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    output reg                      src3_startofpacket,
    output reg                      src3_endofpacket,
    input                           src3_ready,

    output reg                      src4_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    output reg [87-1    : 0] src4_data, // ST_DATA_W=87
    output reg [6-1 : 0] src4_channel, // ST_CHANNEL_W=6
=======
    output reg [107-1    : 0] src4_data, // ST_DATA_W=107
    output reg [9-1 : 0] src4_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    output reg                      src4_startofpacket,
    output reg                      src4_endofpacket,
    input                           src4_ready,

    output reg                      src5_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    output reg [87-1    : 0] src5_data, // ST_DATA_W=87
    output reg [6-1 : 0] src5_channel, // ST_CHANNEL_W=6
=======
    output reg [107-1    : 0] src5_data, // ST_DATA_W=107
    output reg [9-1 : 0] src5_channel, // ST_CHANNEL_W=9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    output reg                      src5_startofpacket,
    output reg                      src5_endofpacket,
    input                           src5_ready,

<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
=======
    output reg                      src6_valid,
    output reg [107-1    : 0] src6_data, // ST_DATA_W=107
    output reg [9-1 : 0] src6_channel, // ST_CHANNEL_W=9
    output reg                      src6_startofpacket,
    output reg                      src6_endofpacket,
    input                           src6_ready,

    output reg                      src7_valid,
    output reg [107-1    : 0] src7_data, // ST_DATA_W=107
    output reg [9-1 : 0] src7_channel, // ST_CHANNEL_W=9
    output reg                      src7_startofpacket,
    output reg                      src7_endofpacket,
    input                           src7_ready,

>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv

    // -------------------
    // Clock & Reset
    // -------------------
    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) // setting message suppression on clk
    input clk,
    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) // setting message suppression on reset
    input reset

);

<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    localparam NUM_OUTPUTS = 6;
=======
    localparam NUM_OUTPUTS = 8;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv
    wire [NUM_OUTPUTS - 1 : 0] ready_vector;

    // -------------------
    // Demux
    // -------------------
    always @* begin
        src0_data          = sink_data;
        src0_startofpacket = sink_startofpacket;
        src0_endofpacket   = sink_endofpacket;
        src0_channel       = sink_channel >> NUM_OUTPUTS;

        src0_valid         = sink_channel[0] && sink_valid[0];

        src1_data          = sink_data;
        src1_startofpacket = sink_startofpacket;
        src1_endofpacket   = sink_endofpacket;
        src1_channel       = sink_channel >> NUM_OUTPUTS;

        src1_valid         = sink_channel[1] && sink_valid[1];

        src2_data          = sink_data;
        src2_startofpacket = sink_startofpacket;
        src2_endofpacket   = sink_endofpacket;
        src2_channel       = sink_channel >> NUM_OUTPUTS;

        src2_valid         = sink_channel[2] && sink_valid[2];

        src3_data          = sink_data;
        src3_startofpacket = sink_startofpacket;
        src3_endofpacket   = sink_endofpacket;
        src3_channel       = sink_channel >> NUM_OUTPUTS;

        src3_valid         = sink_channel[3] && sink_valid[3];

        src4_data          = sink_data;
        src4_startofpacket = sink_startofpacket;
        src4_endofpacket   = sink_endofpacket;
        src4_channel       = sink_channel >> NUM_OUTPUTS;

        src4_valid         = sink_channel[4] && sink_valid[4];

        src5_data          = sink_data;
        src5_startofpacket = sink_startofpacket;
        src5_endofpacket   = sink_endofpacket;
        src5_channel       = sink_channel >> NUM_OUTPUTS;

        src5_valid         = sink_channel[5] && sink_valid[5];

        src7_data          = sink_data;
        src7_startofpacket = sink_startofpacket;
        src7_endofpacket   = sink_endofpacket;
        src7_channel       = sink_channel >> NUM_OUTPUTS;

        src7_valid         = sink_channel[7] && sink_valid;

    end

    // -------------------
    // Backpressure
    // -------------------
    assign ready_vector[0] = src0_ready;
    assign ready_vector[1] = src1_ready;
    assign ready_vector[2] = src2_ready;
    assign ready_vector[3] = src3_ready;
    assign ready_vector[4] = src4_ready;
    assign ready_vector[5] = src5_ready;
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_cmd_xbar_demux_001.sv
    assign sink_ready = |(sink_channel & ready_vector);
=======
    assign ready_vector[6] = src6_ready;
    assign ready_vector[7] = src7_ready;

    assign sink_ready = |(sink_channel & {{1{1'b0}},{ready_vector[NUM_OUTPUTS - 1 : 0]}});
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv

endmodule


