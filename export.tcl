# Reference:  1) https://core.tcl-lang.org/tcllib/doc/trunk/embedded/md/tcllib/files/modules/cmdline/cmdline.md
#             2) Vivado Design Suite, User Guide, Logic Simulation, UG900

set XILINX_LIBS "/media/ian/Toshiba/Vivado/2019.2/xilinx_ibs"

package require Tcl 8.5
package require try;
package require cmdline 1.3.1;

set options {
    { top.arg           "Module Name"     }
    { technology.arg    "Technology"      }
    { project.arg       "Project Name"    }
    { project.arg       "Project Name"    }
    { interactive       "interactive mode"  }
}

try {
    array set params [::cmdline::getoptions argv $options "arguments:"]
    } trap {CMDLINE USAGE} {msg o} {
                                   puts $msg
                                   exit 1
                                   }

puts "Module Name  = $params(top)"
puts "Technology   = $params(technology)"
puts "Project Name = $params(project)"

create_project -part $params(technology) $params(project)  ./sandbox/ -force

set_property  ip_repo_paths  ./HW [current_project]
update_ip_catalog

create_fileset -simset $params(project)_1

# Add the RTL (NEEDS A SEARCH)
add_files -norecurse  {
./HW/src/hdl/Ethernet_LEDs.vhd
./HW/src/hdl/aurora4_struct.vhd
./HW/src/hdl/aurora4_entity.vhd
./HW/src/hdl/top_struct.v
./HW/src/hdl/krc3600_usb_hub_reset.vhd
}

# Add the IPs
add_files -norecurse  ./HW/7z030f/aurora_64b66b_4/aurora_64b66b_4.xcix
add_files -norecurse  ./HW/7z030f/aurora_64b66b_5/aurora_64b66b_5.xcix
add_files -norecurse  ./HW/7z030f/aurora_64b66b_6/aurora_64b66b_6.xcix
add_files -norecurse  ./HW/7z030f/aurora_64b66b_7/aurora_64b66b_7.xcix
add_files -norecurse  ./HW/7z030f/clk_wizard_0/clk_wizard_0.xci


# Build the Block Diagram (NEEDS A SEARCH)
source ./HW/src/bd/dgrm.tcl
source ./HW/src/bd/flasher.tcl

# Make the wrapper
make_wrapper -files [get_files ./sandbox/$params(project).srcs/sources_1/bd/dgrm/dgrm.bd] -top
add_files -norecurse  ./sandbox/$params(project).srcs/sources_1/bd/dgrm/hdl/dgrm_wrapper.v

make_wrapper -files [get_files ./sandbox/$params(project).srcs/sources_1/bd/flasher/flasher.bd] -top
add_files -norecurse  ./sandbox/$params(project).srcs/sources_1/bd/flasher/hdl/flasher_wrapper.v

# Export the comple script
set_property top $params(top) [current_fileset -simset]
update_compile_order

# Wow, if I do this first...
launch_simulation -scripts_only -install_path /media/ian/Toshiba/Questa/2019.4/questasim/bin

# ...then this also works.
export_ip_user_files -no_script -force
export_simulation -force \
                  -of_objects [get_filesets sim_1] \
                  -lib_map_path ${XILINX_LIBS} \
                  -export_source_files -directory "./sandbox" \
                  -simulator questa \
                  -ip_user_files_dir "./sandbox/$params(project).ip_user_files" \
                  -ipstatic_source_dir "./sandbox/$params(project).ip_user_files/ipstatic" \
                  -use_ip_compiled_libs

exit
