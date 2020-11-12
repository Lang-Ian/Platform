############################################################################
# Constraints for the KRM-3Z30 Module                                      #
# In order to use this, the Top Level Module needs the following ports:    #
#                                                                          #
#    X1_1 : inout iogroup_t;                                               #
#    X1_2 : inout iogroup_t;                                               #
#    X2_1 : inout iogroup_t;                                               #
#    X2_2 : inout iogroup_t;                                               #
#                                                                          #
#    X1_MGT1 : inout mgtgroup1_t;                                          #
#                                                                          #
#    LED : out STD_LOGIC_VECTOR (3 downto 0);                              #
#                                                                          #
# The types iogroup_t and mgtgroup1_t are defined in the carrier           #
# package (e.g. krm3500_pkg.vhd)                                           #
#                                                                          #
#                                                                          #
############################################################################


############################################################################
# I/O STANDARDS and Location Constraints                                   #
############################################################################

#NET "z7_system_inst/processing_system7_0/PS_PORB" IOSTANDARD = LVCMOS33;
#NET "z7_system_inst/processing_system7_0/PS_PORB" DRIVE = 8;
#NET "z7_system_inst/processing_system7_0/PS_PORB" SLEW = slow;

#NET "z7_system_inst/processing_system7_0/PS_SRSTB" IOSTANDARD = LVCMOS33;
#NET "z7_system_inst/processing_system7_0/PS_SRSTB" DRIVE = 8;
#NET "z7_system_inst/processing_system7_0/PS_SRSTB" SLEW = slow;

#NET "z7_system_inst/processing_system7_0/PS_CLK" IOSTANDARD = LVCMOS33;
#NET "z7_system_inst/processing_system7_0/PS_CLK" DRIVE = 8;
#NET "z7_system_inst/processing_system7_0/PS_CLK" SLEW = slow;

#############################################################################
# On-Board Connections                                                      #
#############################################################################

# USR_LED_1
set_property PACKAGE_PIN K12 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[0]}]
set_property DRIVE 8 [get_ports {LED[0]}]
set_property SLEW SLOW [get_ports {LED[0]}]

# USR_LED_2
set_property PACKAGE_PIN H16 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[1]}]
set_property DRIVE 8 [get_ports {LED[1]}]
set_property SLEW SLOW [get_ports {LED[1]}]

# USR_LED_3
set_property PACKAGE_PIN K10 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[2]}]
set_property DRIVE 8 [get_ports {LED[2]}]
set_property SLEW SLOW [get_ports {LED[2]}]

# USR_LED_4
set_property PACKAGE_PIN K11 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[3]}]
set_property DRIVE 8 [get_ports {LED[3]}]
set_property SLEW SLOW [get_ports {LED[3]}]

#############################################################################
# X1_1 Connections                                                          #
#############################################################################

#Bytegroup t0

set_property PACKAGE_PIN AA25 [get_ports X1_1_000]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_000]
set_property DRIVE 8 [get_ports X1_1_000]
set_property SLEW SLOW [get_ports X1_1_000]

set_property PACKAGE_PIN AB25 [get_ports X1_1_001]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_001]
set_property DRIVE 8 [get_ports X1_1_001]
set_property SLEW SLOW [get_ports X1_1_001]

set_property PACKAGE_PIN AB26 [get_ports X1_1_002]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_002]
set_property DRIVE 8 [get_ports X1_1_002]
set_property SLEW SLOW [get_ports X1_1_002]

set_property PACKAGE_PIN AC26 [get_ports X1_1_003]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_003]
set_property DRIVE 8 [get_ports X1_1_003]
set_property SLEW SLOW [get_ports X1_1_003]

set_property PACKAGE_PIN AE25 [get_ports X1_1_004]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_004]
set_property DRIVE 8 [get_ports X1_1_004]
set_property SLEW SLOW [get_ports X1_1_004]

set_property PACKAGE_PIN AE26 [get_ports X1_1_005]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_005]
set_property DRIVE 8 [get_ports X1_1_005]
set_property SLEW SLOW [get_ports X1_1_005]

set_property PACKAGE_PIN AD25 [get_ports X1_1_006]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_006]
set_property DRIVE 8 [get_ports X1_1_006]
set_property SLEW SLOW [get_ports X1_1_006]

set_property PACKAGE_PIN AD26 [get_ports X1_1_007]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_007]
set_property DRIVE 8 [get_ports X1_1_007]
set_property SLEW SLOW [get_ports X1_1_007]

set_property PACKAGE_PIN AF24 [get_ports X1_1_008]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_008]
set_property DRIVE 8 [get_ports X1_1_008]
set_property SLEW SLOW [get_ports X1_1_008]

set_property PACKAGE_PIN AF25 [get_ports X1_1_009]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_009]
set_property DRIVE 8 [get_ports X1_1_009]
set_property SLEW SLOW [get_ports X1_1_009]

set_property PACKAGE_PIN AA24 [get_ports X1_1_010]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_010]
set_property DRIVE 8 [get_ports X1_1_010]
set_property SLEW SLOW [get_ports X1_1_010]

set_property PACKAGE_PIN AB24 [get_ports X1_1_011]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_011]
set_property DRIVE 8 [get_ports X1_1_011]
set_property SLEW SLOW [get_ports X1_1_011]

#Bytegroup t1

set_property PACKAGE_PIN AE22 [get_ports X1_1_100]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_100]
set_property DRIVE 8 [get_ports X1_1_100]
set_property SLEW SLOW [get_ports X1_1_100]

set_property PACKAGE_PIN AF22 [get_ports X1_1_101]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_101]
set_property DRIVE 8 [get_ports X1_1_101]
set_property SLEW SLOW [get_ports X1_1_101]

set_property PACKAGE_PIN AE23 [get_ports X1_1_102]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_102]
set_property DRIVE 8 [get_ports X1_1_102]
set_property SLEW SLOW [get_ports X1_1_102]

set_property PACKAGE_PIN AF23 [get_ports X1_1_103]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_103]
set_property DRIVE 8 [get_ports X1_1_103]
set_property SLEW SLOW [get_ports X1_1_103]

set_property PACKAGE_PIN AB21 [get_ports X1_1_104]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_104]
set_property DRIVE 8 [get_ports X1_1_104]
set_property SLEW SLOW [get_ports X1_1_104]

set_property PACKAGE_PIN AB22 [get_ports X1_1_105]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_105]
set_property DRIVE 8 [get_ports X1_1_105]
set_property SLEW SLOW [get_ports X1_1_105]

set_property PACKAGE_PIN AA22 [get_ports X1_1_106]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_106]
set_property DRIVE 8 [get_ports X1_1_106]
set_property SLEW SLOW [get_ports X1_1_106]

set_property PACKAGE_PIN AA23 [get_ports X1_1_107]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_107]
set_property DRIVE 8 [get_ports X1_1_107]
set_property SLEW SLOW [get_ports X1_1_107]

set_property PACKAGE_PIN AD23 [get_ports X1_1_108]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_108]
set_property DRIVE 8 [get_ports X1_1_108]
set_property SLEW SLOW [get_ports X1_1_108]

set_property PACKAGE_PIN AD24 [get_ports X1_1_109]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_109]
set_property DRIVE 8 [get_ports X1_1_109]
set_property SLEW SLOW [get_ports X1_1_109]

set_property PACKAGE_PIN AC23 [get_ports X1_1_110]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_110]
set_property DRIVE 8 [get_ports X1_1_110]
set_property SLEW SLOW [get_ports X1_1_110]

set_property PACKAGE_PIN AC24 [get_ports X1_1_111]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_111]
set_property DRIVE 8 [get_ports X1_1_111]
set_property SLEW SLOW [get_ports X1_1_111]

#Bytegroup t2

set_property PACKAGE_PIN AD20 [get_ports X1_1_200]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_200]
set_property DRIVE 8 [get_ports X1_1_200]
set_property SLEW SLOW [get_ports X1_1_200]

set_property PACKAGE_PIN AD21 [get_ports X1_1_201]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_201]
set_property DRIVE 8 [get_ports X1_1_201]
set_property SLEW SLOW [get_ports X1_1_201]

set_property PACKAGE_PIN AC21 [get_ports X1_1_202]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_202]
set_property DRIVE 8 [get_ports X1_1_202]
set_property SLEW SLOW [get_ports X1_1_202]

set_property PACKAGE_PIN AC22 [get_ports X1_1_203]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_203]
set_property DRIVE 8 [get_ports X1_1_203]
set_property SLEW SLOW [get_ports X1_1_203]

set_property PACKAGE_PIN AF19 [get_ports X1_1_204]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_204]
set_property DRIVE 8 [get_ports X1_1_204]
set_property SLEW SLOW [get_ports X1_1_204]

set_property PACKAGE_PIN AF20 [get_ports X1_1_205]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_205]
set_property DRIVE 8 [get_ports X1_1_205]
set_property SLEW SLOW [get_ports X1_1_205]

set_property PACKAGE_PIN AE20 [get_ports X1_1_206]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_206]
set_property DRIVE 8 [get_ports X1_1_206]
set_property SLEW SLOW [get_ports X1_1_206]

set_property PACKAGE_PIN AE21 [get_ports X1_1_207]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_207]
set_property DRIVE 8 [get_ports X1_1_207]
set_property SLEW SLOW [get_ports X1_1_207]

set_property PACKAGE_PIN AD18 [get_ports X1_1_208]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_208]
set_property DRIVE 8 [get_ports X1_1_208]
set_property SLEW SLOW [get_ports X1_1_208]

set_property PACKAGE_PIN AD19 [get_ports X1_1_209]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_209]
set_property DRIVE 8 [get_ports X1_1_209]
set_property SLEW SLOW [get_ports X1_1_209]

set_property PACKAGE_PIN AE18 [get_ports X1_1_210]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_210]
set_property DRIVE 8 [get_ports X1_1_210]
set_property SLEW SLOW [get_ports X1_1_210]

set_property PACKAGE_PIN AF18 [get_ports X1_1_211]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_211]
set_property DRIVE 8 [get_ports X1_1_211]
set_property SLEW SLOW [get_ports X1_1_211]

#Bytegroup t3

set_property PACKAGE_PIN W20 [get_ports X1_1_300]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_300]
set_property DRIVE 8 [get_ports X1_1_300]
set_property SLEW SLOW [get_ports X1_1_300]

set_property PACKAGE_PIN Y20 [get_ports X1_1_301]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_301]
set_property DRIVE 8 [get_ports X1_1_301]
set_property SLEW SLOW [get_ports X1_1_301]

set_property PACKAGE_PIN AA20 [get_ports X1_1_302]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_302]
set_property DRIVE 8 [get_ports X1_1_302]
set_property SLEW SLOW [get_ports X1_1_302]

set_property PACKAGE_PIN AB20 [get_ports X1_1_303]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_303]
set_property DRIVE 8 [get_ports X1_1_303]
set_property SLEW SLOW [get_ports X1_1_303]

set_property PACKAGE_PIN AC18 [get_ports X1_1_304]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_304]
set_property DRIVE 8 [get_ports X1_1_304]
set_property SLEW SLOW [get_ports X1_1_304]

set_property PACKAGE_PIN AC19 [get_ports X1_1_305]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_305]
set_property DRIVE 8 [get_ports X1_1_305]
set_property SLEW SLOW [get_ports X1_1_305]

set_property PACKAGE_PIN AA19 [get_ports X1_1_306]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_306]
set_property DRIVE 8 [get_ports X1_1_306]
set_property SLEW SLOW [get_ports X1_1_306]

set_property PACKAGE_PIN AB19 [get_ports X1_1_307]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_307]
set_property DRIVE 8 [get_ports X1_1_307]
set_property SLEW SLOW [get_ports X1_1_307]

set_property PACKAGE_PIN W18 [get_ports X1_1_308]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_308]
set_property DRIVE 8 [get_ports X1_1_308]
set_property SLEW SLOW [get_ports X1_1_308]

set_property PACKAGE_PIN W19 [get_ports X1_1_309]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_309]
set_property DRIVE 8 [get_ports X1_1_309]
set_property SLEW SLOW [get_ports X1_1_309]

set_property PACKAGE_PIN Y18 [get_ports X1_1_310]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_310]
set_property DRIVE 8 [get_ports X1_1_310]
set_property SLEW SLOW [get_ports X1_1_310]

set_property PACKAGE_PIN AA18 [get_ports X1_1_311]
set_property IOSTANDARD LVCMOS33 [get_ports X1_1_311]
set_property DRIVE 8 [get_ports X1_1_311]
set_property SLEW SLOW [get_ports X1_1_311]

#############################################################################
# X1_2 Connections                                                          #
#############################################################################

#Bytegroup t0

set_property PACKAGE_PIN Y12 [get_ports X1_2_000]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_000]
set_property DRIVE 8 [get_ports X1_2_000]
set_property SLEW SLOW [get_ports X1_2_000]

set_property PACKAGE_PIN Y11 [get_ports X1_2_001]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_001]
set_property DRIVE 8 [get_ports X1_2_001]
set_property SLEW SLOW [get_ports X1_2_001]

set_property PACKAGE_PIN AB12 [get_ports X1_2_002]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_002]
set_property DRIVE 8 [get_ports X1_2_002]
set_property SLEW SLOW [get_ports X1_2_002]

set_property PACKAGE_PIN AC11 [get_ports X1_2_003]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_003]
set_property DRIVE 8 [get_ports X1_2_003]
set_property SLEW SLOW [get_ports X1_2_003]

set_property PACKAGE_PIN Y10 [get_ports X1_2_004]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_004]
set_property DRIVE 8 [get_ports X1_2_004]
set_property SLEW SLOW [get_ports X1_2_004]

set_property PACKAGE_PIN AA10 [get_ports X1_2_005]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_005]
set_property DRIVE 8 [get_ports X1_2_005]
set_property SLEW SLOW [get_ports X1_2_005]

set_property PACKAGE_PIN AB11 [get_ports X1_2_006]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_006]
set_property DRIVE 8 [get_ports X1_2_006]
set_property SLEW SLOW [get_ports X1_2_006]

set_property PACKAGE_PIN AB10 [get_ports X1_2_007]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_007]
set_property DRIVE 8 [get_ports X1_2_007]
set_property SLEW SLOW [get_ports X1_2_007]

set_property PACKAGE_PIN W13 [get_ports X1_2_008]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_008]
set_property DRIVE 8 [get_ports X1_2_008]
set_property SLEW SLOW [get_ports X1_2_008]

set_property PACKAGE_PIN Y13 [get_ports X1_2_009]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_009]
set_property DRIVE 8 [get_ports X1_2_009]
set_property SLEW SLOW [get_ports X1_2_009]

set_property PACKAGE_PIN AA13 [get_ports X1_2_010]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_010]
set_property DRIVE 8 [get_ports X1_2_010]
set_property SLEW SLOW [get_ports X1_2_010]

set_property PACKAGE_PIN AA12 [get_ports X1_2_011]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_011]
set_property DRIVE 8 [get_ports X1_2_011]
set_property SLEW SLOW [get_ports X1_2_011]

#Bytegroup t1

set_property PACKAGE_PIN AE10 [get_ports X1_2_100]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_100]
set_property DRIVE 8 [get_ports X1_2_100]
set_property SLEW SLOW [get_ports X1_2_100]

set_property PACKAGE_PIN AD10 [get_ports X1_2_101]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_101]
set_property DRIVE 8 [get_ports X1_2_101]
set_property SLEW SLOW [get_ports X1_2_101]

set_property PACKAGE_PIN AE12 [get_ports X1_2_102]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_102]
set_property DRIVE 8 [get_ports X1_2_102]
set_property SLEW SLOW [get_ports X1_2_102]

set_property PACKAGE_PIN AF12 [get_ports X1_2_103]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_103]
set_property DRIVE 8 [get_ports X1_2_103]
set_property SLEW SLOW [get_ports X1_2_103]

set_property PACKAGE_PIN AE11 [get_ports X1_2_104]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_104]
set_property DRIVE 8 [get_ports X1_2_104]
set_property SLEW SLOW [get_ports X1_2_104]

set_property PACKAGE_PIN AF10 [get_ports X1_2_105]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_105]
set_property DRIVE 8 [get_ports X1_2_105]
set_property SLEW SLOW [get_ports X1_2_105]

set_property PACKAGE_PIN AE13 [get_ports X1_2_106]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_106]
set_property DRIVE 8 [get_ports X1_2_106]
set_property SLEW SLOW [get_ports X1_2_106]

set_property PACKAGE_PIN AF13 [get_ports X1_2_107]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_107]
set_property DRIVE 8 [get_ports X1_2_107]
set_property SLEW SLOW [get_ports X1_2_107]

set_property PACKAGE_PIN AC12 [get_ports X1_2_108]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_108]
set_property DRIVE 8 [get_ports X1_2_108]
set_property SLEW SLOW [get_ports X1_2_108]

set_property PACKAGE_PIN AD11 [get_ports X1_2_109]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_109]
set_property DRIVE 8 [get_ports X1_2_109]
set_property SLEW SLOW [get_ports X1_2_109]

set_property IOSTANDARD LVDS_25 [get_ports X1_2_110]

set_property PACKAGE_PIN AC13 [get_ports X1_2_110]
set_property PACKAGE_PIN AD13 [get_ports X1_2_111]
set_property IOSTANDARD LVDS_25 [get_ports X1_2_111]

#Bytegroup t2

set_property PACKAGE_PIN AC14 [get_ports X1_2_200]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_200]

set_property PACKAGE_PIN AD14 [get_ports X1_2_201]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_201]

set_property PACKAGE_PIN AB15 [get_ports X1_2_202]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_202]
set_property DRIVE 8 [get_ports X1_2_202]
set_property SLEW SLOW [get_ports X1_2_202]

set_property PACKAGE_PIN AB14 [get_ports X1_2_203]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_203]
set_property DRIVE 8 [get_ports X1_2_203]
set_property SLEW SLOW [get_ports X1_2_203]

set_property PACKAGE_PIN AD16 [get_ports X1_2_204]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_204]
set_property DRIVE 8 [get_ports X1_2_204]
set_property SLEW SLOW [get_ports X1_2_204]

set_property PACKAGE_PIN AD15 [get_ports X1_2_205]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_205]
set_property DRIVE 8 [get_ports X1_2_205]
set_property SLEW SLOW [get_ports X1_2_205]

set_property PACKAGE_PIN AF15 [get_ports X1_2_206]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_206]
set_property DRIVE 8 [get_ports X1_2_206]
set_property SLEW SLOW [get_ports X1_2_206]

set_property PACKAGE_PIN AF14 [get_ports X1_2_207]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_207]
set_property DRIVE 8 [get_ports X1_2_207]
set_property SLEW SLOW [get_ports X1_2_207]

set_property PACKAGE_PIN AE16 [get_ports X1_2_208]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_208]
set_property DRIVE 8 [get_ports X1_2_208]
set_property SLEW SLOW [get_ports X1_2_208]

set_property PACKAGE_PIN AE15 [get_ports X1_2_209]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_209]
set_property DRIVE 8 [get_ports X1_2_209]
set_property SLEW SLOW [get_ports X1_2_209]

set_property PACKAGE_PIN AE17 [get_ports X1_2_210]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_210]
set_property DRIVE 8 [get_ports X1_2_210]
set_property SLEW SLOW [get_ports X1_2_210]

set_property PACKAGE_PIN AF17 [get_ports X1_2_211]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_211]
set_property DRIVE 8 [get_ports X1_2_211]
set_property SLEW SLOW [get_ports X1_2_211]

#Bytegroup t3

set_property PACKAGE_PIN Y17 [get_ports X1_2_300]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_300]
set_property DRIVE 8 [get_ports X1_2_300]
set_property SLEW SLOW [get_ports X1_2_300]

set_property PACKAGE_PIN AA17 [get_ports X1_2_301]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_301]
set_property DRIVE 8 [get_ports X1_2_301]
set_property SLEW SLOW [get_ports X1_2_301]

set_property PACKAGE_PIN AB17 [get_ports X1_2_302]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_302]
set_property DRIVE 8 [get_ports X1_2_302]
set_property SLEW SLOW [get_ports X1_2_302]

set_property PACKAGE_PIN AB16 [get_ports X1_2_303]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_303]
set_property DRIVE 8 [get_ports X1_2_303]
set_property SLEW SLOW [get_ports X1_2_303]

set_property PACKAGE_PIN AC17 [get_ports X1_2_304]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_304]
set_property DRIVE 8 [get_ports X1_2_304]
set_property SLEW SLOW [get_ports X1_2_304]

set_property PACKAGE_PIN AC16 [get_ports X1_2_305]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_305]
set_property DRIVE 8 [get_ports X1_2_305]
set_property SLEW SLOW [get_ports X1_2_305]

set_property PACKAGE_PIN AA15 [get_ports X1_2_306]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_306]
set_property DRIVE 8 [get_ports X1_2_306]
set_property SLEW SLOW [get_ports X1_2_306]

set_property PACKAGE_PIN AA14 [get_ports X1_2_307]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_307]
set_property DRIVE 8 [get_ports X1_2_307]
set_property SLEW SLOW [get_ports X1_2_307]

set_property PACKAGE_PIN Y16 [get_ports X1_2_308]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_308]
set_property DRIVE 8 [get_ports X1_2_308]
set_property SLEW SLOW [get_ports X1_2_308]

set_property PACKAGE_PIN Y15 [get_ports X1_2_309]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_309]
set_property DRIVE 8 [get_ports X1_2_309]
set_property SLEW SLOW [get_ports X1_2_309]

set_property PACKAGE_PIN W16 [get_ports X1_2_310]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_310]
set_property DRIVE 8 [get_ports X1_2_310]
set_property SLEW SLOW [get_ports X1_2_310]

set_property PACKAGE_PIN W15 [get_ports X1_2_311]
set_property IOSTANDARD LVCMOS33 [get_ports X1_2_311]
set_property DRIVE 8 [get_ports X1_2_311]
set_property SLEW SLOW [get_ports X1_2_311]

#############################################################################
# X1_MGT Connections                                                        #
#############################################################################

set_property PACKAGE_PIN AB3 [get_ports X1_MGT_RX_04_N]
set_property PACKAGE_PIN AB4 [get_ports X1_MGT_RX_04_P]
set_property PACKAGE_PIN AA1 [get_ports X1_MGT_TX_04_N]
set_property PACKAGE_PIN AA2 [get_ports X1_MGT_TX_04_P]
set_property PACKAGE_PIN Y3 [get_ports X1_MGT_RX_05_N]
set_property PACKAGE_PIN Y4 [get_ports X1_MGT_RX_05_P]
set_property PACKAGE_PIN W1 [get_ports X1_MGT_TX_05_N]
set_property PACKAGE_PIN W2 [get_ports X1_MGT_TX_05_P]
set_property PACKAGE_PIN V3 [get_ports X1_MGT_RX_06_N]
set_property PACKAGE_PIN V4 [get_ports X1_MGT_RX_06_P]
set_property PACKAGE_PIN U1 [get_ports X1_MGT_TX_06_N]
set_property PACKAGE_PIN U2 [get_ports X1_MGT_TX_06_P]
set_property PACKAGE_PIN T3 [get_ports X1_MGT_RX_07_N]
set_property PACKAGE_PIN T4 [get_ports X1_MGT_RX_07_P]
set_property PACKAGE_PIN R1 [get_ports X1_MGT_TX_07_N]
set_property PACKAGE_PIN R2 [get_ports X1_MGT_TX_07_P]

set_property PACKAGE_PIN R6 [get_ports X1_MGT_CLK_1_P]
set_property PACKAGE_PIN R5 [get_ports X1_MGT_CLK_1_N]


#############################################################################
# X2_1 Connections                                                          #
#############################################################################

#Bytegroup t0

set_property PACKAGE_PIN F12 [get_ports X2_1_000]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_000]
set_property DRIVE 8 [get_ports X2_1_000]
set_property SLEW SLOW [get_ports X2_1_000]

set_property PACKAGE_PIN E12 [get_ports X2_1_001]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_001]
set_property DRIVE 8 [get_ports X2_1_001]
set_property SLEW SLOW [get_ports X2_1_001]

set_property PACKAGE_PIN E10 [get_ports X2_1_002]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_002]
set_property DRIVE 8 [get_ports X2_1_002]
set_property SLEW SLOW [get_ports X2_1_002]

set_property PACKAGE_PIN D10 [get_ports X2_1_003]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_003]
set_property DRIVE 8 [get_ports X2_1_003]
set_property SLEW SLOW [get_ports X2_1_003]

set_property PACKAGE_PIN G10 [get_ports X2_1_004]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_004]
set_property DRIVE 8 [get_ports X2_1_004]
set_property SLEW SLOW [get_ports X2_1_004]

set_property PACKAGE_PIN F10 [get_ports X2_1_005]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_005]
set_property DRIVE 8 [get_ports X2_1_005]
set_property SLEW SLOW [get_ports X2_1_005]

set_property PACKAGE_PIN E11 [get_ports X2_1_006]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_006]
set_property DRIVE 8 [get_ports X2_1_006]
set_property SLEW SLOW [get_ports X2_1_006]

set_property PACKAGE_PIN D11 [get_ports X2_1_007]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_007]
set_property DRIVE 8 [get_ports X2_1_007]
set_property SLEW SLOW [get_ports X2_1_007]

# Ethernet 1 MDIO

set_property PACKAGE_PIN G12 [get_ports X2_1_008]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_008]
set_property DRIVE 8 [get_ports X2_1_008]
set_property SLEW SLOW [get_ports X2_1_008]
set_property PULLUP true [get_ports X2_1_008]
set_property PIO_DIRECTION BIDIR [get_ports X2_1_008]

# Ethernet 1 MDC

set_property PACKAGE_PIN G11 [get_ports X2_1_009]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_009]
set_property DRIVE 8 [get_ports X2_1_009]
set_property SLEW SLOW [get_ports X2_1_009]
set_property PULLUP true [get_ports X2_1_009]
set_property PIO_DIRECTION OUTPUT [get_ports X2_1_009]

set_property PACKAGE_PIN F13 [get_ports X2_1_010]

set_property PACKAGE_PIN E13 [get_ports X2_1_011]

#Bytegroup t1

set_property PACKAGE_PIN H13 [get_ports X2_1_100]

set_property PACKAGE_PIN H12 [get_ports X2_1_101]

set_property PACKAGE_PIN K13 [get_ports X2_1_102]

set_property PACKAGE_PIN J13 [get_ports X2_1_103]
set_property DRIVE 8 [get_ports X2_1_103]

set_property PACKAGE_PIN K15 [get_ports X2_1_104]
set_property DRIVE 8 [get_ports X2_1_104]

set_property PACKAGE_PIN J15 [get_ports X2_1_105]
set_property DRIVE 8 [get_ports X2_1_105]

set_property PACKAGE_PIN G16 [get_ports X2_1_106]
set_property DRIVE 8 [get_ports X2_1_106]

set_property PACKAGE_PIN G15 [get_ports X2_1_107]
set_property DRIVE 8 [get_ports X2_1_107]

set_property PACKAGE_PIN G14 [get_ports X2_1_108]
set_property DRIVE 8 [get_ports X2_1_108]

set_property PACKAGE_PIN F14 [get_ports X2_1_109]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_109]
set_property DRIVE 8 [get_ports X2_1_109]
set_property SLEW SLOW [get_ports X2_1_109]

set_property PACKAGE_PIN J14 [get_ports X2_1_110]

set_property PACKAGE_PIN H14 [get_ports X2_1_111]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_111]
set_property DRIVE 8 [get_ports X2_1_111]
set_property SLEW SLOW [get_ports X2_1_111]

#Bytegroup t2

set_property PACKAGE_PIN D15 [get_ports X2_1_200]

set_property PACKAGE_PIN D14 [get_ports X2_1_201]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_201]
set_property DRIVE 8 [get_ports X2_1_201]
set_property SLEW SLOW [get_ports X2_1_201]

set_property PACKAGE_PIN F15 [get_ports X2_1_202]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_202]
set_property DRIVE 8 [get_ports X2_1_202]
set_property SLEW SLOW [get_ports X2_1_202]

set_property PACKAGE_PIN E15 [get_ports X2_1_203]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_203]
set_property DRIVE 8 [get_ports X2_1_203]
set_property SLEW SLOW [get_ports X2_1_203]

set_property PACKAGE_PIN C17 [get_ports X2_1_204]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_204]
set_property DRIVE 8 [get_ports X2_1_204]
set_property SLEW SLOW [get_ports X2_1_204]

set_property PACKAGE_PIN C16 [get_ports X2_1_205]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_205]
set_property DRIVE 8 [get_ports X2_1_205]
set_property SLEW SLOW [get_ports X2_1_205]

set_property PACKAGE_PIN E16 [get_ports X2_1_206]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_206]
set_property DRIVE 8 [get_ports X2_1_206]
set_property SLEW SLOW [get_ports X2_1_206]

set_property PACKAGE_PIN D16 [get_ports X2_1_207]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_207]
set_property DRIVE 8 [get_ports X2_1_207]
set_property SLEW SLOW [get_ports X2_1_207]

set_property PACKAGE_PIN B16 [get_ports X2_1_208]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_208]
set_property DRIVE 8 [get_ports X2_1_208]
set_property SLEW SLOW [get_ports X2_1_208]

set_property PACKAGE_PIN B15 [get_ports X2_1_209]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_209]
set_property DRIVE 8 [get_ports X2_1_209]
set_property SLEW SLOW [get_ports X2_1_209]

set_property PACKAGE_PIN B17 [get_ports X2_1_210]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_210]
set_property DRIVE 8 [get_ports X2_1_210]
set_property SLEW SLOW [get_ports X2_1_210]

set_property PACKAGE_PIN A17 [get_ports X2_1_211]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_211]
set_property DRIVE 8 [get_ports X2_1_211]
set_property SLEW SLOW [get_ports X2_1_211]

#Bytegroup t3

set_property PACKAGE_PIN D13 [get_ports X2_1_300]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_300]
set_property DRIVE 8 [get_ports X2_1_300]
set_property SLEW SLOW [get_ports X2_1_300]

set_property PACKAGE_PIN C13 [get_ports X2_1_301]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_301]
set_property DRIVE 8 [get_ports X2_1_301]
set_property SLEW SLOW [get_ports X2_1_301]

set_property PACKAGE_PIN C14 [get_ports X2_1_302]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_302]
set_property DRIVE 8 [get_ports X2_1_302]
set_property SLEW SLOW [get_ports X2_1_302]

set_property PACKAGE_PIN B14 [get_ports X2_1_303]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_303]
set_property DRIVE 8 [get_ports X2_1_303]
set_property SLEW SLOW [get_ports X2_1_303]

set_property PACKAGE_PIN A15 [get_ports X2_1_304]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_304]
set_property DRIVE 8 [get_ports X2_1_304]
set_property SLEW SLOW [get_ports X2_1_304]

set_property PACKAGE_PIN A14 [get_ports X2_1_305]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_305]
set_property DRIVE 8 [get_ports X2_1_305]
set_property SLEW SLOW [get_ports X2_1_305]

set_property PACKAGE_PIN C12 [get_ports X2_1_306]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_306]
set_property DRIVE 8 [get_ports X2_1_306]
set_property SLEW SLOW [get_ports X2_1_306]

set_property PACKAGE_PIN B12 [get_ports X2_1_307]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_307]
set_property DRIVE 8 [get_ports X2_1_307]
set_property SLEW SLOW [get_ports X2_1_307]

set_property PACKAGE_PIN C11 [get_ports X2_1_308]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_308]
set_property DRIVE 8 [get_ports X2_1_308]
set_property SLEW SLOW [get_ports X2_1_308]

set_property PACKAGE_PIN B11 [get_ports X2_1_309]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_309]
set_property DRIVE 8 [get_ports X2_1_309]
set_property SLEW SLOW [get_ports X2_1_309]

set_property PACKAGE_PIN A13 [get_ports X2_1_310]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_310]
set_property DRIVE 8 [get_ports X2_1_310]
set_property SLEW SLOW [get_ports X2_1_310]

set_property PACKAGE_PIN A12 [get_ports X2_1_311]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_311]
set_property DRIVE 8 [get_ports X2_1_311]
set_property SLEW SLOW [get_ports X2_1_311]

#############################################################################
# X2_2 Connections                                                          #
#############################################################################

#Bytegroup t0

set_property PACKAGE_PIN J11 [get_ports X2_2_000]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_000]
set_property DRIVE 8 [get_ports X2_2_000]
set_property SLEW SLOW [get_ports X2_2_000]

set_property PACKAGE_PIN H11 [get_ports X2_2_001]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_001]
set_property DRIVE 8 [get_ports X2_2_001]
set_property SLEW SLOW [get_ports X2_2_001]

set_property PACKAGE_PIN G6 [get_ports X2_2_002]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_002]
set_property DRIVE 8 [get_ports X2_2_002]
set_property SLEW SLOW [get_ports X2_2_002]

set_property PACKAGE_PIN G5 [get_ports X2_2_003]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_003]
set_property DRIVE 8 [get_ports X2_2_003]
set_property SLEW SLOW [get_ports X2_2_003]

set_property PACKAGE_PIN H9 [get_ports X2_2_004]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_004]
set_property DRIVE 8 [get_ports X2_2_004]
set_property SLEW SLOW [get_ports X2_2_004]

set_property PACKAGE_PIN G9 [get_ports X2_2_005]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_005]
set_property DRIVE 8 [get_ports X2_2_005]
set_property SLEW SLOW [get_ports X2_2_005]

set_property PACKAGE_PIN H7 [get_ports X2_2_006]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_006]
set_property DRIVE 8 [get_ports X2_2_006]
set_property SLEW SLOW [get_ports X2_2_006]

set_property PACKAGE_PIN H6 [get_ports X2_2_007]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_007]
set_property DRIVE 8 [get_ports X2_2_007]
set_property SLEW SLOW [get_ports X2_2_007]

set_property PACKAGE_PIN J10 [get_ports X2_2_008]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_008]
set_property DRIVE 8 [get_ports X2_2_008]
set_property SLEW SLOW [get_ports X2_2_008]

set_property PACKAGE_PIN J9 [get_ports X2_2_009]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_009]
set_property DRIVE 8 [get_ports X2_2_009]
set_property SLEW SLOW [get_ports X2_2_009]

set_property PACKAGE_PIN J8 [get_ports X2_2_010]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_010]
set_property DRIVE 8 [get_ports X2_2_010]
set_property SLEW SLOW [get_ports X2_2_010]

set_property PACKAGE_PIN H8 [get_ports X2_2_011]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_011]
set_property DRIVE 8 [get_ports X2_2_011]
set_property SLEW SLOW [get_ports X2_2_011]

#Bytegroup t1

set_property PACKAGE_PIN F5 [get_ports X2_2_100]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_100]
set_property DRIVE 8 [get_ports X2_2_100]
set_property SLEW SLOW [get_ports X2_2_100]

set_property PACKAGE_PIN E5 [get_ports X2_2_101]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_101]
set_property DRIVE 8 [get_ports X2_2_101]
set_property SLEW SLOW [get_ports X2_2_101]

set_property PACKAGE_PIN D9 [get_ports X2_2_102]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_102]
set_property DRIVE 8 [get_ports X2_2_102]
set_property SLEW SLOW [get_ports X2_2_102]

set_property PACKAGE_PIN D8 [get_ports X2_2_103]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_103]
set_property DRIVE 8 [get_ports X2_2_103]
set_property SLEW SLOW [get_ports X2_2_103]

set_property PACKAGE_PIN F9 [get_ports X2_2_104]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_104]
set_property DRIVE 8 [get_ports X2_2_104]
set_property SLEW SLOW [get_ports X2_2_104]

set_property PACKAGE_PIN E8 [get_ports X2_2_105]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_105]
set_property DRIVE 8 [get_ports X2_2_105]
set_property SLEW SLOW [get_ports X2_2_105]

set_property PACKAGE_PIN E6 [get_ports X2_2_106]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_106]
set_property DRIVE 8 [get_ports X2_2_106]
set_property SLEW SLOW [get_ports X2_2_106]

set_property PACKAGE_PIN D5 [get_ports X2_2_107]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_107]
set_property DRIVE 8 [get_ports X2_2_107]
set_property SLEW SLOW [get_ports X2_2_107]

set_property PACKAGE_PIN F8 [get_ports X2_2_108]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_108]
set_property DRIVE 8 [get_ports X2_2_108]
set_property SLEW SLOW [get_ports X2_2_108]

set_property PACKAGE_PIN E7 [get_ports X2_2_109]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_109]
set_property DRIVE 8 [get_ports X2_2_109]
set_property SLEW SLOW [get_ports X2_2_109]

set_property PACKAGE_PIN G7 [get_ports X2_2_110]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_110]
set_property DRIVE 8 [get_ports X2_2_110]
set_property SLEW SLOW [get_ports X2_2_110]

set_property PACKAGE_PIN F7 [get_ports X2_2_111]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_111]
set_property DRIVE 8 [get_ports X2_2_111]
set_property SLEW SLOW [get_ports X2_2_111]

#Bytegroup t2

set_property PACKAGE_PIN C8 [get_ports X2_2_200]
set_property IOSTANDARD LVCMOS18 [get_ports X2_1_200]
set_property DRIVE 8 [get_ports X2_2_200]
set_property SLEW SLOW [get_ports X2_2_200]

set_property PACKAGE_PIN C7 [get_ports X2_2_201]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_201]
set_property DRIVE 8 [get_ports X2_2_201]
set_property SLEW SLOW [get_ports X2_2_201]

set_property PACKAGE_PIN D6 [get_ports X2_2_202]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_202]
set_property DRIVE 8 [get_ports X2_2_202]
set_property SLEW SLOW [get_ports X2_2_202]

set_property PACKAGE_PIN C6 [get_ports X2_2_203]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_203]
set_property DRIVE 8 [get_ports X2_2_203]
set_property SLEW SLOW [get_ports X2_2_203]

set_property PACKAGE_PIN C9 [get_ports X2_2_204]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_204]
set_property DRIVE 8 [get_ports X2_2_204]
set_property SLEW SLOW [get_ports X2_2_204]

set_property PACKAGE_PIN B9 [get_ports X2_2_205]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_205]
set_property DRIVE 8 [get_ports X2_2_205]
set_property SLEW SLOW [get_ports X2_2_205]

set_property PACKAGE_PIN B10 [get_ports X2_2_206]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_206]
set_property DRIVE 8 [get_ports X2_2_206]
set_property SLEW SLOW [get_ports X2_2_206]

set_property PACKAGE_PIN A10 [get_ports X2_2_207]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_207]
set_property DRIVE 8 [get_ports X2_2_207]
set_property SLEW SLOW [get_ports X2_2_207]

set_property PACKAGE_PIN A9 [get_ports X2_2_208]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_208]
set_property DRIVE 8 [get_ports X2_2_208]
set_property SLEW SLOW [get_ports X2_2_208]

set_property PACKAGE_PIN A8 [get_ports X2_2_209]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_209]
set_property DRIVE 8 [get_ports X2_2_209]
set_property SLEW SLOW [get_ports X2_2_209]

set_property PACKAGE_PIN B7 [get_ports X2_2_210]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_210]
set_property DRIVE 8 [get_ports X2_2_210]
set_property SLEW SLOW [get_ports X2_2_210]

set_property PACKAGE_PIN A7 [get_ports X2_2_211]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_211]
set_property DRIVE 8 [get_ports X2_2_211]
set_property SLEW SLOW [get_ports X2_2_211]

#Bytegroup t3

set_property PACKAGE_PIN C4 [get_ports X2_2_300]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_300]
set_property DRIVE 8 [get_ports X2_2_300]
set_property SLEW SLOW [get_ports X2_2_300]

set_property PACKAGE_PIN C3 [get_ports X2_2_301]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_301]
set_property DRIVE 8 [get_ports X2_2_301]
set_property SLEW SLOW [get_ports X2_2_301]

set_property PACKAGE_PIN B5 [get_ports X2_2_302]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_302]
set_property DRIVE 8 [get_ports X2_2_302]
set_property SLEW SLOW [get_ports X2_2_302]

set_property PACKAGE_PIN B4 [get_ports X2_2_303]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_303]
set_property DRIVE 8 [get_ports X2_2_303]
set_property SLEW SLOW [get_ports X2_2_303]

set_property PACKAGE_PIN B6 [get_ports X2_2_304]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_304]
set_property DRIVE 8 [get_ports X2_2_304]
set_property SLEW SLOW [get_ports X2_2_304]

set_property PACKAGE_PIN A5 [get_ports X2_2_305]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_305]
set_property DRIVE 8 [get_ports X2_2_305]
set_property SLEW SLOW [get_ports X2_2_305]

set_property PACKAGE_PIN A4 [get_ports X2_2_306]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_306]
set_property DRIVE 8 [get_ports X2_2_306]
set_property SLEW SLOW [get_ports X2_2_306]

set_property PACKAGE_PIN A3 [get_ports X2_2_307]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_307]
set_property DRIVE 8 [get_ports X2_2_307]
set_property SLEW SLOW [get_ports X2_2_307]

set_property PACKAGE_PIN C2 [get_ports X2_2_308]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_308]
set_property DRIVE 8 [get_ports X2_2_308]
set_property SLEW SLOW [get_ports X2_2_308]

set_property PACKAGE_PIN B1 [get_ports X2_2_309]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_309]
set_property DRIVE 8 [get_ports X2_2_309]
set_property SLEW SLOW [get_ports X2_2_309]

set_property PACKAGE_PIN B2 [get_ports X2_2_310]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_310]
set_property DRIVE 8 [get_ports X2_2_310]
set_property SLEW SLOW [get_ports X2_2_310]

set_property PACKAGE_PIN A2 [get_ports X2_2_311]
set_property IOSTANDARD LVCMOS18 [get_ports X2_2_311]
set_property DRIVE 8 [get_ports X2_2_311]
set_property SLEW SLOW [get_ports X2_2_311]


# I got this:
#A False Path timing constraint is set between synchronous clocks dgrm_gmii2rgmii_1_0_rgmii_rx_clk and X2_1_110
#(see constraint position 75 in the Timing Constraint window in Vivado IDE). It is not recommended to cover
#synchronous clock domains with constraints that prevent timing analysis as the design could fail in hardware.
# so I deleted these:
create_clock -period 6.400 -name X1_MGT_CLK_1_P -waveform {0.000 3.200} [get_ports X1_MGT_CLK_1_P]
#create_clock -period 8.000 -name X2_1_110 -waveform {0.000 4.000} [get_ports X2_1_110]
create_clock -period 400.000 -name i_dgrm_wrapper/dgrm_i/processing_system7_0/inst/ENET1_MDIO_MDC -waveform {0.000 200.000} [get_pins i_dgrm_wrapper/dgrm_i/processing_system7_0/inst/PS7_i/EMIOENET1MDIOMDC]
set_false_path -to [get_pins -of [get_cells -hier -filter { name =~  *idelayctrl_reset_gen/*reset_sync* }] -filter {REF_PIN_NAME ==PRE }]







#this is bollox now set_false_path -from [get_pins i_dgrm_wrapper/dgrm_i/general_0/U0/aurora_pma_init_reg/C] -to [get_pins {aurora_channel_5/pma_init_stage_reg[31]_srl32/D}]
#this is bollox set_false_path -from [get_pins i_dgrm_wrapper/dgrm_i/general_0/U0/aurora_pma_init_reg/C] -to [get_pins aurora_channel_5/u_rst_sync_gtrsttmpi/stg1_aurora_64b66b_0_cdc_to_reg/D]
#this is bollox set_false_path -from [get_pins i_dgrm_wrapper/dgrm_i/general_0/U0/aurora_reset_reg/C] -to [get_pins {aurora_channel_5/aurora_64b66b_0_block_i/support_reset_logic_i/reset_debounce_r_reg[0]/D}]

#this is bollox set_false_path -from [get_pins aurora_channel_5/aurora_64b66b_0_block_i/support_reset_logic_i/gt_rst_r_reg/C] -to [get_pins aurora_channel_5/aurora_64b66b_0_block_i/support_reset_logic_i/u_rst_sync_gt/stg1_aurora_64b66b_0_cdc_to_reg/D]
#this is bollox set_false_path -from [get_pins aurora_channel_5/aurora_64b66b_0_block_i/support_reset_logic_i/gt_rst_r_reg/C] -to [get_pins aurora_channel_5/aurora_64b66b_0_block_i/support_reset_logic_i/u_rst_sync_gt/stg1_aurora_64b66b_0_cdc_to_reg/D]





# Anything below here is automatically written by the setup debug thingy.

# Seems I shouldn't set the false path below:
#TIMING #1 Critical Warning The clocks raw_clk and clk_fpga_2 are related (timed together) but they have no common primary clock.  The design could
#fail in hardware. To find a timing path between these clocks, run the following command: report_timing -from [get_clocks raw_clk] -to [get_clocks clk_fpga_2]
#set_false_path -from [get_clocks -of_objects [get_pins aurora_0/U_1/inst/plle2_adv_inst/CLKOUT0]] -to [get_clocks clk_fpga_2]

set_false_path -from [get_clocks -of_objects [get_pins aurora_0/master_0/inst/clock_module_i/mmcm_adv_inst/CLKOUT0]] -to [get_clocks clk_fpga_2]

