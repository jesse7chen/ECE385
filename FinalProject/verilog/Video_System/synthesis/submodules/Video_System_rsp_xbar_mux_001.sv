<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
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


// (C) 2001-2014 Altera Corporation. All rights reserved.
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
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


<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
// $Id: //acds/rel/11.0sp1/ip/merlin/altera_merlin_multiplexer/altera_merlin_multiplexer.sv.terp#2 $
// $Revision: #2 $
// $Date: 2011/05/13 $
// $Author: aferrucc $
=======
// $Id: //acds/rel/15.0/ip/merlin/altera_merlin_multiplexer/altera_merlin_multiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2015/02/08 $
// $Author: swbranch $
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

// ------------------------------------------
// Merlin Multiplexer
// ------------------------------------------

`timescale 1 ns / 1 ns


// ------------------------------------------
// Generation parameters:
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
//   output_name:         Video_System_rsp_xbar_mux_001
//   NUM_INPUTS:          6
//   ARBITRATION_SHARES:  1 1 1 1 1 1
//   ARBITRATION_SCHEME   "no-arb"
//   PIPELINE_ARB:        0
//   PKT_TRANS_LOCK:      72 (arbitration locking enabled)
//   ST_DATA_W:           87
//   ST_CHANNEL_W:        6
=======
//   output_name:         nios_system_mm_interconnect_0_rsp_mux_001
//   NUM_INPUTS:          8
//   ARBITRATION_SHARES:  1 1 1 1 1 1 1 1
//   ARBITRATION_SCHEME   "no-arb"
//   PIPELINE_ARB:        0
//   PKT_TRANS_LOCK:      69 (arbitration locking enabled)
//   ST_DATA_W:           107
//   ST_CHANNEL_W:        9
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
// ------------------------------------------

module Video_System_rsp_xbar_mux_001
(
    // ----------------------
    // Sinks
    // ----------------------
    input                       sink0_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    input [87-1   : 0]  sink0_data,
    input [6-1: 0]  sink0_channel,
=======
    input [107-1   : 0]  sink0_data,
    input [9-1: 0]  sink0_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    input                       sink0_startofpacket,
    input                       sink0_endofpacket,
    output                      sink0_ready,

    input                       sink1_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    input [87-1   : 0]  sink1_data,
    input [6-1: 0]  sink1_channel,
=======
    input [107-1   : 0]  sink1_data,
    input [9-1: 0]  sink1_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    input                       sink1_startofpacket,
    input                       sink1_endofpacket,
    output                      sink1_ready,

    input                       sink2_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    input [87-1   : 0]  sink2_data,
    input [6-1: 0]  sink2_channel,
=======
    input [107-1   : 0]  sink2_data,
    input [9-1: 0]  sink2_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    input                       sink2_startofpacket,
    input                       sink2_endofpacket,
    output                      sink2_ready,

    input                       sink3_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    input [87-1   : 0]  sink3_data,
    input [6-1: 0]  sink3_channel,
=======
    input [107-1   : 0]  sink3_data,
    input [9-1: 0]  sink3_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    input                       sink3_startofpacket,
    input                       sink3_endofpacket,
    output                      sink3_ready,

    input                       sink4_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    input [87-1   : 0]  sink4_data,
    input [6-1: 0]  sink4_channel,
=======
    input [107-1   : 0]  sink4_data,
    input [9-1: 0]  sink4_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    input                       sink4_startofpacket,
    input                       sink4_endofpacket,
    output                      sink4_ready,

    input                       sink5_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    input [87-1   : 0]  sink5_data,
    input [6-1: 0]  sink5_channel,
=======
    input [107-1   : 0]  sink5_data,
    input [9-1: 0]  sink5_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    input                       sink5_startofpacket,
    input                       sink5_endofpacket,
    output                      sink5_ready,

<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
=======
    input                       sink6_valid,
    input [107-1   : 0]  sink6_data,
    input [9-1: 0]  sink6_channel,
    input                       sink6_startofpacket,
    input                       sink6_endofpacket,
    output                      sink6_ready,

    input                       sink7_valid,
    input [107-1   : 0]  sink7_data,
    input [9-1: 0]  sink7_channel,
    input                       sink7_startofpacket,
    input                       sink7_endofpacket,
    output                      sink7_ready,

>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    // ----------------------
    // Source
    // ----------------------
    output                      src_valid,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    output [87-1    : 0] src_data,
    output [6-1 : 0] src_channel,
=======
    output [107-1    : 0] src_data,
    output [9-1 : 0] src_channel,
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    output                      src_startofpacket,
    output                      src_endofpacket,
    input                       src_ready,

    // ----------------------
    // Clock & Reset
    // ----------------------
    input clk,
    input reset
);
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    localparam PAYLOAD_W        = 87 + 6 + 2;
    localparam NUM_INPUTS       = 6;
    localparam SHARE_COUNTER_W  = 1;
    localparam PIPELINE_ARB     = 0;
    localparam ST_DATA_W        = 87;
    localparam ST_CHANNEL_W     = 6;
    localparam PKT_TRANS_LOCK   = 72;
=======
    localparam PAYLOAD_W        = 107 + 9 + 2;
    localparam NUM_INPUTS       = 8;
    localparam SHARE_COUNTER_W  = 1;
    localparam PIPELINE_ARB     = 0;
    localparam ST_DATA_W        = 107;
    localparam ST_CHANNEL_W     = 9;
    localparam PKT_TRANS_LOCK   = 69;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    // ------------------------------------------
    // Signals
    // ------------------------------------------
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    wire [NUM_INPUTS - 1 : 0] request;
    wire [NUM_INPUTS - 1 : 0] valid;
    wire [NUM_INPUTS - 1 : 0] grant;
    wire [NUM_INPUTS - 1 : 0] next_grant;
    reg  [NUM_INPUTS - 1 : 0] saved_grant;
    reg  [PAYLOAD_W - 1 : 0]  src_payload;
    wire                      last_cycle;
    reg                       packet_in_progress;
    reg                       update_grant;

    wire [PAYLOAD_W - 1 : 0]  sink0_payload;
    wire [PAYLOAD_W - 1 : 0]  sink1_payload;
    wire [PAYLOAD_W - 1 : 0]  sink2_payload;
    wire [PAYLOAD_W - 1 : 0]  sink3_payload;
    wire [PAYLOAD_W - 1 : 0]  sink4_payload;
    wire [PAYLOAD_W - 1 : 0]  sink5_payload;
=======
    wire [NUM_INPUTS - 1 : 0]      request;
    wire [NUM_INPUTS - 1 : 0]      valid;
    wire [NUM_INPUTS - 1 : 0]      grant;
    wire [NUM_INPUTS - 1 : 0]      next_grant;
    reg [NUM_INPUTS - 1 : 0]       saved_grant;
    reg [PAYLOAD_W - 1 : 0]        src_payload;
    wire                           last_cycle;
    reg                            packet_in_progress;
    reg                            update_grant;

    wire [PAYLOAD_W - 1 : 0] sink0_payload;
    wire [PAYLOAD_W - 1 : 0] sink1_payload;
    wire [PAYLOAD_W - 1 : 0] sink2_payload;
    wire [PAYLOAD_W - 1 : 0] sink3_payload;
    wire [PAYLOAD_W - 1 : 0] sink4_payload;
    wire [PAYLOAD_W - 1 : 0] sink5_payload;
    wire [PAYLOAD_W - 1 : 0] sink6_payload;
    wire [PAYLOAD_W - 1 : 0] sink7_payload;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    assign valid[0] = sink0_valid;
    assign valid[1] = sink1_valid;
    assign valid[2] = sink2_valid;
    assign valid[3] = sink3_valid;
    assign valid[4] = sink4_valid;
    assign valid[5] = sink5_valid;
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
=======
    assign valid[6] = sink6_valid;
    assign valid[7] = sink7_valid;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv


    // ------------------------------------------
    // ------------------------------------------
    // Grant Logic & Updates
    // ------------------------------------------
    // ------------------------------------------
    reg [NUM_INPUTS - 1 : 0] lock;
    always @* begin
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
      lock[0] = sink0_data[72];
      lock[1] = sink1_data[72];
      lock[2] = sink2_data[72];
      lock[3] = sink3_data[72];
      lock[4] = sink4_data[72];
      lock[5] = sink5_data[72];
=======
      lock[0] = sink0_data[69];
      lock[1] = sink1_data[69];
      lock[2] = sink2_data[69];
      lock[3] = sink3_data[69];
      lock[4] = sink4_data[69];
      lock[5] = sink5_data[69];
      lock[6] = sink6_data[69];
      lock[7] = sink7_data[69];
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    end

    assign last_cycle = src_valid & src_ready & src_endofpacket & ~(|(lock & grant));

    // ------------------------------------------
    // We're working on a packet at any time valid is high, except
    // when this is the endofpacket.
    // ------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            packet_in_progress <= 1'b0;
        end
        else begin
            if (src_valid)
                packet_in_progress <= 1'b1;
            if (last_cycle)
                packet_in_progress <= 1'b0;
        end
    end


    // ------------------------------------------
    // Shares
    //
    // Special case: all-equal shares _should_ be optimized into assigning a
    // constant to next_grant_share.
    // Special case: all-1's shares _should_ result in the share counter
    // being optimized away.
    // ------------------------------------------
    // Input  |  arb shares  |  counter load value
    // 0      |      1       |  0
    // 1      |      1       |  0
    // 2      |      1       |  0
    // 3      |      1       |  0
    // 4      |      1       |  0
    // 5      |      1       |  0
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
    wire [SHARE_COUNTER_W - 1 : 0] share_0 = 1'd0;
    wire [SHARE_COUNTER_W - 1 : 0] share_1 = 1'd0;
    wire [SHARE_COUNTER_W - 1 : 0] share_2 = 1'd0;
    wire [SHARE_COUNTER_W - 1 : 0] share_3 = 1'd0;
    wire [SHARE_COUNTER_W - 1 : 0] share_4 = 1'd0;
    wire [SHARE_COUNTER_W - 1 : 0] share_5 = 1'd0;
=======
    // 6      |      1       |  0
    // 7      |      1       |  0
     wire [SHARE_COUNTER_W - 1 : 0] share_0 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_1 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_2 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_3 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_4 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_5 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_6 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_7 = 1'd0;
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    // ------------------------------------------
    // Choose the share value corresponding to the grant.
    // ------------------------------------------
    reg [SHARE_COUNTER_W - 1 : 0] next_grant_share;
    always @* begin
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
        next_grant_share =
            share_0 & { SHARE_COUNTER_W {next_grant[0]} } |
            share_1 & { SHARE_COUNTER_W {next_grant[1]} } |
            share_2 & { SHARE_COUNTER_W {next_grant[2]} } |
            share_3 & { SHARE_COUNTER_W {next_grant[3]} } |
            share_4 & { SHARE_COUNTER_W {next_grant[4]} } |
            share_5 & { SHARE_COUNTER_W {next_grant[5]} };
=======
      next_grant_share =
    share_0 & { SHARE_COUNTER_W {next_grant[0]} } |
    share_1 & { SHARE_COUNTER_W {next_grant[1]} } |
    share_2 & { SHARE_COUNTER_W {next_grant[2]} } |
    share_3 & { SHARE_COUNTER_W {next_grant[3]} } |
    share_4 & { SHARE_COUNTER_W {next_grant[4]} } |
    share_5 & { SHARE_COUNTER_W {next_grant[5]} } |
    share_6 & { SHARE_COUNTER_W {next_grant[6]} } |
    share_7 & { SHARE_COUNTER_W {next_grant[7]} };
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    end

    // ------------------------------------------
    // Flag to indicate first packet of an arb sequence.
    // ------------------------------------------
    wire grant_changed = ~packet_in_progress && !(saved_grant & valid);
    reg first_packet_r;
    wire first_packet = grant_changed | first_packet_r;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            first_packet_r <= 1'b0;
        end
        else begin 
            if (update_grant)
                first_packet_r <= 1'b1;
            else if (last_cycle)
                first_packet_r <= 1'b0;
            else if (grant_changed)
                first_packet_r <= 1'b1;
        end
    end

    // ------------------------------------------
    // Compute the next share-count value.
    // ------------------------------------------
    reg [SHARE_COUNTER_W - 1 : 0] p1_share_count;
    reg [SHARE_COUNTER_W - 1 : 0] share_count;
    reg share_count_zero_flag;

    always @* begin
        if (first_packet) begin
            p1_share_count = next_grant_share;
        end
        else begin
            // Update the counter, but don't decrement below 0.
            p1_share_count = share_count_zero_flag ? '0 : share_count - 1'b1;
        end
    end

    // ------------------------------------------
    // Update the share counter and share-counter=zero flag.
    // ------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            share_count <= '0;
            share_count_zero_flag <= 1'b1;
        end
        else begin
            if (last_cycle) begin
                share_count <= p1_share_count;
                share_count_zero_flag <= (p1_share_count == '0);
            end
        end
    end

    // ------------------------------------------
    // For each input, maintain a final_packet signal which goes active for the
    // last packet of a full-share packet sequence.  Example: if I have 4
    // shares and I'm continuously requesting, final_packet is active in the
    // 4th packet.
    // ------------------------------------------
    wire final_packet_0 = 1'b1;

    wire final_packet_1 = 1'b1;

    wire final_packet_2 = 1'b1;

    wire final_packet_3 = 1'b1;

    wire final_packet_4 = 1'b1;

    wire final_packet_5 = 1'b1;

<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
=======
    wire final_packet_6 = 1'b1;

    wire final_packet_7 = 1'b1;

>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    // ------------------------------------------
    // Concatenate all final_packet signals (wire or reg) into a handy vector.
    // ------------------------------------------
    wire [NUM_INPUTS - 1 : 0] final_packet = {
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
        final_packet_5,
        final_packet_4,
        final_packet_3,
        final_packet_2,
        final_packet_1,
        final_packet_0
=======
    final_packet_7,
    final_packet_6,
    final_packet_5,
    final_packet_4,
    final_packet_3,
    final_packet_2,
    final_packet_1,
    final_packet_0
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    };

    // ------------------------------------------
    // ------------------------------------------
    wire p1_done = |(final_packet & grant);

    // ------------------------------------------
    // Flag for the first cycle of packets within an 
    // arb sequence
    // ------------------------------------------
    reg first_cycle;
    always @(posedge clk, posedge reset) begin
        if (reset)
            first_cycle <= 0;
        else
            first_cycle <= last_cycle && ~p1_done;
    end


    always @* begin
        update_grant = 0;

        // ------------------------------------------
        // No arbitration pipeline, update grant whenever
        // the current arb winner has consumed all shares,
        // or all requests are low
        // ------------------------------------------
        update_grant = (last_cycle && p1_done) || (first_cycle && !valid);
        update_grant = last_cycle;
    end

    wire save_grant;
    assign save_grant = 1;
    assign grant      = next_grant;

    always @(posedge clk, posedge reset) begin
        if (reset)
            saved_grant <= '0;
        else if (save_grant)
            saved_grant <= next_grant;
    end

    // ------------------------------------------
    // ------------------------------------------
    // Arbitrator
    // ------------------------------------------
    // ------------------------------------------

    // ------------------------------------------
    // Create a request vector that stays high during
    // the packet
    // ------------------------------------------
    assign request = valid;


    altera_merlin_arbitrator
    #(
        .NUM_REQUESTERS(NUM_INPUTS),
        .SCHEME        ("no-arb"),
        .PIPELINE      (0)
    ) arb (
        .clk                    (clk),
        .reset                  (reset),
        .request                (request),
        .grant                  (next_grant),
        .save_top_priority      (src_valid),
        .increment_top_priority (update_grant)
    );

    // ------------------------------------------
    // ------------------------------------------
    // Mux
    //
    // Implemented as a sum of products.
    // ------------------------------------------
    // ------------------------------------------

    assign sink0_ready = src_ready && grant[0];
    assign sink1_ready = src_ready && grant[1];
    assign sink2_ready = src_ready && grant[2];
    assign sink3_ready = src_ready && grant[3];
    assign sink4_ready = src_ready && grant[4];
    assign sink5_ready = src_ready && grant[5];
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
=======
    assign sink6_ready = src_ready && grant[6];
    assign sink7_ready = src_ready && grant[7];
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    assign src_valid = |(grant & valid);

    always @* begin
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
        src_payload =
            sink0_payload & {PAYLOAD_W {grant[0]} } |
            sink1_payload & {PAYLOAD_W {grant[1]} } |
            sink2_payload & {PAYLOAD_W {grant[2]} } |
            sink3_payload & {PAYLOAD_W {grant[3]} } |
            sink4_payload & {PAYLOAD_W {grant[4]} } |
            sink5_payload & {PAYLOAD_W {grant[5]} };
=======
      src_payload =
      sink0_payload & {PAYLOAD_W {grant[0]} } |
      sink1_payload & {PAYLOAD_W {grant[1]} } |
      sink2_payload & {PAYLOAD_W {grant[2]} } |
      sink3_payload & {PAYLOAD_W {grant[3]} } |
      sink4_payload & {PAYLOAD_W {grant[4]} } |
      sink5_payload & {PAYLOAD_W {grant[5]} } |
      sink6_payload & {PAYLOAD_W {grant[6]} } |
      sink7_payload & {PAYLOAD_W {grant[7]} };
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv
    end

    // ------------------------------------------
    // Mux Payload Mapping
    // ------------------------------------------

    assign sink0_payload = {sink0_channel,sink0_data,
        sink0_startofpacket,sink0_endofpacket};
    assign sink1_payload = {sink1_channel,sink1_data,
        sink1_startofpacket,sink1_endofpacket};
    assign sink2_payload = {sink2_channel,sink2_data,
        sink2_startofpacket,sink2_endofpacket};
    assign sink3_payload = {sink3_channel,sink3_data,
        sink3_startofpacket,sink3_endofpacket};
    assign sink4_payload = {sink4_channel,sink4_data,
        sink4_startofpacket,sink4_endofpacket};
    assign sink5_payload = {sink5_channel,sink5_data,
<<<<<<< HEAD:FinalProject/verilog/Video_System/synthesis/submodules/Video_System_rsp_xbar_mux_001.sv
        sink5_startofpacket,sink5_endofpacket};
=======
    sink5_startofpacket,sink5_endofpacket};
    assign sink6_payload = {sink6_channel,sink6_data,
    sink6_startofpacket,sink6_endofpacket};
    assign sink7_payload = {sink7_channel,sink7_data,
    sink7_startofpacket,sink7_endofpacket};
>>>>>>> origin/master:FinalProject/nios_system/synthesis/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv

    assign {src_channel,src_data,src_startofpacket,src_endofpacket} = src_payload;

endmodule



