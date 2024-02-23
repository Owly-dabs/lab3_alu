set projDir "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/vivado"
set projName "alu-starter"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/au_top_0.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/alu_1.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/reset_conditioner_2.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/button_conditioner_3.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/adder_4.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/boolean_5.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/shifter_6.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/multiplier_7.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/compare_8.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/muxfour_9.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/mux_2_10.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/pipeline_11.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/rca_12.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/mshl32bit_13.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/xbitreverse_14.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/full_adder_15.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/x_bit_left_shifter_16.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/x_bit_left_shifter_17.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/x_bit_left_shifter_18.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/x_bit_left_shifter_19.v" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/verilog/x_bit_left_shifter_20.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/constraint/alchitry.xdc" "C:/Users/owly/Documents/SUTD_classes/lab3_alu/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
