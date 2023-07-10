mount -o rw,remount /data
[ -z $MODPATH ] && MODPATH=${0%/*}
[ -z $MODID ] && MODID=`basename "$MODPATH"`

# log
exec 2>$MODPATH\_uninstall.log
set -x

# run
. $MODPATH/function.sh

# cleaning
remove_sepolicy_rule






