
ifvc -label VC_SKIP_DN1
iomgrinstall -entry dnFBC -name /dnfbc -errlabel ERROR_DNFBC

creat -name /dnfbc/DNET_PCI: -pmode 0 -errlabel ERROR_DNFBC

task -slotname DNread -entp read_ts -pri 72 -vwopt 0x1c -stcks 10000 -nosync -auto
readparam -devicename /DNET_PCI:/bus_read -rmode 1 -buffersize 100
invoke -entry dnfbc_tk_activate -strarg "DNET" -nomode

# Add DeviceNet to system dump service
sysdmp_add -show dnfbc_sysdmp

goto -label VC_SKIP_DN2 

#VC_SKIP_DN1

creat -name /simfbc/DNET_PCI: -pmode 0

#VC_SKIP_DN2
#ERROR_DNFBC

###################################################################################


###################################################################################

# If cip safety option is present, spawn the recv task
setvar -var 15 -value 0
getKey -id "CIPADAPTER" -var 15 -strvar $DUMMY -errlabel END
ifvc -label VC_ENABLED
task -slotname tEnipSafety -entp ENIPSafetyRecvTask -pri 72 -vwopt 0x1c -stcks 32000 -nosync -auto -noreg
#VC_ENABLED
#END