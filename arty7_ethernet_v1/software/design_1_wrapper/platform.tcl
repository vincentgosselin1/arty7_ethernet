# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Xilinx\Vivado\2021.1\myDev\arty7_ethernet_v1\arty7_ethernet_v1\software\design_1_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Xilinx\Vivado\2021.1\myDev\arty7_ethernet_v1\arty7_ethernet_v1\software\design_1_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {design_1_wrapper}\
-hw {C:\Xilinx\Vivado\2021.1\myDev\arty7_ethernet_v1\arty7_ethernet_v1\design_1_wrapper.xsa}\
-out {C:/Xilinx/Vivado/2021.1/myDev/arty7_ethernet_v1/arty7_ethernet_v1/software}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {lwip_echo_server}
platform generate -domains 
platform active {design_1_wrapper}
platform generate -quick
bsp reload
bsp config phy_link_speed "CONFIG_LINKSPEED100"
bsp config phy_link_speed "CONFIG_LINKSPEED100"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
bsp reload
platform generate
