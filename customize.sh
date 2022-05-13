ui_print " "

# magisk
if [ -d /sbin/.magisk ]; then
  MAGISKTMP=/sbin/.magisk
else
  MAGISKTMP=`find /dev -mindepth 2 -maxdepth 2 -type d -name .magisk`
fi

# info
MODVER=`grep_prop version $MODPATH/module.prop`
MODVERCODE=`grep_prop versionCode $MODPATH/module.prop`
ui_print " ID=$MODID"
ui_print " Version=$MODVER"
ui_print " VersionCode=$MODVERCODE"
ui_print " MagiskVersion=$MAGISK_VER"
ui_print " MagiskVersionCode=$MAGISK_VER_CODE"
ui_print " "

# sepolicy.rule
if [ "$BOOTMODE" != true ]; then
  mount -o rw -t auto /dev/block/bootdevice/by-name/persist /persist
  mount -o rw -t auto /dev/block/bootdevice/by-name/metadata /metadata
fi
FILE=$MODPATH/sepolicy.sh
DES=$MODPATH/sepolicy.rule
if [ -f $FILE ] && ! getprop | grep -Eq "sepolicy.sh\]: \[1"; then
  mv -f $FILE $DES
  sed -i 's/magiskpolicy --live "//g' $DES
  sed -i 's/"//g' $DES
fi

# .aml.sh
mv -f $MODPATH/aml.sh $MODPATH/.aml.sh

# cleaning
ui_print "- Cleaning..."
rm -f $MODPATH/LICENSE
rm -rf /metadata/magisk/$MODID
rm -rf /mnt/vendor/persist/magisk/$MODID
rm -rf /persist/magisk/$MODID
rm -rf /data/unencrypted/magisk/$MODID
rm -rf /cache/magisk/$MODID
ui_print " "

# volume
FILE=$MODPATH/.aml.sh
PROP=`getprop mic.volume`
if [ "$PROP" == 7 ]; then
  ui_print "- Using mic volume 7"
  sed -i 's/NUM=6/NUM=7/g' $FILE
  sed -i '/#addon1/a\
  sed -i "s/$OLD6/$NEW/g" $MODMP' $FILE
  sed -i '/#addon2/a\
  OLD6="\\"ADC1 Volume\\" value=\\"6\\""' $FILE
  sed -i '/#addon3/a\
  OLD6="\\"ADC2 Volume\\" value=\\"6\\""' $FILE
  sed -i '/#addon4/a\
  OLD6="\\"ADC3 Volume\\" value=\\"6\\""' $FILE
  ui_print " "
elif [ "$PROP" == 8 ]; then
  ui_print "- Using mic volume 8"
  sed -i 's/NUM=6/NUM=8/g' $FILE
  sed -i '/#addon1/a\
  sed -i "s/$OLD6/$NEW/g" $MODMP\
  sed -i "s/$OLD7/$NEW/g" $MODMP' $FILE
  sed -i '/#addon2/a\
  OLD6="\\"ADC1 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC1 Volume\\" value=\\"7\\""' $FILE
  sed -i '/#addon3/a\
  OLD6="\\"ADC2 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC2 Volume\\" value=\\"7\\""' $FILE
  sed -i '/#addon4/a\
  OLD6="\\"ADC3 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC3 Volume\\" value=\\"7\\""' $FILE
  ui_print " "
elif [ "$PROP" == 9 ]; then
  ui_print "- Using mic volume 9"
  sed -i 's/NUM=6/NUM=9/g' $FILE
  sed -i '/#addon1/a\
  sed -i "s/$OLD6/$NEW/g" $MODMP\
  sed -i "s/$OLD7/$NEW/g" $MODMP\
  sed -i "s/$OLD8/$NEW/g" $MODMP' $FILE
  sed -i '/#addon2/a\
  OLD6="\\"ADC1 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC1 Volume\\" value=\\"7\\""\
  OLD8="\\"ADC1 Volume\\" value=\\"8\\""' $FILE
  sed -i '/#addon3/a\
  OLD6="\\"ADC2 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC2 Volume\\" value=\\"7\\""\
  OLD8="\\"ADC2 Volume\\" value=\\"8\\""' $FILE
  sed -i '/#addon4/a\
  OLD6="\\"ADC3 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC3 Volume\\" value=\\"7\\""\
  OLD8="\\"ADC3 Volume\\" value=\\"8\\""' $FILE
  ui_print " "
elif [ "$PROP" == 10 ]; then
  ui_print "- Using mic volume 10"
  sed -i 's/NUM=6/NUM=10/g' $FILE
  sed -i '/#addon1/a\
  sed -i "s/$OLD6/$NEW/g" $MODMP\
  sed -i "s/$OLD7/$NEW/g" $MODMP\
  sed -i "s/$OLD8/$NEW/g" $MODMP\
  sed -i "s/$OLD9/$NEW/g" $MODMP' $FILE
  sed -i '/#addon2/a\
  OLD6="\\"ADC1 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC1 Volume\\" value=\\"7\\""\
  OLD8="\\"ADC1 Volume\\" value=\\"8\\""\
  OLD9="\\"ADC1 Volume\\" value=\\"9\\""' $FILE
  sed -i '/#addon3/a\
  OLD6="\\"ADC2 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC2 Volume\\" value=\\"7\\""\
  OLD8="\\"ADC2 Volume\\" value=\\"8\\""\
  OLD9="\\"ADC2 Volume\\" value=\\"9\\""' $FILE
  sed -i '/#addon4/a\
  OLD6="\\"ADC3 Volume\\" value=\\"6\\""\
  OLD7="\\"ADC3 Volume\\" value=\\"7\\""\
  OLD8="\\"ADC3 Volume\\" value=\\"8\\""\
  OLD9="\\"ADC3 Volume\\" value=\\"9\\""' $FILE
  ui_print " "
fi

# other
FILE=$MODPATH/service.sh
if getprop | grep -Eq "other.etc\]: \[1"; then
  ui_print "- Activating other etc files bind mount..."
  sed -i 's/#p//g' $FILE
  ui_print " "
fi

# permission
ui_print "- Setting permission..."
DIR=`find $MODPATH/system/vendor -type d`
for DIRS in $DIR; do
  chown 0.2000 $DIRS
done
if [ "$API" -ge 26 ]; then
  magiskpolicy --live "type vendor_file"
  magiskpolicy --live "type vendor_configs_file"
  magiskpolicy --live "dontaudit { vendor_file vendor_configs_file } labeledfs filesystem associate"
  magiskpolicy --live "allow     { vendor_file vendor_configs_file } labeledfs filesystem associate"
  magiskpolicy --live "dontaudit init { vendor_file vendor_configs_file } dir relabelfrom"
  magiskpolicy --live "allow     init { vendor_file vendor_configs_file } dir relabelfrom"
  magiskpolicy --live "dontaudit init { vendor_file vendor_configs_file } file relabelfrom"
  magiskpolicy --live "allow     init { vendor_file vendor_configs_file } file relabelfrom"
  chcon -R u:object_r:vendor_file:s0 $MODPATH/system/vendor
  chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc
  chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/odm/etc
fi
ui_print " "



