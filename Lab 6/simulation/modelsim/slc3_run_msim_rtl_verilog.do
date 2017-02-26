transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/tristate.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/mux2.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/datapath.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/ALU.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/tristate_buffer.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/mux3.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/mux4.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/PCincrement.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/regfile.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/SEXT.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/NZPlogic.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/BENlogic.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/FlipFlop.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/adder.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/slc3.sv}
vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/temp_top.sv}

vlog -sv -work work +incdir+C:/Users/William/Documents/ECE385/Lab\ 6 {C:/Users/William/Documents/ECE385/Lab 6/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 2000 ns