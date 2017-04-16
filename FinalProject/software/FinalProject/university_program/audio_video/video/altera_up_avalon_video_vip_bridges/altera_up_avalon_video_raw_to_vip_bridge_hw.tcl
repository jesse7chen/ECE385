# +----------------------------------------------------------------------------+
# |                                                                            |
# | Any megafunction design, and related net list (encrypted or decrypted),    |
# |  support information, device programming or simulation file, and any other |
# |  associated documentation or information provided by Altera or a partner   |
# |  under Altera's Megafunction Partnership Program may be used only to       |
# |  program PLD devices (but not masked PLD devices) from Altera.  Any other  |
# |  use of such megafunction design, net list, support information, device    |
# |  programming or simulation file, or any other related documentation or     |
# |  information is prohibited for any other purpose, including, but not       |
# |  limited to modification, reverse engineering, de-compiling, or use with   |
# |  any other silicon devices, unless such use is explicitly licensed under   |
# |  a separate agreement with Altera or a megafunction partner.  Title to     |
# |  the intellectual property, including patents, copyrights, trademarks,     |
# |  trade secrets, or maskworks, embodied in any such megafunction design,    |
# |  net list, support information, device programming or simulation file, or  |
# |  any other related documentation or information provided by Altera or a    |
# |  megafunction partner, remains with Altera, the megafunction partner, or   |
# |  their respective licensors.  No other licenses, including any licenses    |
# |  needed under any third party's intellectual property, are provided herein.|
# |  Copying or modifying any file, or portion thereof, to which this notice   |
# |  is attached violates this copyright.                                      |
# |                                                                            |
# | THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    |
# | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   |
# | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    |
# | THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER |
# | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    |
# | FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  |
# | IN THIS FILE.                                                              |
# |                                                                            |
# | This agreement shall be governed in all respects by the laws of the State  |
# |  of California and by the laws of the United States of America.            |
# |                                                                            |
# +----------------------------------------------------------------------------+

# TCL File Generated by Altera University Program
# DO NOT MODIFY

set aup_version 15.0

source "../../../lib/aup_ip_generator.tcl"

# +-----------------------------------
# | module altera_up_avalon_video_raw_to_vip_bridge
# | 
set_module_property DESCRIPTION "VIP Bridge: RAW to VIP"
set_module_property NAME altera_up_avalon_video_bridge_raw_to_vip_bridge
set_module_property VERSION $aup_version
set_module_property GROUP "University Program/Audio & Video/Video"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME "VIP Bridge: RAW to VIP"
set_module_property DATASHEET_URL "[pwd]/../doc/Video.pdf"
#set_module_property TOP_LEVEL_HDL_FILE altera_up_avalon_video_raw_to_vip.v
#set_module_property TOP_LEVEL_HDL_MODULE altera_up_avalon_video_raw_to_vip
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property HIDE_FROM_QUARTUS true
set_module_property EDITABLE false
set_module_property ANALYZE_HDL false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property GENERATION_CALLBACK generate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
#add_file altera_up_avalon_video_raw_to_vip.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter width positive "640"
set_parameter_property width DISPLAY_NAME "Width (# of pixels)"
set_parameter_property width GROUP "Frame Resolution"
set_parameter_property width UNITS None
set_parameter_property width AFFECTS_ELABORATION true
set_parameter_property width AFFECTS_GENERATION true
set_parameter_property width VISIBLE true
set_parameter_property width ENABLED true

add_parameter height positive "480"
set_parameter_property height DISPLAY_NAME "Height (# of lines)"
set_parameter_property height GROUP "Frame Resolution"
set_parameter_property height UNITS None
set_parameter_property height AFFECTS_ELABORATION true
set_parameter_property height AFFECTS_GENERATION true
set_parameter_property height VISIBLE true
set_parameter_property height ENABLED true

add_parameter color_bits positive "8"
set_parameter_property color_bits DISPLAY_NAME "Color Bits"
set_parameter_property color_bits GROUP "Pixel Format"
set_parameter_property color_bits UNITS None
set_parameter_property color_bits AFFECTS_ELABORATION true
set_parameter_property color_bits AFFECTS_GENERATION true
#set_parameter_property color_bits ALLOWED_RANGES 8
set_parameter_property color_bits VISIBLE true
set_parameter_property color_bits ENABLED true

add_parameter color_planes positive "3"
set_parameter_property color_planes DISPLAY_NAME "Color Planes"
set_parameter_property color_planes GROUP "Pixel Format"
set_parameter_property color_planes UNITS None
set_parameter_property color_planes AFFECTS_ELABORATION true
set_parameter_property color_planes AFFECTS_GENERATION true
set_parameter_property color_planes ALLOWED_RANGES {1 2 3 4}
set_parameter_property color_planes VISIBLE true
set_parameter_property color_planes ENABLED true

add_parameter frame_type string "Progressive"
set_parameter_property frame_type DISPLAY_NAME "Mode"
set_parameter_property frame_type GROUP "Interlacing"
set_parameter_property frame_type UNITS None
set_parameter_property frame_type AFFECTS_ELABORATION true
set_parameter_property frame_type AFFECTS_GENERATION true
set_parameter_property frame_type ALLOWED_RANGES {"Progressive" "Interlaced (odd first)" "Interlaced (even first)"}
set_parameter_property frame_type VISIBLE true
set_parameter_property frame_type ENABLED true
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clk
# | 
add_interface clk clock end
set_interface_property clk enabled true

add_interface_port clk clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface reset reset end
set_interface_property reset associatedClock clk
set_interface_property reset enabled true
set_interface_property reset synchronousEdges DEASSERT

add_interface_port reset reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_raw_to_vip_sink
# | 
add_interface avalon_raw_to_vip_sink avalon_streaming end 
set_interface_property avalon_raw_to_vip_sink associatedClock clk
set_interface_property avalon_raw_to_vip_sink associatedReset reset
set_interface_property avalon_raw_to_vip_sink errorDescriptor ""
set_interface_property avalon_raw_to_vip_sink maxChannel 0
set_interface_property avalon_raw_to_vip_sink readyLatency 0

add_interface_port avalon_raw_to_vip_sink raw_startofpacket startofpacket Input 1
add_interface_port avalon_raw_to_vip_sink raw_endofpacket endofpacket Input 1
add_interface_port avalon_raw_to_vip_sink raw_valid valid Input 1
add_interface_port avalon_raw_to_vip_sink raw_ready ready Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_raw_to_vip_source
# | 
add_interface avalon_raw_to_vip_source avalon_streaming start 
set_interface_property avalon_raw_to_vip_source associatedClock clk
set_interface_property avalon_raw_to_vip_source associatedReset reset
set_interface_property avalon_raw_to_vip_source errorDescriptor ""
set_interface_property avalon_raw_to_vip_source maxChannel 0
set_interface_property avalon_raw_to_vip_source readyLatency 0

add_interface_port avalon_raw_to_vip_source vip_ready ready Input 1
add_interface_port avalon_raw_to_vip_source vip_startofpacket startofpacket Output 1
add_interface_port avalon_raw_to_vip_source vip_endofpacket endofpacket Output 1
add_interface_port avalon_raw_to_vip_source vip_valid valid Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | Elaboration function
# | 
proc elaborate {} {
	set width			[ get_parameter_value "width" ]
	set height			[ get_parameter_value "height" ]
	set color_bits		[ get_parameter_value "color_bits" ]
	set color_planes	[ get_parameter_value "color_planes" ]
	set frame_type		[ get_parameter_value "frame_type" ]

	set dw [ expr $color_bits * $color_planes ]

	if { ($color_planes == 4) || ($color_planes == 3) } {
		set ew 2
	} else {
		set ew 1
	}

	# +-----------------------------------
	# | connection point avalon_raw_to_vip_sink
	# | 
	set_interface_property avalon_raw_to_vip_sink dataBitsPerSymbol $color_bits
	set_interface_property avalon_raw_to_vip_sink symbolsPerBeat $color_planes
	
	add_interface_port avalon_raw_to_vip_sink raw_data data Input $dw
#	add_interface_port avalon_raw_to_vip_sink raw_empty empty Input $ew
	# | 
	# +-----------------------------------

	# +-----------------------------------
	# | connection point avalon_raw_to_vip_source
	# | 
	set_interface_property avalon_raw_to_vip_source dataBitsPerSymbol $color_bits
	set_interface_property avalon_raw_to_vip_source symbolsPerBeat $color_planes

	add_interface_port avalon_raw_to_vip_source vip_data data Output $dw
#	add_interface_port avalon_raw_to_vip_source vip_empty empty Output $ew
	# | 
	# +-----------------------------------
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Generation function
# | 
proc generate {} {
	send_message info "Starting Generation of RAW to VIP Bridge"

	# get parameter values
	set width			[ get_parameter_value "width" ]
	set height			[ get_parameter_value "height" ]
	set color_bits		[ get_parameter_value "color_bits" ]
	set color_planes	[ get_parameter_value "color_planes" ]
	set frame_type		[ get_parameter_value "frame_type" ]

	# get parameter values
	set dw	[ format "DW:%d" [ expr (($color_bits * $color_planes) - 1) ] ]
	if { ($color_planes == 4) || ($color_planes == 3) } {
		set ew "EW:1"
	} else {
		set ew "EW:0"
	}
	
	set ctrl_0	[ format "CTRL_PACKET_0:%d'hF" $color_bits ]
	set ctrl_1	[ format "CTRL_PACKET_1:%d'd%.0f" $color_bits [ expr ($width / (16 * 16 * 16) ) ] ]
	set ctrl_2	[ format "CTRL_PACKET_2:%d'd%.0f" $color_bits [ expr ($width / (16 * 16)) % 16 ] ]
	set ctrl_3	[ format "CTRL_PACKET_3:%d'd%.0f" $color_bits [ expr ($width / (16) % 16) ] ]
	set ctrl_4	[ format "CTRL_PACKET_4:%d'd%.0f" $color_bits [ expr ($width % 16) ] ]
	set ctrl_5	[ format "CTRL_PACKET_5:%d'd%.0f" $color_bits [ expr ($height / (16 * 16 * 16) ) ] ]
	set ctrl_6	[ format "CTRL_PACKET_6:%d'd%.0f" $color_bits [ expr ($height / (16 * 16)) % 16 ] ]
	set ctrl_7	[ format "CTRL_PACKET_7:%d'd%.0f" $color_bits [ expr ($height / (16) % 16) ] ]
	set ctrl_8	[ format "CTRL_PACKET_8:%d'd%.0f" $color_bits [ expr ($height % 16) ] ]
	set ctrl_9	[ format "CTRL_PACKET_9:%d'b0000" $color_bits ]
	if { $frame_type == "Interlaced (odd first)" } {
		set ctrl_9	[ format "CTRL_PACKET_9:%d'b1000" $color_bits ]
	} elseif { $frame_type == "Interlaced (even first)" } {
		set ctrl_9	[ format "CTRL_PACKET_9:%d'b1100" $color_bits ]
	}

	# set section values
	set use_1_symbol  "USE_1_SYMBOL_PER_BEAT:0"
	set use_2_symbols "USE_2_SYMBOLS_PER_BEAT:0"
	set use_3_symbols "USE_3_SYMBOLS_PER_BEAT:0"
	if { ($color_planes == 1) } {
		set use_1_symbol  "USE_1_SYMBOL_PER_BEAT:1"
	} elseif { ($color_planes == 2) } {
		set use_2_symbols "USE_2_SYMBOLS_PER_BEAT:1"
	} elseif { ($color_planes == 3) } {
		set use_3_symbols "USE_3_SYMBOLS_PER_BEAT:1"
	}

	# set arguments
	set params "$dw;$ew;$ctrl_0;$ctrl_1;$ctrl_2;$ctrl_3;$ctrl_4;$ctrl_5;$ctrl_6;$ctrl_7;$ctrl_8;$ctrl_9"
	set sections "$use_1_symbol;$use_2_symbols;$use_3_symbols"

	# get generation settings
#	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	
	add_file "$dest_dir$dest_name.v" {SYNTHESIS SIMULATION}

	# Generate HDL
	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_video_raw_to_vip_bridge.v" "altera_up_avalon_video_raw_to_vip_bridge" $dest_name $params $sections
}
# | 
# +-----------------------------------

