(

MODPATH=${0%/*}

PROP=`getprop ro.build.version.sdk`
if [ "$PROP" -ge 24 ]; then
  killall audioserver
else
  killall mediaserver
fi

) 2>/dev/null


