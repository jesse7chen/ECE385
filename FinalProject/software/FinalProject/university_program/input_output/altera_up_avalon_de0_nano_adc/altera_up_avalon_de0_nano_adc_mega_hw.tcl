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

source "../../lib/aup_ip_generator.tcl"

# 
# module altera_up_avalon_de0_nano_adc_mega
# 
set_module_property DESCRIPTION "ADC Controller for Altera DE0-Nano Board"
set_module_property NAME altera_up_avalon_de0_nano_adc_mega
set_module_property VERSION $aup_version
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "University Program/Generic IO"
set_module_property AUTHOR "Altera University Program"
set_module_property DISPLAY_NAME "DE0-Nano ADC Controller"
set_module_property DATASHEET_URL "[pwd]/doc/DE0-Nano_ADC_Controller.pdf"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property REPORT_TO_TALKBACK false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property GENERATION_CALLBACK generate 
set_module_property HIDE_FROM_QSYS true
set_module_property HIDE_FROM_SOPC true

# +-----------------------------------
# | files
# | 
add_file "hdl/altera_up_avalon_de0_nano_adv_adc.v" {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# 
# parameters
# 
add_parameter sclk_freq float 3.2
set_parameter_property sclk_freq DISPLAY_NAME "ADC Clock Frequency (MHz)"
set_parameter_property sclk_freq UNITS MEGAHERTZ
set_parameter_property sclk_freq ALLOWED_RANGES 0.8:3.2
set_parameter_property sclk_freq AFFECTS_ELABORATION true
set_parameter_property sclk_freq AFFECTS_GENERATION true
set_parameter_property sclk_freq VISIBLE true
set_parameter_property sclk_freq ENABLED true

add_parameter tsclk INTEGER 
set_parameter_property tsclk DISPLAY_NAME "ADC_SCLK Scaling Factor"
set_parameter_property tsclk TYPE INTEGER
set_parameter_property tsclk UNITS None
set_parameter_property tsclk DESCRIPTION ""
set_parameter_property tsclk AFFECTS_ELABORATION true
set_parameter_property tsclk AFFECTS_GENERATION true
set_parameter_property tsclk VISIBLE false
set_parameter_property tsclk ENABLED true
set_parameter_property tsclk DERIVED true


add_parameter numch INTEGER 8 ""
set_parameter_property numch DISPLAY_NAME "Number of Channels Used (0 to n-1)"
set_parameter_property numch TYPE INTEGER
set_parameter_property numch UNITS None
set_parameter_property numch ALLOWED_RANGES 2:8
set_parameter_property numch DESCRIPTION ""
set_parameter_property numch AFFECTS_ELABORATION true
set_parameter_property numch AFFECTS_GENERATION true
set_parameter_property numch VISIBLE true
set_parameter_property numch ENABLED true

add_parameter sys_clk_freq integer 50
set_parameter_property sys_clk_freq DISPLAY_NAME "System Clock Frequency (MHz)"
set_parameter_property sys_clk_freq GROUP "Configurations"
set_parameter_property sys_clk_freq UNITS None
set_parameter_property sys_clk_freq AFFECTS_ELABORATION true
set_parameter_property sys_clk_freq AFFECTS_GENERATION true
set_parameter_property sys_clk_freq ALLOWED_RANGES {25 50 100 150 200}
set_parameter_property sys_clk_freq VISIBLE true
set_parameter_property sys_clk_freq ENABLED true

# 
# display items
# 


# 
# connection point clk
# 
add_interface clk clock end
set_interface_property clk ENABLED true

add_interface_port clk CLOCK clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clk
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset RESET reset Input 1


# 
# connection point readings
# 
add_interface readings conduit end
set_interface_property readings associatedReset ""
set_interface_property readings ENABLED true

add_interface_port readings CH0 export Output 12
add_interface_port readings CH1 export Output 12
add_interface_port readings CH2 export Output 12
add_interface_port readings CH3 export Output 12
add_interface_port readings CH4 export Output 12
add_interface_port readings CH5 export Output 12
add_interface_port readings CH6 export Output 12
add_interface_port readings CH7 export Output 12


# 
# connection point external_interface
# 
add_interface adc_signals conduit end
set_interface_property adc_signals associatedReset ""
set_interface_property adc_signals ENABLED true

add_interface_port adc_signals ADC_SCLK export Output 1
add_interface_port adc_signals ADC_CS_N export Output 1
add_interface_port adc_signals ADC_SDAT export Input 1
add_interface_port adc_signals ADC_SADDR export Output 1

proc elaborate {} {

	
	set sysclk [ get_parameter_value "sys_clk_freq" ]
	set sclk [ get_parameter_value "sclk_freq" ]
	
	set t_sclk [ expr {$sysclk/$sclk} ]
	set t_sclk [ expr {round($t_sclk)} ]
	set new_sclk [ expr {$sysclk*1.0/$t_sclk} ]
	
	#adjust for corners (increment or decrement so sclk stays in 0.8 to 3.2 MHz range)
	if {$new_sclk < 0.8} {
		set t_sclk [ expr {$t_sclk - 1} ]
	}
	if {$new_sclk > 3.2} {
		set t_sclk [ expr {$t_sclk + 1} ]
	}
	
	set_parameter_value tsclk $t_sclk

}
	
proc generate {} {
	send_message info "Starting Generation of DE0-Nano ADC Controller"
	
	set num_ch [ get_parameter_value "numch" ]
	set t_sclk [ get_parameter_value "tsclk" ]
	
	set tsclk_p [ format "tsclk:8'd%d" $t_sclk ]
	set numch_p [ format "numch:4'd%d" $num_ch ]
		
	set params "$tsclk_p;$numch_p"
	set sections ""

#	set dest_language	[ get_generation_property HDL_LANGUAGE ]
	set dest_dir 		[ get_generation_property OUTPUT_DIRECTORY ]
	set dest_name		[ get_generation_property OUTPUT_NAME ]
	
	#file copy -force "hdl/adv_adc.v" $dest_dir

	add_file "$dest_dir$dest_name.v" {SYNTHESIS}
	#add_file "$dest_dir/adv_adc.v" SYNTHESIS
	send_message info [ get_files ]
	
	alt_up_generate "$dest_dir$dest_name.v" "hdl/altera_up_avalon_de0_nano_adc_mega.v" "altera_up_avalon_de0_nano_adc" $dest_name $params $sections

}

