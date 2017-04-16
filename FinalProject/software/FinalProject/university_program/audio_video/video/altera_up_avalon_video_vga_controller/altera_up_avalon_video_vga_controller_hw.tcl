# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


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

source "../../../lib/aup_version.tcl"
source "../../../lib/aup_ip_generator.tcl"

# +-----------------------------------
# | module altera_up_avalon_video_vga_controller
# | 
set_module_property DESCRIPTION "VGA controller for DE-series Boards"
set_module_property NAME altera_up_avalon_video_vga_controller
set_module_property VERSION $aup_version
set_module_property GROUP "University Program/Audio & Video/Video"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME "VGA Controller"
set_module_property DATASHEET_URL "[pwd]/../doc/Video.pdf"
#set_module_property TOP_LEVEL_HDL_FILE altera_up_avalon_video_vga_controller.v
#set_module_property TOP_LEVEL_HDL_MODULE altera_up_avalon_video_vga_controller
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property HIDE_FROM_QUARTUS true
set_module_property EDITABLE false
set_module_property ANALYZE_HDL false
set_module_property VALIDATION_CALLBACK validate
set_module_property ELABORATION_CALLBACK elaborate
set_module_property GENERATION_CALLBACK generate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
#add_file altera_up_avalon_video_vga_controller.v {SYNTHESIS SIMULATION}
add_file "hdl/altera_up_avalon_video_vga_timing.v" {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter board string DE1-SoC
set_parameter_property board DISPLAY_NAME "DE-Series Board"
set_parameter_property board GROUP "Device and Mode"
set_parameter_property board UNITS None
set_parameter_property board AFFECTS_ELABORATION true
set_parameter_property board AFFECTS_GENERATION true
set_parameter_property board ALLOWED_RANGES {DE1-SoC "DE2-115" "DE2i-150"}
set_parameter_property board VISIBLE true
set_parameter_property board ENABLED true

add_parameter device string "VGA Connector"
set_parameter_property device DISPLAY_NAME "Video Out Device"
set_parameter_property device GROUP "Device and Mode"
set_parameter_property device UNITS None
set_parameter_property device AFFECTS_ELABORATION true
set_parameter_property device AFFECTS_GENERATION true
#set_parameter_property device ALLOWED_RANGES {"VGA Connector" "LCD Screen (TRDB_LCM)" "LCD with touchscreen (TRDB_LTM)"}
#set_parameter_property device ALLOWED_RANGES {"VGA Connector" "LCD with touchscreen (TRDB_LTM)" "8\" LCD on TPad/VEEK" "7\" LCD on VEEK-MT"}
set_parameter_property device ALLOWED_RANGES {"VGA Connector" "4.3\" LCD (TRDB_LTM)" "8\" LCD on TPad/VEEK" "7\" LCD on VEEK-MT and MTL Module"}
set_parameter_property device VISIBLE true
set_parameter_property device ENABLED true

add_parameter resolution string "VGA 640x480"
set_parameter_property resolution DISPLAY_NAME "VGA Resolution"
set_parameter_property resolution GROUP "Device and Mode"
set_parameter_property resolution UNITS None
set_parameter_property resolution AFFECTS_ELABORATION true
set_parameter_property resolution AFFECTS_GENERATION true
set_parameter_property resolution ALLOWED_RANGES {"VGA 640x480" "SVGA 800x600" "XGA 1024x768" "WXGA 1280x800" "SXGA 1280x1024" "WSXGA 1680x1050" "SDTV 720x480" "HDTV 1280x720"}
set_parameter_property resolution VISIBLE true
set_parameter_property resolution ENABLED true

add_parameter underflow_flag boolean false
set_parameter_property underflow_flag DISPLAY_NAME "Include Underflow Flag"
set_parameter_property underflow_flag GROUP "Device and Mode"
set_parameter_property underflow_flag UNITS None
set_parameter_property underflow_flag AFFECTS_ELABORATION true
set_parameter_property underflow_flag AFFECTS_GENERATION true
set_parameter_property underflow_flag VISIBLE false
set_parameter_property underflow_flag ENABLED true
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
# | connection point avalon_vga_sink
# | 
add_interface avalon_vga_sink avalon_streaming end 
set_interface_property avalon_vga_sink associatedClock clk
set_interface_property avalon_vga_sink associatedReset reset
set_interface_property avalon_vga_sink dataBitsPerSymbol 10
set_interface_property avalon_vga_sink errorDescriptor ""
set_interface_property avalon_vga_sink maxChannel 0
set_interface_property avalon_vga_sink readyLatency 0
set_interface_property avalon_vga_sink symbolsPerBeat 3


add_interface_port avalon_vga_sink data data Input 30
add_interface_port avalon_vga_sink startofpacket startofpacket Input 1
add_interface_port avalon_vga_sink endofpacket endofpacket Input 1
#add_interface_port avalon_vga_sink empty empty Input 2
add_interface_port avalon_vga_sink valid valid Input 1
add_interface_port avalon_vga_sink ready ready Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point external_interface
# | 
add_interface external_interface conduit end 

add_interface_port external_interface VGA_CLK export Output 1
add_interface_port external_interface VGA_HS export Output 1
add_interface_port external_interface VGA_VS export Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | Validation function
# | 
proc validate {} {
	set board		[ get_parameter_value "board" ]
	set device		[ get_parameter_value "device" ]
	set resolution	[ get_parameter_value "resolution" ]
	
	set_parameter_property resolution ENABLED false

	if { $device == "LCD Screen (TRDB_LCM)" } {
		send_message info "Video Output Stream: Format: 320 x 240 with Color: 10 (bits) x 3 (planes) converted to 8 (bits) per color plane"
	} elseif { $device == "4.3\" LCD (TRDB_LTM)" } {
		send_message info "Video Output Stream: Format: 800 x 480 with Color: 10 (bits) x 3 (planes) converted to 8 (bits) per color plane"
	} elseif { $device == "8\" LCD on TPad/VEEK" } {
		send_message info "Video Output Stream: Format: 800 x 600 with Color: 10 (bits) x 3 (planes) converted to 6 (bits) per color plane"
	} elseif { $device == "7\" LCD on VEEK-MT and MTL Module" } {
		send_message info "Video Output Stream: Format: 800 x 480 with Color: 10 (bits) x 3 (planes) converted to 8 (bits) per color plane"
	} else {
		set_parameter_property resolution ENABLED true
		set converted_to_msg ""
		if { ($board == "DE1-SoC") || ($board == "DE2-115") || ($board == "DE2i-150") } {
			set converted_to_msg " converted to 8 (bits) per color plane"
		}
		set resolution_msg "640 x 480"
		if { $resolution == "SVGA 800x600" } {
			set resolution_msg "800 x 600"
		} elseif { $resolution == "XGA 1024x768" } {
			set resolution_msg "1024 x 768"
		} elseif { $resolution == "WXGA 1280x800" } {
			set resolution_msg "1280 x 800"
		} elseif { $resolution == "SXGA 1280x1024" } {
			set resolution_msg "1280 x 1024"
		} elseif { $resolution == "WSXGA 1680x1050" } {
			set resolution_msg "1680 x 1050"
		} elseif { $resolution == "SDTV 720x480" } {
			set resolution_msg "720 x 480"
		} elseif { $resolution == "HDTV 1280x720" } {
			set resolution_msg "1280 x 720"
		}
		send_message info "Video Output Stream: Format: $resolution_msg with Color: 10 (bits) x 3 (planes)$converted_to_msg"
	}
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Elaboration function
# | 
proc elaborate {} {
	set board			[ get_parameter_value "board" ]
	set device			[ get_parameter_value "device" ]
	set resolution		[ get_parameter_value "resolution" ]
	set underflow_flag	[ get_parameter_value "underflow_flag" ]

	# +-----------------------------------
	# | Check that the input clock is the correct frequency for the output resolution
	# | 
#	set clk_freq		27.7
#	set clk_freq		[ expr [ get_interface_property "clk" "clockRate" ] / 1000000.0 ]
	set clk_freq		[ expr {round([ expr [ get_interface_property "clk" "clockRate" ] / 10000.0 ])} / 100.0 ]
	set required_freq	25.0
	if { $device == "8\" LCD on TPad/VEEK" } {
		set required_freq	40.0
	} elseif { $device == "7\" LCD on VEEK-MT and MTL Module" } {
		set required_freq	33.0
	} elseif { $resolution == "SVGA 800x600" } {
		set required_freq	40.0
	} elseif { $resolution == "XGA 1024x768" } {
		set required_freq	65.0
	} elseif { $resolution == "WXGA 1280x800" } {
		set required_freq	83.46
	} elseif { $resolution == "SXGA 1280x1024" } {
		set required_freq	108.0
	} elseif { $resolution == "WSXGA 1680x1050" } {
		set required_freq	147.14
	} elseif { $resolution == "SDTV 720x480" } {
		set required_freq	27.7
	} elseif { $resolution == "HDTV 1280x720" } {
		set required_freq	74.2
	}
	
	# Clock is not connected
	if { $clk_freq == -0.000001 } {
		send_message warning "Please connect a clock which has a frequency of $required_freq MHz."

	# Clock is connected but unknown
	} elseif { $clk_freq == 0 } {
		send_message warning "Unable to verify clock frequency. Make sure the VGA clock has a frequency of $required_freq MHz."
		
	# Clock is connected and known but has the wrong frequency
	} elseif { ($clk_freq < ($required_freq - 2)) || ($clk_freq > ($required_freq + 2)) } {
		send_message error "VGA requires a clock frequency of $required_freq MHz but is connected to a clock with a frequency of $clk_freq MHz."
	}
	# | 
	# +-----------------------------------

	if { $device == "LCD Screen (TRDB_LCM)" } {
		add_interface_port external_interface VGA_BLANK export Output 1
		add_interface_port external_interface VGA_SYNC export Output 1
		add_interface_port external_interface VGA_COLOR export Output 10
	} elseif { $device == "4.3\" LCD (TRDB_LTM)" } {
		add_interface_port external_interface VGA_BLANK export Output 1
		add_interface_port external_interface VGA_SYNC export Output 1
		add_interface_port external_interface VGA_DATA_EN export Output 1
		add_interface_port external_interface VGA_R export Output 8
		add_interface_port external_interface VGA_G export Output 8
		add_interface_port external_interface VGA_B export Output 8
	} elseif { $device == "8\" LCD on TPad/VEEK" } {
#		add_interface_port external_interface VGA_BLANK export Output 1
#		add_interface_port external_interface VGA_SYNC export Output 1
		add_interface_port external_interface VGA_DATA_EN export Output 1
		add_interface_port external_interface VGA_R export Output 6
		add_interface_port external_interface VGA_G export Output 6
		add_interface_port external_interface VGA_B export Output 6
	} elseif { $device == "7\" LCD on VEEK-MT and MTL Module" } {
#		add_interface_port external_interface VGA_BLANK export Output 1
#		add_interface_port external_interface VGA_SYNC export Output 1
		add_interface_port external_interface VGA_DATA_EN export Output 1
		add_interface_port external_interface VGA_R export Output 8
		add_interface_port external_interface VGA_G export Output 8
		add_interface_port external_interface VGA_B export Output 8
	} else {
		if { ($board == "DE1-SoC") || ($board == "DE2-115") || ($board == "DE2i-150") } {
			add_interface_port external_interface VGA_BLANK export Output 1
			add_interface_port external_interface VGA_SYNC export Output 1
			add_interface_port external_interface VGA_R export Output 8
			add_interface_port external_interface VGA_G export Output 8
			add_interface_port external_interface VGA_B export Output 8
		} else {
			add_interface_port external_interface VGA_BLANK export Output 1
			add_interface_port external_interface VGA_SYNC export Output 1
			add_interface_port external_interface VGA_R export Output 10
			add_interface_port external_interface VGA_G export Output 10
			add_interface_port external_interface VGA_B export Output 10
		}
	}

	if { $underflow_flag } {
		add_interface_port external_interface underflow_flag export Output 1
	}	
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Generation function
# | 
proc generate {} {
	send_message info "Starting Generation of VGA Controller"

	# get parameter values
	set board			[ get_parameter_value "board" ]
	set device			[ get_parameter_value "device" ]
	set resolution		[ get_parameter_value "resolution" ]
	set underflow_flag	[ get_parameter_value "underflow_flag" ]

	set dw "DW:29"
	if { $device == "LCD Screen (TRDB_LCM)" } {
		set colour_bits "CW:7"

		set R_UI "R_UI:29"
		set R_LI "R_LI:22"
		set G_UI "G_UI:19"
		set G_LI "G_LI:12"
		set B_UI "B_UI:9"
		set B_LI "B_LI:2"
	} elseif { $device == "4.3\" LCD (TRDB_LTM)" } {
		set colour_bits "CW:7"

		set R_UI "R_UI:29"
		set R_LI "R_LI:22"
		set G_UI "G_UI:19"
		set G_LI "G_LI:12"
		set B_UI "B_UI:9"
		set B_LI "B_LI:2"
	} elseif { $device == "8\" LCD on TPad/VEEK" } {
		set colour_bits "CW:5"

		set R_UI "R_UI:29"
		set R_LI "R_LI:24"
		set G_UI "G_UI:19"
		set G_LI "G_LI:14"
		set B_UI "B_UI:9"
		set B_LI "B_LI:4"
	} elseif { $device == "7\" LCD on VEEK-MT and MTL Module" } {
		set colour_bits "CW:7"

		set R_UI "R_UI:29"
		set R_LI "R_LI:22"
		set G_UI "G_UI:19"
		set G_LI "G_LI:12"
		set B_UI "B_UI:9"
		set B_LI "B_LI:2"
	} else {
		if { ($board == "DE1-SoC") || ($board == "DE2-115") || ($board == "DE2i-150") } {
			set colour_bits "CW:7"
			
			set R_UI "R_UI:29"
			set R_LI "R_LI:22"
			set G_UI "G_UI:19"
			set G_LI "G_LI:12"
			set B_UI "B_UI:9"
			set B_LI "B_LI:2"
		} else {
			set colour_bits "CW:9"

			set R_UI "R_UI:29"
			set R_LI "R_LI:20"
			set G_UI "G_UI:19"
			set G_LI "G_LI:10"
			set B_UI "B_UI:9"
			set B_LI "B_LI:0"
		}
	}

	# set section values
	set use_lcd_screen			[ format "USE_TRDB_LCM:%d" [ string match "LCD Screen (TRDB_LCM)" $device ] ]
	set use_ltm_screen			[ format "USE_TRDB_LTM:%d" [ string match "4.3\" LCD (TRDB_LTM)" $device ] ]
	set use_tpad_screen			[ format "USE_TPAD:%d" [ string match "8\" LCD on TPad/VEEK" $device ] ]
	set use_veek_mt_screen		[ format "USE_VEEK_MT:%d" [ string match "7\" LCD on VEEK-MT and MTL Module" $device ] ]

	set use_underflow_flag		[ format "USE_UNDERFLOW_FLAG:%d" [ string match "true" $underflow_flag ] ]

	set use_vga_modes				"USE_VGA:1;USE_SVGA:0;USE_XGA:0;USE_WXGA:0;USE_SXGA:0;USE_WSXGA:0;USE_SDTV:0;USE_HDTV:0"
	if { $resolution == "SVGA 800x600" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:1;USE_XGA:0;USE_WXGA:0;USE_SXGA:0;USE_WSXGA:0;USE_SDTV:0;USE_HDTV:0"
	} elseif { $resolution == "XGA 1024x768" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:0;USE_XGA:1;USE_WXGA:0;USE_SXGA:0;USE_WSXGA:0;USE_SDTV:0;USE_HDTV:0"
	} elseif { $resolution == "WXGA 1280x800" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:0;USE_XGA:0;USE_WXGA:1;USE_SXGA:0;USE_WSXGA:0;USE_SDTV:0;USE_HDTV:0"
	} elseif { $resolution == "SXGA 1280x1024" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:0;USE_XGA:0;USE_WXGA:0;USE_SXGA:1;USE_WSXGA:0;USE_SDTV:0;USE_HDTV:0"
	} elseif { $resolution == "WSXGA 1680x1050" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:0;USE_XGA:0;USE_WXGA:0;USE_SXGA:0;USE_WSXGA:1;USE_SDTV:0;USE_HDTV:0"
	} elseif { $resolution == "SDTV 720x480" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:0;USE_XGA:0;USE_WXGA:0;USE_SXGA:0;USE_WSXGA:0;USE_SDTV:1;USE_HDTV:0"
	} elseif { $resolution == "HDTV 1280x720" } {
		set use_vga_modes			"USE_VGA:0;USE_SVGA:0;USE_XGA:0;USE_WXGA:0;USE_SXGA:0;USE_WSXGA:0;USE_SDTV:0;USE_HDTV:1"
	}
	
	# set arguments
	set params "$colour_bits;$dw;$R_UI;$R_LI;$G_UI;$G_LI;$B_UI;$B_LI"
	set sections "$use_lcd_screen;$use_ltm_screen;$use_tpad_screen;$use_veek_mt_screen;$use_underflow_flag;$use_vga_modes"

	# get generation settings
#	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	
	add_file "$dest_dir$dest_name.v" {SYNTHESIS SIMULATION}
	#add_file "$dest_dir/altera_up_avalon_video_vga_timing.v" SYNTHESIS

	# Generate HDL
	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_video_vga_controller.v" "altera_up_avalon_video_vga_controller" $dest_name $params $sections
	#file copy -force "hdl/altera_up_avalon_video_vga_timing.v" $dest_dir

	# generate top level template
	#alt_up_create_instantiation_template "$dest_dir$dest_name.inst.v" $dest_name "external_interface"
}
# | 
# +-----------------------------------

