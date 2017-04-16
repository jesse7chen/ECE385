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
# | module altera_up_avalon_video_pixel_buffer_dma
# | 
set_module_property DESCRIPTION "A DMA Controller for a Pixel Buffer for the DE-series Boards"
set_module_property NAME altera_up_avalon_video_pixel_buffer_dma
set_module_property VERSION $aup_version
set_module_property GROUP "University Program/Audio & Video/Video"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME "Pixel Buffer DMA Controller"
set_module_property DATASHEET_URL "[pwd]/../doc/Video.pdf"
#set_module_property TOP_LEVEL_HDL_FILE altera_up_avalon_video_pixel_buffer_dma.v
#set_module_property TOP_LEVEL_HDL_MODULE altera_up_avalon_video_pixel_buffer_dma
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property HIDE_FROM_QUARTUS true
set_module_property EDITABLE false
set_module_property ANALYZE_HDL false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property GENERATION_CALLBACK generate
set_module_property HIDE_FROM_SOPC true
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
#add_file altera_up_avalon_video_pixel_buffer_dma.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter addr_mode string "X-Y" 
set_parameter_property addr_mode DISPLAY_NAME "Addressing Mode"
set_parameter_property addr_mode GROUP "Addressing Parameters"
set_parameter_property addr_mode UNITS None
set_parameter_property addr_mode AFFECTS_ELABORATION true
set_parameter_property addr_mode AFFECTS_GENERATION true
set_parameter_property addr_mode ALLOWED_RANGES {"Consecutive" "X-Y"}
set_parameter_property addr_mode VISIBLE true
set_parameter_property addr_mode ENABLED true

add_parameter start_address integer 0 
set_parameter_property start_address DISPLAY_NAME "Default Buffer Start Address"
set_parameter_property start_address DISPLAY_HINT hexadecimal
set_parameter_property start_address GROUP "Addressing Parameters"
set_parameter_property start_address UNITS None
set_parameter_property start_address AFFECTS_ELABORATION true
set_parameter_property start_address AFFECTS_GENERATION true
set_parameter_property start_address VISIBLE true
set_parameter_property start_address ENABLED true

add_parameter back_start_address integer 0 
set_parameter_property back_start_address DISPLAY_NAME "Default Back Buffer Start Address"
set_parameter_property back_start_address DISPLAY_HINT hexadecimal
set_parameter_property back_start_address GROUP "Addressing Parameters"
set_parameter_property back_start_address UNITS None
set_parameter_property back_start_address AFFECTS_ELABORATION true
set_parameter_property back_start_address AFFECTS_GENERATION true
set_parameter_property back_start_address VISIBLE true
set_parameter_property back_start_address ENABLED true

add_parameter image_width integer "640" 
set_parameter_property image_width DISPLAY_NAME "Width (# of pixels)"
set_parameter_property image_width GROUP "Frame Resolution"
set_parameter_property image_width UNITS None
#set_parameter_property image_width UNITS_LABEL "pixels"
set_parameter_property image_width AFFECTS_ELABORATION true
set_parameter_property image_width AFFECTS_GENERATION true
set_parameter_property image_width ALLOWED_RANGES 4:100000
set_parameter_property image_width VISIBLE true
set_parameter_property image_width ENABLED true

add_parameter image_height integer "480"
set_parameter_property image_height DISPLAY_NAME "Height (# of lines)"
set_parameter_property image_height GROUP "Frame Resolution"
set_parameter_property image_height UNITS None
#set_parameter_property image_height UNITS_LABEL "lines"
set_parameter_property image_height AFFECTS_ELABORATION true
set_parameter_property image_height AFFECTS_GENERATION true
set_parameter_property image_height ALLOWED_RANGES 4:100000
set_parameter_property image_height VISIBLE true
set_parameter_property image_height ENABLED true

add_parameter color_space string "16-bit RGB"
set_parameter_property color_space DISPLAY_NAME "Color Space"
set_parameter_property color_space GROUP "Pixel Format"
set_parameter_property color_space UNITS None
set_parameter_property color_space AFFECTS_ELABORATION true
set_parameter_property color_space AFFECTS_GENERATION true
set_parameter_property color_space ALLOWED_RANGES {"8-bit Grayscale" "8-bit RGB" "9-bit RGB" "16-bit RGB" "24-bit RGB" "30-bit RGB" "16-bit RGBA" "32-bit RGBA" "40-bit RGBA"}
set_parameter_property color_space VISIBLE true
set_parameter_property color_space ENABLED true
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
# | connection point avalon_pixel_dma_master
# | 
add_interface avalon_pixel_dma_master avalon start 
set_interface_property avalon_pixel_dma_master associatedClock clk
set_interface_property avalon_pixel_dma_master associatedReset reset
set_interface_property avalon_pixel_dma_master burstOnBurstBoundariesOnly false
set_interface_property avalon_pixel_dma_master doStreamReads false
set_interface_property avalon_pixel_dma_master doStreamWrites false
set_interface_property avalon_pixel_dma_master linewrapBursts false

add_interface_port avalon_pixel_dma_master master_readdatavalid readdatavalid Input 1
add_interface_port avalon_pixel_dma_master master_waitrequest waitrequest Input 1
add_interface_port avalon_pixel_dma_master master_address address Output 32
add_interface_port avalon_pixel_dma_master master_arbiterlock lock Output 1
add_interface_port avalon_pixel_dma_master master_read read Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_control_slave
# | 
add_interface avalon_control_slave avalon end 
set_interface_property avalon_control_slave associatedClock clk
set_interface_property avalon_control_slave associatedReset reset
set_interface_property avalon_control_slave addressAlignment DYNAMIC
set_interface_property avalon_control_slave bridgesToMaster ""
set_interface_property avalon_control_slave burstOnBurstBoundariesOnly false
#set_interface_property avalon_control_slave explicitAddressSpan 16
set_interface_property avalon_control_slave holdTime 0
set_interface_property avalon_control_slave isBigEndian  false
set_interface_property avalon_control_slave isFlash false
set_interface_property avalon_control_slave isMemoryDevice false
set_interface_property avalon_control_slave isNonVolatileStorage false
set_interface_property avalon_control_slave linewrapBursts false
set_interface_property avalon_control_slave maximumPendingReadTransactions 0
set_interface_property avalon_control_slave minimumUninterruptedRunLength 1
set_interface_property avalon_control_slave printableDevice false
set_interface_property avalon_control_slave readLatency 1
set_interface_property avalon_control_slave readWaitTime 0
set_interface_property avalon_control_slave setupTime 0
set_interface_property avalon_control_slave timingUnits cycles
set_interface_property avalon_control_slave writeWaitTime 0

add_interface_port avalon_control_slave slave_address address Input 2
add_interface_port avalon_control_slave slave_byteenable byteenable Input 4
add_interface_port avalon_control_slave slave_read read Input 1
add_interface_port avalon_control_slave slave_write write Input 1
add_interface_port avalon_control_slave slave_writedata writedata Input 32
add_interface_port avalon_control_slave slave_readdata readdata Output 32
# |
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_pixel_source
# | 
add_interface avalon_pixel_source avalon_streaming start 
set_interface_property avalon_pixel_source associatedClock clk
set_interface_property avalon_pixel_source associatedReset reset
set_interface_property avalon_pixel_source dataBitsPerSymbol 10
set_interface_property avalon_pixel_source errorDescriptor ""
set_interface_property avalon_pixel_source maxChannel 0
set_interface_property avalon_pixel_source readyLatency 0
set_interface_property avalon_pixel_source symbolsPerBeat 3

add_interface_port avalon_pixel_source stream_ready ready Input 1
add_interface_port avalon_pixel_source stream_data data Output 30
add_interface_port avalon_pixel_source stream_startofpacket startofpacket Output 1
add_interface_port avalon_pixel_source stream_endofpacket endofpacket Output 1
#add_interface_port avalon_pixel_source stream_empty empty Output 2
add_interface_port avalon_pixel_source stream_valid valid Output 1
# | 
# +-----------------------------------
	
# +-----------------------------------
# | Elaboration function
# | 
proc elaborate {} {
	set addr_mode [ get_parameter_value "addr_mode"]
	set start_address [ get_parameter_value "start_address"]
	set back_start_address [ get_parameter_value "back_start_address"]
	set image_width [ get_parameter_value "image_width" ]
	set image_height [ get_parameter_value "image_height" ]
	set color_space [ get_parameter_value "color_space" ]

	if { $color_space == "8-bit Grayscale" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 8

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 8
		set_interface_property avalon_pixel_source symbolsPerBeat 1

		add_interface_port avalon_pixel_source stream_data data Output 8
#		add_interface_port avalon_pixel_source stream_empty empty Output 1
	} elseif { $color_space == "8-bit RGB" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 8

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 8
		set_interface_property avalon_pixel_source symbolsPerBeat 1

		add_interface_port avalon_pixel_source stream_data data Output 8
#		add_interface_port avalon_pixel_source stream_empty empty Output 1
	} elseif { $color_space == "9-bit RGB" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 16

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 3
		set_interface_property avalon_pixel_source symbolsPerBeat 3

		add_interface_port avalon_pixel_source stream_data data Output 9
#		add_interface_port avalon_pixel_source stream_empty empty Output 2
	} elseif { $color_space == "16-bit RGB" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 16

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 16
		set_interface_property avalon_pixel_source symbolsPerBeat 1

		add_interface_port avalon_pixel_source stream_data data Output 16
#		add_interface_port avalon_pixel_source stream_empty empty Output 1
	} elseif { $color_space == "24-bit RGB" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 32

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 8
		set_interface_property avalon_pixel_source symbolsPerBeat 3

		add_interface_port avalon_pixel_source stream_data data Output 24
#		add_interface_port avalon_pixel_source stream_empty empty Output 2
	} elseif { $color_space == "30-bit RGB" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 32

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 10
		set_interface_property avalon_pixel_source symbolsPerBeat 3

		add_interface_port avalon_pixel_source stream_data data Output 30
#		add_interface_port avalon_pixel_source stream_empty empty Output 2
	} elseif { $color_space == "16-bit RGBA" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 16

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 4
		set_interface_property avalon_pixel_source symbolsPerBeat 4

		add_interface_port avalon_pixel_source stream_data data Output 16
#		add_interface_port avalon_pixel_source stream_empty empty Output 2
	} elseif { $color_space == "32-bit RGBA" } {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 32

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 8
		set_interface_property avalon_pixel_source symbolsPerBeat 4

		add_interface_port avalon_pixel_source stream_data data Output 32
#		add_interface_port avalon_pixel_source stream_empty empty Output 2
	} else {
		# Change the data width property of the connection point avalon_pixel_dma_master
		add_interface_port avalon_pixel_dma_master master_readdata readdata Input 64

		# Change the properties of the connection point avalon_pixel_source
		set_interface_property avalon_pixel_source dataBitsPerSymbol 10
		set_interface_property avalon_pixel_source symbolsPerBeat 4

		add_interface_port avalon_pixel_source stream_data data Output 40
#		add_interface_port avalon_pixel_source stream_empty empty Output 2
	}
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Generation function
# | 
proc generate {} {
	send_message info "Starting Generation of VGA Pixel Buffer"

	# get parameter values
	set addr_mode [ get_parameter_value "addr_mode"]
	set start_address [ get_parameter_value "start_address"]
	set back_start_address [ get_parameter_value "back_start_address"]
	set image_width [ get_parameter_value "image_width" ]
	set image_height [ get_parameter_value "image_height" ]
	set color_space [ get_parameter_value "color_space" ]

	set start_addr "DEFAULT_BUFFER_ADDRESS:32'd$start_address"
	set back_addr "DEFAULT_BACK_BUF_ADDRESS:32'd$back_start_address"

	set addr_width	[ format "AW:%.0f" [ expr ceil ((log ($image_width * $image_height) / (log (2))) - 1.0) ] ]
	
	set ww			[ format "WW:%.0f" [ expr ceil ((log ($image_width) / (log (2))) - 1.0) ] ]
	set hw			[ format "HW:%.0f" [ expr ceil ((log ($image_height) / (log (2))) - 1.0) ] ]

	if { ($color_space == "8-bit Grayscale") || ($color_space == "8-bit RGB") } {
		set mw "MW:7"
	} elseif { ($color_space == "9-bit RGB") || ($color_space == "16-bit RGB") || ($color_space == "16-bit RGBA") } {
		set mw "MW:15"
	} elseif { ($color_space == "24-bit RGB") || ($color_space == "30-bit RGB") || ($color_space == "32-bit RGBA") } {
		set mw "MW:31"
	} else {
		set mw "MW:63"
	}
	if { $color_space == "8-bit Grayscale" } {
		set dw "DW:7"
		set ew "EW:0"
	} elseif { $color_space == "8-bit RGB" } {
		set dw "DW:7"
		set ew "EW:1"
	} elseif { $color_space == "9-bit RGB" } {
		set dw "DW:8"
		set ew "EW:1"
	} elseif { $color_space == "16-bit RGB" } {
		set dw "DW:15"
		set ew "EW:0"
	} elseif { $color_space == "24-bit RGB" } {
		set dw "DW:23"
		set ew "EW:1"
	} elseif { $color_space == "30-bit RGB" } {
		set dw "DW:29"
		set ew "EW:1"
	} elseif { $color_space == "16-bit RGBA" } {
		set dw "DW:15"
		set ew "EW:1"
	} elseif { $color_space == "32-bit RGBA" } {
		set dw "DW:31"
		set ew "EW:1"
	} else {
		set dw "DW:39"
		set ew "EW:1"
	}

	set pixels	"PIXELS:$image_width"
	set lines	"LINES:$image_height"
	
	# set section values
	set use_con_addr_mode	[ format "USE_CONSECUTIVE_ADDRESSING:%d" [ string match "Consecutive" $addr_mode ] ]

	set use_gray_color		"USE_GRAY_COLOR:0"
	set use_8bit_color		"USE_8BIT_COLOR:0"
	set use_9bit_color		"USE_9BIT_COLOR:0"
	set use_16bit_color		"USE_16BIT_COLOR:0"
	set use_24bit_color		"USE_24BIT_COLOR:0"
	set use_30bit_color		"USE_30BIT_COLOR:0"
	set use_a_16bit_color	"USE_A_16BIT_COLOR:0"
	set use_a_32bit_color	"USE_A_32BIT_COLOR:0"
	set use_a_40bit_color	"USE_A_40BIT_COLOR:0"
	set use_halfword_mode	"USE_HALFWORD_ADDRESSING_MODE:0"
	set use_word_mode		"USE_WORD_ADDRESSING_MODE:0"
	set use_doubleword_mode	"USE_DOUBLEWORD_ADDRESSING_MODE:0"
	if { $color_space == "8-bit Grayscale" } {
		set use_gray_color		"USE_GRAY_COLOR:1"
	} elseif { $color_space == "8-bit RGB" } {
		set use_8bit_color		"USE_8BIT_COLOR:1"
	} elseif { $color_space == "9-bit RGB" } {
		set use_9bit_color		"USE_9BIT_COLOR:1"
		set use_halfword_mode	"USE_HALFWORD_ADDRESSING_MODE:1"
	} elseif { $color_space == "16-bit RGB" } {
		set use_16bit_color		"USE_16BIT_COLOR:1"
		set use_halfword_mode	"USE_HALFWORD_ADDRESSING_MODE:1"
	} elseif { $color_space == "24-bit RGB" } {
		set use_24bit_color		"USE_24BIT_COLOR:1"
		set use_word_mode		"USE_WORD_ADDRESSING_MODE:1"
	} elseif { $color_space == "30-bit RGB" } {
		set use_30bit_color		"USE_30BIT_COLOR:1"
		set use_word_mode		"USE_WORD_ADDRESSING_MODE:1"
	} elseif { $color_space == "16-bit RGBA" } {
		set use_a_16bit_color	"USE_A_16BIT_COLOR:1"
		set use_halfword_mode	"USE_HALFWORD_ADDRESSING_MODE:1"
	} elseif { $color_space == "32-bit RGBA" } {
		set use_a_30bit_color	"USE_A_32BIT_COLOR:1"
		set use_word_mode		"USE_WORD_ADDRESSING_MODE:1"
	} else {
		set use_a_40bit_color	"USE_A_40BIT_COLOR:1"
		set use_doubleword_mode	"USE_DOUBLEWORD_ADDRESSING_MODE:1"
	}

	# set arguments
	set params "$start_addr;$back_addr;$addr_width;$ww;$hw;$mw;$dw;$ew;$pixels;$lines"
	set sections "$use_con_addr_mode;$use_gray_color;$use_8bit_color;$use_9bit_color;$use_16bit_color;$use_24bit_color;$use_30bit_color;$use_a_16bit_color;$use_a_32bit_color;$use_a_40bit_color;$use_halfword_mode;$use_word_mode;$use_doubleword_mode"

	# get generation settings
#	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	
	add_file "$dest_dir$dest_name.v" {SYNTHESIS SIMULATION}

	# Generate HDL
	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_video_pixel_buffer_dma.v" "altera_up_avalon_video_pixel_buffer_dma" $dest_name $params $sections
}
# | 
# +-----------------------------------

