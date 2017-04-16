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

source "../../lib/aup_version.tcl"
source "../../lib/aup_ip_generator.tcl"

# +-----------------------------------
# | module altera_up_avalon_parallel_port
# | 
set_module_property DESCRIPTION "Parallel Port Interface for Altera DE-Series Boards"
set_module_property NAME altera_up_avalon_parallel_port
set_module_property VERSION $aup_version
set_module_property GROUP "University Program/Generic IO"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME "Parallel Port"
set_module_property DATASHEET_URL "[pwd]/doc/Parallel_Port.pdf"
#set_module_property TOP_LEVEL_HDL_FILE hdl/altera_up_avalon_parallel_port.v
#set_module_property TOP_LEVEL_HDL_MODULE altera_up_avalon_parallel_port
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
#add_file hdl/altera_up_avalon_parallel_port.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter board string "DE2-115"
set_parameter_property board DISPLAY_NAME "DE-Series Board"
set_parameter_property board GROUP "Configurations"
set_parameter_property board UNITS None
set_parameter_property board AFFECTS_ELABORATION true
set_parameter_property board AFFECTS_GENERATION true
set_parameter_property board ALLOWED_RANGES {"DE0-Nano" "DE2-115" "DE2i-150"}
#set_parameter_property board ALLOWED_RANGES {DE0 "DE0-Nano" DE1 DE2 "DE2-70" "DE2-115" DE3}
set_parameter_property board VISIBLE true
set_parameter_property board ENABLED true

add_parameter custom_port boolean false
set_parameter_property custom_port DISPLAY_NAME "Create custom parallel port"
set_parameter_property custom_port GROUP "Configurations"
set_parameter_property custom_port UNITS None
set_parameter_property custom_port AFFECTS_ELABORATION true
set_parameter_property custom_port AFFECTS_GENERATION true
set_parameter_property custom_port VISIBLE true
set_parameter_property custom_port ENABLED true

add_parameter preset string Pushbuttons
set_parameter_property preset DISPLAY_NAME "I/O device"
set_parameter_property preset GROUP "Presets"
set_parameter_property preset UNITS None
set_parameter_property preset AFFECTS_ELABORATION true
set_parameter_property preset AFFECTS_GENERATION true
set_parameter_property preset ALLOWED_RANGES {Pushbuttons "Slider Switches" "Dip Switches" LEDs "Seven Segment Displays" "Expansion Header"}
set_parameter_property preset VISIBLE true
set_parameter_property preset ENABLED true

#add_parameter reset_key boolean false
#set_parameter_property reset_key DISPLAY_NAME "Use KEY0 as system reset"
#set_parameter_property reset_key GROUP "Presets"
#set_parameter_property reset_key UNITS None
#set_parameter_property reset_key AFFECTS_ELABORATION true
#set_parameter_property reset_key AFFECTS_GENERATION true
#set_parameter_property reset_key VISIBLE false
#set_parameter_property reset_key ENABLED false

add_parameter leds string Green
set_parameter_property leds DISPLAY_NAME "LEDs Colour"
set_parameter_property leds GROUP "Presets"
set_parameter_property leds UNITS None
set_parameter_property leds AFFECTS_ELABORATION true
set_parameter_property leds AFFECTS_GENERATION true
set_parameter_property leds ALLOWED_RANGES {Green Red}
set_parameter_property leds VISIBLE true
set_parameter_property leds ENABLED false

add_parameter sevensegs string "3 to 0"
set_parameter_property sevensegs DISPLAY_NAME "Seven Segment Digits"
set_parameter_property sevensegs GROUP "Presets"
set_parameter_property sevensegs UNITS None
set_parameter_property sevensegs AFFECTS_ELABORATION true
set_parameter_property sevensegs AFFECTS_GENERATION true
set_parameter_property sevensegs ALLOWED_RANGES {"3 to 0" "7 to 4"}
set_parameter_property sevensegs VISIBLE true
set_parameter_property sevensegs ENABLED false

add_parameter gpio string "GPIO 0 (JP1)"
set_parameter_property gpio DISPLAY_NAME "Expansion Header"
set_parameter_property gpio GROUP "Presets"
set_parameter_property gpio UNITS None
set_parameter_property gpio AFFECTS_ELABORATION true
set_parameter_property gpio AFFECTS_GENERATION true
#set_parameter_property gpio ALLOWED_RANGES {"GPIO 0 (JP1)" "GPIO 1 (JP2)"}
#set_parameter_property gpio ALLOWED_RANGES {"GPIO 0 (JP1)" "GPIO 1 (JP2)" "GPIO 2 (JP3)"}
set_parameter_property gpio ALLOWED_RANGES {"GPIO 0 (JP1)" "GPIO 1 (JP2)" "GPIO 2 (JP3)" "GPIO 2 IN (JP3)"}
set_parameter_property gpio VISIBLE true
set_parameter_property gpio ENABLED false

add_parameter DW integer 32
set_parameter_property DW DISPLAY_NAME "Data Width"
set_parameter_property DW GROUP "Basic Settings (Preset)"
set_parameter_property DW UNITS None
set_parameter_property DW AFFECTS_ELABORATION true
set_parameter_property DW AFFECTS_GENERATION true
set_parameter_property DW ALLOWED_RANGES 1:32
set_parameter_property DW DERIVED true
set_parameter_property DW VISIBLE true
set_parameter_property DW ENABLED false
#set_parameter_property DW HDL_PARAMETER true

add_parameter direction string "Input only"
set_parameter_property direction DISPLAY_NAME "Port Direction"
set_parameter_property direction GROUP "Basic Settings (Preset)"
set_parameter_property direction UNITS None
set_parameter_property direction AFFECTS_ELABORATION true
set_parameter_property direction AFFECTS_GENERATION true
set_parameter_property direction ALLOWED_RANGES {"Input only" "Bidirectional (tri-state)" "Output only"}
set_parameter_property direction DERIVED true
set_parameter_property direction VISIBLE true
set_parameter_property direction ENABLED false

add_parameter custom_DW integer 32
set_parameter_property custom_DW DISPLAY_NAME "Data Width"
set_parameter_property custom_DW GROUP "Basic Settings"
set_parameter_property custom_DW UNITS None
set_parameter_property custom_DW AFFECTS_ELABORATION true
set_parameter_property custom_DW AFFECTS_GENERATION true
set_parameter_property custom_DW ALLOWED_RANGES 1:32
set_parameter_property custom_DW VISIBLE true
set_parameter_property custom_DW ENABLED true

add_parameter custom_direction string "Input only"
set_parameter_property custom_direction DISPLAY_NAME "Port Direction"
set_parameter_property custom_direction GROUP "Basic Settings"
set_parameter_property custom_direction UNITS None
set_parameter_property custom_direction AFFECTS_ELABORATION true
set_parameter_property custom_direction AFFECTS_GENERATION true
set_parameter_property custom_direction ALLOWED_RANGES {"Input only" "Bidirectional (tri-state)" "Output only"}
set_parameter_property custom_direction VISIBLE true
set_parameter_property custom_direction ENABLED true

add_parameter capture boolean false
set_parameter_property capture DISPLAY_NAME "Synchronously Capture"
set_parameter_property capture GROUP "Edge Capture Register"
set_parameter_property capture UNITS None
set_parameter_property capture AFFECTS_ELABORATION true
set_parameter_property capture AFFECTS_GENERATION true
set_parameter_property capture VISIBLE true
set_parameter_property capture ENABLED false

add_parameter edge string "Rising"
set_parameter_property edge DISPLAY_NAME "Capture on which edge"
set_parameter_property edge GROUP "Edge Capture Register"
set_parameter_property edge UNITS None
set_parameter_property edge AFFECTS_ELABORATION true
set_parameter_property edge AFFECTS_GENERATION true
set_parameter_property edge ALLOWED_RANGES {"Rising" "Falling" "Either"}
set_parameter_property edge VISIBLE true
set_parameter_property edge ENABLED false

add_parameter irq boolean false
set_parameter_property irq DISPLAY_NAME "Generate IRQ"
set_parameter_property irq GROUP "Edge Capture Register"
#set_parameter_property irq GROUP "Interrupt"
set_parameter_property irq UNITS None
set_parameter_property irq AFFECTS_ELABORATION true
set_parameter_property irq AFFECTS_GENERATION true
set_parameter_property irq VISIBLE true
set_parameter_property irq ENABLED false

add_parameter irq_type string "Edge"
set_parameter_property irq_type DISPLAY_NAME "Level"
set_parameter_property irq_type GROUP "Interrupt"
set_parameter_property irq_type UNITS None
set_parameter_property irq_type AFFECTS_ELABORATION true
set_parameter_property irq_type AFFECTS_GENERATION true
set_parameter_property irq_type ALLOWED_RANGES {"Level" "Edge"}
set_parameter_property irq_type VISIBLE false
set_parameter_property irq_type ENABLED false

#add_parameter top_level_ports string ""
#set_parameter_property top_level_ports AFFECTS_ELABORATION true
#set_parameter_property top_level_ports VISIBLE false
#set_parameter_property top_level_ports ENABLED false
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
# | connection point avalon_parallel_port_slave
# | 
add_interface avalon_parallel_port_slave avalon end 

set_interface_property avalon_parallel_port_slave addressAlignment DYNAMIC
set_interface_property avalon_parallel_port_slave associatedClock clk
set_interface_property avalon_parallel_port_slave associatedReset reset
set_interface_property avalon_parallel_port_slave bridgesToMaster ""
set_interface_property avalon_parallel_port_slave burstOnBurstBoundariesOnly false
#set_interface_property avalon_parallel_port_slave explicitAddressSpan 16
set_interface_property avalon_parallel_port_slave holdTime 0
set_interface_property avalon_parallel_port_slave isBigEndian  false
set_interface_property avalon_parallel_port_slave isFlash false
set_interface_property avalon_parallel_port_slave isMemoryDevice false
set_interface_property avalon_parallel_port_slave isNonVolatileStorage false
set_interface_property avalon_parallel_port_slave linewrapBursts false
set_interface_property avalon_parallel_port_slave maximumPendingReadTransactions 0
set_interface_property avalon_parallel_port_slave minimumUninterruptedRunLength 1
set_interface_property avalon_parallel_port_slave printableDevice false
set_interface_property avalon_parallel_port_slave readLatency 1
set_interface_property avalon_parallel_port_slave readWaitTime 0
set_interface_property avalon_parallel_port_slave setupTime 0
set_interface_property avalon_parallel_port_slave timingUnits cycles
set_interface_property avalon_parallel_port_slave writeWaitTime 0

add_interface_port avalon_parallel_port_slave address address Input 2
add_interface_port avalon_parallel_port_slave byteenable byteenable Input 4
add_interface_port avalon_parallel_port_slave chipselect chipselect Input 1
add_interface_port avalon_parallel_port_slave read read Input 1
add_interface_port avalon_parallel_port_slave write write Input 1
add_interface_port avalon_parallel_port_slave writedata writedata Input 32
add_interface_port avalon_parallel_port_slave readdata readdata Output 32
# | 
# +-----------------------------------

# +-----------------------------------
# | Validation function
# | 
proc validate {} {
	set board [ get_parameter_value "board" ]
	set custom_port [ get_parameter_value "custom_port" ]
	set preset [ get_parameter_value "preset" ]
#	set reset_key [ get_parameter_value "reset_key" ]
	set leds [ get_parameter_value "leds" ]
	set sevensegs [ get_parameter_value "sevensegs" ]
	set gpio [ get_parameter_value "gpio" ]
	set direction [ get_parameter_value "direction" ]
	set capture [ get_parameter_value "capture" ]
	set irq [ get_parameter_value "irq" ]

#	send_message info [ get_parameter_property "board" SYSTEM_INFO_TYPE ]
	
#	set_parameter_property reset_key ENABLED false
	set_parameter_property leds ENABLED false
	set_parameter_property sevensegs ENABLED false
	set_parameter_property gpio ENABLED false
	set_parameter_property DW ENABLED false
	set_parameter_property direction ENABLED false
	set_parameter_property capture ENABLED false
	set_parameter_property edge ENABLED false
	set_parameter_property irq ENABLED false
	set_parameter_property irq_type ENABLED false

	if { $custom_port } {
		set_parameter_property preset VISIBLE false
#		set_parameter_property reset_key VISIBLE false
		set_parameter_property leds VISIBLE false
		set_parameter_property sevensegs VISIBLE false
		set_parameter_property gpio VISIBLE false
		set_parameter_property DW VISIBLE false
		set_parameter_property direction VISIBLE false
		set_parameter_property custom_DW VISIBLE true
		set_parameter_property custom_direction VISIBLE true
		set_parameter_value DW [ get_parameter_value "custom_DW" ]
		set_parameter_value direction [ get_parameter_value "custom_direction" ]
	} else {
		set_parameter_property preset VISIBLE true
#		set_parameter_property reset_key VISIBLE true
		set_parameter_property leds VISIBLE true
		set_parameter_property sevensegs VISIBLE true
		set_parameter_property gpio VISIBLE true
		set_parameter_property DW VISIBLE true
		set_parameter_property direction VISIBLE true
		set_parameter_property custom_DW VISIBLE false
		set_parameter_property custom_direction VISIBLE false

		if { $preset == "Pushbuttons" } {
			if { $board == "DE0-Nano" } {
				set_parameter_value DW 2
			} else {
				set_parameter_value DW 4
			}
			set_parameter_value direction "Input only"
		}

		if { $preset == "Slider Switches" } {
			set_parameter_value direction "Input only"
			if { $board == "DE0-Nano" } {
				send_message error "The board you selected does not have slider switches"
			} elseif { $board == "DE1-SoC" } {
				set_parameter_value DW 10
#			} elseif { $board == "DE3" } {
#				set_parameter_value DW 4
			} else {
				set_parameter_value DW 18
			}
		}

		if { $preset == "Dip Switches" } {
			set_parameter_value direction "Input only"
			if { $board == "DE0-Nano" } {
				set_parameter_value DW 4
#			} elseif { $board == "DE3" } {
#				set_parameter_value DW 8
			} else {
				send_message error "The board you selected does not have dip switches"
			}
		}

		if { $preset == "LEDs" } {
			set_parameter_value direction "Output only"
			if { $board == "DE0-Nano" } {
				set_parameter_value DW 8
			} elseif { $board == "DE1-SoC" } {
				set_parameter_value DW 10
#			} elseif { $board == "DE3" } {
#				set_parameter_value DW 8
			} else {
				set_parameter_property leds ENABLED true
				if { $leds == "Green" } {
					set_parameter_value DW 9
				} else {
					set_parameter_value DW 18
				}
			}
		}

		if { $preset == "Seven Segment Displays" } {
			set_parameter_value direction "Output only"
			if { $board == "DE0-Nano" } {
				send_message error "The board you selected does not have seven segment displays"
#			} elseif { $board == "DE3" } {
#				set_parameter_value DW 16
			} else {
				set_parameter_value DW 32
			}
			if { ($board == "DE1-SoC") || ($board == "DE2i-150") || ($board == "DE2-115") } {
				set_parameter_property sevensegs ENABLED true
			}
		}

		if { $preset == "Expansion Header" } {
			if { ($board == "DE0-Nano") && ($gpio == "GPIO 2 (JP3)") } {
				set_parameter_value DW 13
				set_parameter_value direction "Bidirectional (tri-state)"
			} elseif { ($board == "DE0-Nano") && ($gpio == "GPIO 2 IN (JP3)") } {
				set_parameter_value DW 3
				set_parameter_value direction "Input only"
			} else {
				set_parameter_value DW 32
				set_parameter_value direction "Bidirectional (tri-state)"
			}
			if { $board != "DE2-115" } {
				set_parameter_property gpio ENABLED true
				if { ($board != "DE0-Nano") && (($gpio == "GPIO 2 (JP3)") || ($gpio == "GPIO 2 IN (JP3)")) } {
					send_message error "The board you selected does not have a $gpio header"
				}
			}
		}
	}

	if { $direction != "Output only" } {
		set_parameter_property capture ENABLED true
		if { $capture } {
			set_parameter_property edge ENABLED true
			set_parameter_property irq ENABLED true
		}
#		set_parameter_property irq ENABLED true
#		if { $irq && $capture } {
#			set_parameter_property irq_type ENABLED true
#		} elseif { $irq } {
#			set_parameter_value irq_type "Level"
#		}
	}
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Elaboration function
# | 
proc elaborate {} {
	set board [ get_parameter_value "board" ]
	set custom_port [ get_parameter_value "custom_port" ]
	set preset [ get_parameter_value "preset" ]
#	set reset_key [ get_parameter_value "reset_key" ]
	set leds [ get_parameter_value "leds" ]
	set sevensegs [ get_parameter_value "sevensegs" ]
	set gpio [ get_parameter_value "gpio" ]
	set dw [ get_parameter_value "DW" ]
	set direction [ get_parameter_value "direction" ]
	set capture [ get_parameter_value "capture" ]
	set edge [ get_parameter_value "edge" ]
	set irq [ get_parameter_value "irq" ]
	set irq_type [ get_parameter_value "irq_type" ]

	# +-----------------------------------
	# | connection point external_interface
	# |
	add_interface external_interface conduit end
	# | 
	# +-----------------------------------

	if { $custom_port } {
		if { $direction == "Input only" } {
			add_interface_port external_interface in_port export Input $dw
#			set_parameter_value "top_level_ports"	""
#			get_parameter_value "externals"			"in_port:input:$dw:"
		} elseif { $direction == "Output only" } {
			add_interface_port external_interface out_port export Output $dw
#			set_parameter_value "top_level_ports"	""
#			get_parameter_value "externals"			"out_port:output:$dw:"
		} else {
			add_interface_port external_interface bidir_port export Bidir $dw
#			set_parameter_value "top_level_ports"	""
#			get_parameter_value "externals"			"bidir_port:bidirput:$dw:"
		}
	} elseif { $preset == "Pushbuttons" } {
		add_interface_port external_interface KEY export Input $dw
	} elseif { $preset == "Slider Switches" } {
		add_interface_port external_interface SW export Input $dw
	} elseif { $preset == "Dip Switches" } {
		if { $board == "DE0-Nano" } {
			add_interface_port external_interface DIP export Input 4
		} else {
			add_interface_port external_interface DIP export Input 8
		}
	} elseif { $preset == "LEDs" } {
		if { $board == "DE3" } {
			add_interface_port external_interface LED export Output 8
		} else {
			if { $leds == "Green" } {
				add_interface_port external_interface LEDG export Output $dw
			} else {
				add_interface_port external_interface LEDR export Output $dw
			}
		}
	} elseif { $preset == "Seven Segment Displays" } {
		if { $board == "DE3" } {
			add_interface_port external_interface HEX0 export Output 7
			add_interface_port external_interface HEX1 export Output 7
		} elseif { $board == "DE2-70" } {
			if { $sevensegs == "3 to 0" } {
				add_interface_port external_interface HEX0 export Output 8
				add_interface_port external_interface HEX1 export Output 8
				add_interface_port external_interface HEX2 export Output 8
				add_interface_port external_interface HEX3 export Output 8
			} else {
				add_interface_port external_interface HEX4 export Output 8
				add_interface_port external_interface HEX5 export Output 8
				add_interface_port external_interface HEX6 export Output 8
				add_interface_port external_interface HEX7 export Output 8
			}
		} elseif { $board == "DE1" } {
			add_interface_port external_interface HEX0 export Output 7
			add_interface_port external_interface HEX1 export Output 7
			add_interface_port external_interface HEX2 export Output 7
			add_interface_port external_interface HEX3 export Output 7
		} else {
			if { $sevensegs == "3 to 0" } {
				add_interface_port external_interface HEX0 export Output 7
				add_interface_port external_interface HEX1 export Output 7
				add_interface_port external_interface HEX2 export Output 7
				add_interface_port external_interface HEX3 export Output 7
			} else {
				add_interface_port external_interface HEX4 export Output 7
				add_interface_port external_interface HEX5 export Output 7
				add_interface_port external_interface HEX6 export Output 7
				add_interface_port external_interface HEX7 export Output 7
			}
		}
	} else {
		if { $board == "DE2-115" } {
			add_interface_port external_interface GPIO export Bidir 32
		} elseif { $gpio == "GPIO 0 (JP1)" } {
			add_interface_port external_interface GPIO_0 export Bidir 32
		} elseif { $gpio == "GPIO 1 (JP2)" } {
			add_interface_port external_interface GPIO_1 export Bidir 32
		} elseif { $gpio == "GPIO 2 (JP3)" } {
			add_interface_port external_interface GPIO_2 export Bidir 13
		} else {
			add_interface_port external_interface GPIO_2_IN export Input 3
		}
	}

	if { $irq && $capture } {
		add_interface interrupt interrupt sender
		set_interface_property interrupt associatedAddressablePoint avalon_parallel_port_slave
		set_interface_property interrupt associatedClock clk
		set_interface_property interrupt associatedReset reset
		add_interface_port interrupt irq irq Output 1
	}
}
# | 
# +-----------------------------------

# +-----------------------------------
# | Generation function
# | 
proc generate {} {
	send_message info "Starting Generation of Parallel Port"

	# get parameter values
	set board [ get_parameter_value "board" ]
	set custom_port [ get_parameter_value "custom_port" ]
	set preset [ get_parameter_value "preset" ]
#	set reset_key [ get_parameter_value "reset_key" ]
	set leds [ get_parameter_value "leds" ]
	set sevensegs [ get_parameter_value "sevensegs" ]
	set gpio [ get_parameter_value "gpio" ]
	set dw [ expr [ get_parameter_value "DW" ] - 1 ]
	set direction [ get_parameter_value "direction" ]
	set capture [ get_parameter_value "capture" ]
	set edge [ get_parameter_value "edge" ]
	set irq [ get_parameter_value "irq" ]
	set irq_type [ get_parameter_value "irq_type" ]

	# send_message info "PIO's Direction: $direction"

	# set section values
	set input_sections "USE_INPUT_PORT:0;USE_SLIDER_SWITCHES:0;USE_DIP_SWITCHES:0;USE_PUSHBUTTONS:0;USE_GPIO_2_IN:0"
	if { $direction == "Input only" } {
		if { $custom_port } {
			set use_in		"USE_INPUT_PORT:1"
			# send_message info "Input Port $use_in"
		} else {
			set use_in		"USE_INPUT_PORT:0"
		}
		set use_sw			[ format "USE_SLIDER_SWITCHES:%d" [ string match "Slider*" $preset ] ]
		set use_dip 		[ format "USE_DIP_SWITCHES:%d" [ string match "Dip*" $preset ] ]
		set use_key			[ format "USE_PUSHBUTTONS:%d" [ string match "Push*" $preset ] ]
		set use_gpio2_in	[ format "USE_GPIO_2_IN:%d" [ expr [ string match "Expan*" $preset ] && [ string match "GPIO 2 IN*" $gpio ] ] ]
		set input_sections "$use_in;$use_sw;$use_dip;$use_key;$use_gpio2_in" 
		# send_message info "Input Port2 $input_sections"
	}

	set bidir_sections "USE_INOUT:0;USE_BIDIR_PORT:0;USE_GPIO_S:0;USE_GPIO_0:0;USE_GPIO_1:0;USE_GPIO_2:0"
	if { $direction == "Bidirectional (tri-state)" } {
		set use_inout		"USE_INOUT:1"
		if { $custom_port } {
			set use_bidir		"USE_BIDIR_PORT:1"
		} else {
			set use_bidir		"USE_BIDIR_PORT:0"
		}
		set use_gpio		[ format "USE_GPIO_S:%d" [ expr [ string match "Expan*" $preset ] && [ string match "DE2-115" $board ] ] ]
		set use_gpio0		[ format "USE_GPIO_0:%d" [ expr [ string match "Expan*" $preset ] && [ string match "GPIO 0*" $gpio ] ] ]
		set use_gpio1		[ format "USE_GPIO_1:%d" [ expr [ string match "Expan*" $preset ] && [ string match "GPIO 1*" $gpio ] ] ]
		set use_gpio2		[ format "USE_GPIO_2:%d" [ expr [ string match "Expan*" $preset ] && [ string match "GPIO 2 (*" $gpio ] ] ]
		set bidir_sections "$use_inout;$use_bidir;$use_gpio;$use_gpio0;$use_gpio1;$use_gpio2" 
	}
	
	set output_sections "USE_OUTPUT_PORT:0;USE_TRI_COLOUR_LEDS:0;USE_GREEN_LEDS:0;USE_RED_LEDS:0;USE_TWO_SEVEN_SEGMENT:0;USE_LOW_SEVEN_SEGMENT:0;USE_HIGH_SEVEN_SEGMENT:0"
	if { $direction == "Output only" } {
		if { $custom_port } {
			set use_out		"USE_OUTPUT_PORT:1"
		} else {
			set use_out		"USE_OUTPUT_PORT:0"
		}
		set use_tri_led	[ format "USE_TRI_COLOUR_LEDS:%d" [ expr [ string match "LEDs" $preset ] && [ string match "DE3" $board ] ] ]
		set use_green	[ format "USE_GREEN_LEDS:%d" [ expr [ string match "LEDs" $preset ] && [ string match "Green" $leds ] ] ]
		set use_red		[ format "USE_RED_LEDS:%d" [ expr [ string match "LEDs" $preset ] && [ string match "Red" $leds ] ] ]
		set use_two_ss	[ format "USE_TWO_SEVEN_SEGMENT:%d" [ expr [ string match "Seven*" $preset ] && [ string match "DE3" $board ] ] ]
		set use_low_ss	[ format "USE_LOW_SEVEN_SEGMENT:%d" [ expr [ string match "Seven*" $preset ] && [ string match "3*" $sevensegs ] ] ]
		set use_high_ss	[ format "USE_HIGH_SEVEN_SEGMENT:%d" [ expr [ string match "Seven*" $preset ] && [ string match "7*" $sevensegs ] ] ]
		set output_sections "$use_out;$use_tri_led;$use_green;$use_red;$use_two_ss;$use_low_ss;$use_high_ss" 
	}
	
	set use_irq		[ format "USE_INTERRUPTS:%d" [ expr [ string match "true" $irq ] && [ string match "true" $capture ] ] ]
#	set use_level	[ format "USE_LEVEL_INTERRUPTS:%d" [ expr [ string match "true" $irq ] && [ string match "Level" $irq_type ] ] ]
	set use_level	"USE_LEVEL_INTERRUPTS:0"
	set irq_sections "$use_irq;$use_level" 

	set use_capture		[ format "USE_CAPTURE:%d" [ string match "true" $capture ] ]
	set use_edge_high	[ format "USE_EDGE_HIGH_CAPTURE:%d" [ expr [ string match "true" $capture ] && [ string match "Rising" $edge ] ] ]
	set use_edge_low	[ format "USE_EDGE_LOW_CAPTURE:%d" [ expr [ string match "true" $capture ] && [ string match "Falling" $edge ] ] ]
	set use_edge_both	[ format "USE_EDGE_BOTH_CAPTURE:%d" [ expr [ string match "true" $capture ] && [ string match "Either" $edge ] ] ]
	set capture_sections "$use_capture;$use_edge_high;$use_edge_low;$use_edge_both" 

	set use_data_out	[ format "USE_DATA_OUT:%d" [ expr [ string match "Output*" $direction ] || [ string match "Bidir*" $direction ] ] ]

	set use_de0			"USE_DE0:0"
	set use_de2_70		[ format "USE_DE2_70:%d" [ string match "DE2-70" $board ] ]

	# set top_level_ports and external_port
#	set top_level_name [ format "top_level_name=%s" [ get_project_property QUARTUS_PROJECT_NAME ] ]
#	set top_level_ports "top_level_ports="
#	set module_ports "module_ports="
#	foreach port [ get_interface_ports external_interface ] {
#		set direction [ get_port_property $port DIRECTION ]
#		set width [ get_port_property $port WIDTH ]
#		if { [ expr {$port == "in_port"} || {$port == "out_port"} || {$port == "bidir_port"} ] } {
#			set module_ports  "$module_ports$port:$direction:$width:;"
#		} else {
#			set top_level_ports "$top_level_ports$port:$direction:$width;"
#			if { [ expr {$port == "KEY"} && {$reset_key} ] } {
#				set module_ports  "$module_ports$port:$direction:$width:$port|3-1|;"
#			} else {
#				set module_ports  "$module_ports$port:$direction:$width:$port;"
#			}
#		}
#	}

	# set arguments
	set params "DW:$dw"
	set sections "$input_sections;$bidir_sections;$output_sections;$irq_sections;$capture_sections;$use_data_out;$use_de0;$use_de2_70" 

	# get generation properties
#	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	
	add_file "$dest_dir$dest_name.v" {SYNTHESIS SIMULATION}

	# Generate HDL
	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_parallel_port.v" "altera_up_avalon_parallel_port" $dest_name $params $sections

	# generate top level template
	#alt_up_create_instantiation_template "$dest_dir$dest_name.inst.v" $dest_name "external_interface"
}
# | 
# +-----------------------------------


