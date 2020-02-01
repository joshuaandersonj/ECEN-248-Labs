#!/bin/sh -f
xv_path="/softwares/Linux/xilinx/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 2d4fe92675214a7e860490506096a2d3 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot combination_lock_fsm_tb_behav xil_defaultlib.combination_lock_fsm_tb xil_defaultlib.glbl -log elaborate.log
