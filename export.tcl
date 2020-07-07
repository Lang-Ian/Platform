# Elektrobit Austria
# Ian.Lang@elektrobit.com
# References
# ug835
# To do:  pass in the technology and the module name.
# File needs a good tidy up and removal of gash stuff!
# Add a waveform file.


puts "--Export--"

#puts ${::argv}

create_project -part "xcku040-ffva1156-2-i" ${::argv} -force

set_property  ip_repo_paths  . [current_project]
update_ip_catalog

# Build the Block Diagram
source ./tb/bd/mta3g_decoder_th.tcl

make_wrapper -files [get_files ./${::argv}.srcs/sources_1/bd/mta3g_decoder_th/mta3g_decoder_th.bd] -top
add_files -norecurse ./${::argv}.srcs/sources_1/bd/mta3g_decoder_th/hdl/mta3g_decoder_th_wrapper.v

puts "--New--"

add_files -norecurse ./tb/mta3g_decoder.svh
add_files -norecurse {./tb/mta3g_decoder.svh ./tb/mta3g_decoder_pkg.sv ./tb/prbs_pkg.sv ./tb/mta3g_decoder_tb.sv}
update_compile_order -fileset sources_1
set_property top mta3g_decoder_tb [get_filesets sim_1]

add_files -norecurse ./tb/sim/mta3g_decoder_tb_behav.wcfg

#set_property target_simulator Questa [current_project]
#update_ip_catalog

set_property compxlib.questa_compiled_library_dir C:/questasim64_2019.1/questa_simlib [current_project]
update_ip_catalog

puts "--New End--"

update_compile_order -fileset sources_1
set_property top mta3g_decoder_th_wrapper [current_fileset]
generate_target Simulation [get_files ./${::argv}.srcs/sources_1/bd/mta3g_decoder_th/mta3g_decoder_th.bd]
#export_ip_user_files -of_objects [get_files ./${::argv}.srcs/sources_1/bd/mta3g_decoder_th/mta3g_decoder_th.bd] -no_script -sync -force -quiet
export_simulation -of_objects [get_files ./${::argv}.srcs/sources_1/bd/mta3g_decoder_th/mta3g_decoder_th.bd]

puts "--Done--"



puts "--Really Done--"




# A bit of transcript I might use.
#add_files -norecurse ./tb/mta3g_decoder.svh
#add_files -norecurse {./tb/mta3g_decoder.sv ./tb/mta3g_decoder_pkg.sv ./tb/prbs_pkg.sv ./tb/mta3g_decoder_tb.sv}
#update_compile_order -fileset sources_1
#set_property top mta3g_decoder_tb [get_filesets sim_1]
#set_property top_lib xil_defaultlib [get_filesets sim_1]
#update_ip_catalog
#update_ip_catalog
#launch_simulation
