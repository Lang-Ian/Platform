# Reference:  1) https://core.tcl-lang.org/tcllib/doc/trunk/embedded/md/tcllib/files/modules/cmdline/cmdline.md
#             2) Vivado Design Suite User Guide, Logic Simulation, UG900
#             3) Vivado Design Suite User Guide, Using Tcl Scripting, UG894
#             4)  Vivado Design Suite Tcl Command Reference Guide, UG835
# To do:
# Add a path to the IP library

set XILINX_LIBS "/media/ian/Toshiba/Vivado/2019.2/xilinx_ibs"

package require Tcl 8.5
package require try;
package require cmdline 1.3.1;

set options {
    { top.arg           "Module Name"   }
    { technology.arg    "Technology"    }
    { project.arg       "Project Name"  }
    { project.arg       "Project Name"  }
    { sandbox.arg       "Sandbox Directory" }
    { stage.arg         "synth|build|write|export" }
    { not_used          "not used"      }
}

try {
    array set params [::cmdline::getoptions argv $options "arguments:"]
    } trap {CMDLINE USAGE} {msg o} {
                                   puts $msg
                                   exit 1
                                   }

# Create Project
puts "Module Name  = $params(top)"
puts "Technology   = $params(technology)"
puts "Project Name = $params(project)"

switch $params(stage) {
  "synth" {
          puts "-- synthesizing $params(top) --"

          create_project -part $params(technology) $params(project)  $params(sandbox)/ -force

          # IP Repository
          set_property  ip_repo_paths  ./HW [current_project]
          update_ip_catalog

          create_fileset -simset $params(project)_1

          # Add the RTL
          set vhdl_files [glob -nocomplain ./HW/src/hdl/*.vhd]
          set verilog_files  [glob -nocomplain ./HW/src/hdl/*.v]
          set rtl_files [list {*}$vhdl_files {*}$verilog_files ]
          puts "Adding RTL ${rtl_files}"
          add_files -norecurse ${rtl_files}

          # Add the Xilinx IPs
          set ips [glob -nocomplain ./HW/7z030f/*/*.xcix]
          set ips [list {*}$ips [glob -nocomplain ./HW/7z030f/*/*.xci] ]
          puts "Adding Xilinx IPs ${ips}"
          import_files -norecurse  ${ips}

          # Build the Block Diagrams
          set bds [glob -nocomplain ./HW/src/bd/*.tcl]
          foreach {bd} [list {*}$bds] {
            puts "Adding block diagam ${bd}"
            source ${bd}
            #set fbasename [file rootname [file tail $bd]]; # remove the file extension
            make_wrapper -files [get_files $params(sandbox)/$params(project).srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
            add_files -norecurse  $params(sandbox)/$params(project).srcs/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.v
          }

          # Add the constraints
          set constraints_files [glob -nocomplain ./HW/src/constraints/*.xdc]
          puts "Adding Xilinx IPs ${constraints_files}"
          add_files -norecurse  ${constraints_files}

          # If you want to work with local source copies.
          #import_files -force -norecurse

          #Synthesis
          #synth_design -top $params(top) -part $params(technology)
          set_property top top [current_fileset]
          update_compile_order -fileset sources_1
          launch_runs synth_1 -jobs 4
          wait_on_run synth_1
          open_run synth_1 -name synth_1
          write_checkpoint -force $params(sandbox)/post_synth.dcp
          report_timing_summary -file $params(sandbox)/post_synth_timing_summary.rpt
          report_utilization -file $params(sandbox)/post_synth_util.rpt
          }

  "build" {
          puts "-- place and route $params(top) --"

          open_project $params(sandbox)/$params(project).xpr
          open_run synth_1 -name synth_1

          launch_runs impl_1 -jobs 4
          wait_on_run impl_1
          }

  "write" {
           open_project $params(sandbox)/$params(project).xpr
           puts "-- writing bitstream $params(top).bit --"
           open_run impl_1
           launch_runs impl_1 -to_step write_bitstream -jobs 4
           wait_on_run impl_1
           }

  "export" {
           open_project $params(sandbox)/$params(project).xpr
           puts "-- exporting $params(top).xsa for Petalinux --"
           write_hw_platform -fixed -force  -include_bit -file $params(sandbox)/platform.xsa
           }

  default { puts "-- stage  = $params(stage) --" }
}

exec touch $params(sandbox)/.$params(stage)
exit
