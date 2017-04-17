<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
// (C) 2001-2011 Altera Corporation. All rights reserved.
=======
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



>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv
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


<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
// $Id: //acds/rel/11.0sp1/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#3 $
// $Revision: #3 $
// $Date: 2011/05/16 $
// $Author: jyeap $
=======
// $Id: //acds/rel/15.0/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2015/02/08 $
// $Author: swbranch $
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module Video_System_id_router_003_default_decode
  #(
     parameter DEFAULT_CHANNEL = 0,
               DEFAULT_DESTID = 2 
   )
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
  (output [85 - 83 : 0] default_destid,
   output [6-1 : 0] default_src_channel
  );

  assign default_destid = DEFAULT_DESTID[85 - 83 : 0];
  generate begin : default_decode
    if (DEFAULT_CHANNEL == -1)
      assign default_src_channel = '0;
    else
      assign default_src_channel = 6'b1 << DEFAULT_CHANNEL;
  end endgenerate
=======
  (output [93 - 90 : 0] default_destination_id,
   output [9-1 : 0] default_wr_channel,
   output [9-1 : 0] default_rd_channel,
   output [9-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[93 - 90 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 9'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 9'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 9'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv

endmodule


module Video_System_id_router_003
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
    input  [87-1 : 0]    sink_data,
=======
    input  [107-1 : 0]    sink_data,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
    output reg [87-1    : 0] src_data,
    output reg [6-1 : 0] src_channel,
=======
    output reg [107-1    : 0] src_data,
    output reg [9-1 : 0] src_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
    localparam PKT_DEST_ID_H = 85;
    localparam PKT_DEST_ID_L = 83;
    localparam ST_DATA_W = 87;
    localparam ST_CHANNEL_W = 6;
=======
    localparam PKT_DEST_ID_H = 93;
    localparam PKT_DEST_ID_L = 90;
    localparam PKT_PROTECTION_H = 97;
    localparam PKT_PROTECTION_L = 95;
    localparam ST_DATA_W = 107;
    localparam ST_CHANNEL_W = 9;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv
    localparam DECODER_TYPE = 1;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;

    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------

    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 32'h0;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;
    localparam RG = RANGE_ADDR_WIDTH-1;

    reg [PKT_DEST_ID_W-1 : 0] destid;

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
=======
    wire [9-1 : 0] default_src_channel;




>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv

    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [6-1 : 0] default_src_channel;

    Video_System_id_router_003_default_decode the_default_decode(
      .default_destid (default_destid),
      .default_src_channel (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        // --------------------------------------------------
        // DestinationID Decoder
        // Sets the channel based on the destination ID.
        // --------------------------------------------------
        destid      = sink_data[PKT_DEST_ID_H : PKT_DEST_ID_L];

<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_id_router_003.sv
        if (destid == 2) begin
            src_channel = 6'b1;
=======


        if (destid == 0 ) begin
            src_channel = 9'b1;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_router_003.sv
        end

    end

    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[63:0] val;
        reg [63:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


