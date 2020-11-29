# Reference:  1) https://core.tcl-lang.org/tcllib/doc/trunk/embedded/md/tcllib/files/modules/cmdline/cmdline.md
#             2) Vivado Design Suite, User Guide, Logic Simulation, UG900
# To do:
# Add a path to the IP library.
# Add paths to the RTL, IPs, BDs & sandobx.
# I think it would be better to import the IPs simply by giving a directory path.  But I would have to do some reorganisation first.
# I should also probably not have the relative directories to the RTL and block diagrams.

set XILINX_LIBS "/media/ian/Toshiba/Vivado/2019.2/xilinx_ibs"

package require Tcl 8.5
package require try;
package require cmdline 1.3.1;

set options {
    { top.arg           "Module Name"   }
    { technology.arg    "Technology"    }
    { project.arg       "Project Name"  }
    { project.arg       "Project Name"  }
    { sandbox.arg       "Sandbox Directory"  }
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

create_project -part $params(technology) $params(project)  $params(sandbox)/ -force

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
  make_wrapper -files [get_files $params(sandbox)/$params(project).srcs/sources_1/bd/${fbasename}/${fbasename}.bd] -top
  add_files -norecurse  $params(sandbox)/$params(project).srcs/sources_1/bd/${fbasename}/hdl/${fbasename}_wrapper.v
}

# Export the compile script
set_property top $params(top) [current_fileset -simset]
update_compile_order

# If I don't do this first,...
launch_simulation -scripts_only -install_path /media/ian/Toshiba/Questa/2019.4/questasim/bin

# ...then this doesn't work.
export_ip_user_files -no_script -force
export_simulation -force \
                  -of_objects [get_filesets sim_1] \
                  -lib_map_path ${XILINX_LIBS} \
                  -export_source_files -directory "$params(sandbox)" \
                  -simulator questa \
                  -ip_user_files_dir   "$params(sandbox)/$params(project).ip_user_files" \
                  -ipstatic_source_dir "$params(sandbox)/$params(project).ip_user_files/ipstatic" \
                  -use_ip_compiled_libs

exec touch $params(sandbox)/.export
exit
