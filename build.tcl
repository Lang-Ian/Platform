# Reference:  1) https://core.tcl-lang.org/tcllib/doc/trunk/embedded/md/tcllib/files/modules/cmdline/cmdline.md
#             2) Vivado Design Suite, User Guide, Logic Simulation, UG900
# To do:
# Add a path to the IP library.

set XILINX_LIBS "/media/ian/Toshiba/Vivado/2019.2/xilinx_ibs"

package require Tcl 8.5
package require try;
package require cmdline 1.3.1;

set options {
    { top.arg           "Module Name"   }
    { technology.arg    "Technology"    }
    { project.arg       "Project Name"  }
    { project.arg       "Project Name"  }
    { not_used          "not used"      }
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

create_project -part $params(technology) $params(project)  ./buildbox/ -force

set_property  ip_repo_paths  ./HW [current_project]
update_ip_catalog

create_fileset -simset $params(project)_1

# Add the RTL
set vhdl_files [glob ./HW/src/hdl/*.vhd]
set verilog_files  [glob ./HW/src/hdl/*.v]
set rtl_files [list {*}$vhdl_files {*}$verilog_files ]
puts "Adding RTL ${rtl_files}"
add_files -norecurse ${rtl_files}

# Add the Xilinx IPs
set ips [glob ./HW/7z030f/*/*.xcix]
set ips [list {*}$ips [glob ./HW/7z030f/*/*.xci] ]
puts "Adding Xilinx IPs ${ips}"
add_files -norecurse  ${ips}

# Build the Block Diagrams
set bds [glob ./HW/src/bd/*.tcl]
foreach {bd} [list {*}$bds] {
  puts "Adding block diagam ${bd}"
  source ${bd}
  set fbasename [file rootname [file tail $bd]]; # remove the file extension
  make_wrapper -files [get_files ./buildbox/$params(project).srcs/sources_1/bd/${fbasename}/${fbasename}.bd] -top
  add_files -norecurse  ./buildbox/$params(project).srcs/sources_1/bd/${fbasename}/hdl/${fbasename}_wrapper.v
}

# Add the contstaints
set constraints_files [glob ./HW/src/constraints/*.xdc]
puts "Adding Xilinx IPs ${constraints_files}"
add_files -norecurse  ${constraints_files}

# Update compile order for the fileset 'sources_1'
set_property top top [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

#Run synthesis and the default utilization report.
launch_runs synth_1
wait_on_run synth_1

exec touch ./buildbox/.build
exit
