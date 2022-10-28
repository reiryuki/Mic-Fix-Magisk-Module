mount -o rw,remount /data
MODPATH=${0%/*}
MODID=`echo "$MODPATH" | sed 's|/data/adb/modules/||'`

# cleaning
rm -rf /metadata/magisk/"$MODID"
rm -rf /mnt/vendor/persist/magisk/"$MODID"
rm -rf /persist/magisk/"$MODID"
rm -rf /data/unencrypted/magisk/"$MODID"
rm -rf /cache/magisk/"$MODID"


