MODPATH=${0%/*}

# patch audio platform info
#FILE=`find $MODPATH/system -type f -name *audio*platform*info*.xml`
#PART1=SND_DEVICE_IN_HANDSET_MIC
#PART2=SND_DEVICE_IN_HANDSET_MIC_EXTERNAL
#PART3=SND_DEVICE_IN_HANDSET_STEREO_DMIC
#PART4=SND_DEVICE_IN_CAMCORDER_MIC
#if [ "$FILE" ]; then
#  if ! grep -Eq "$PART4\" acdb_id" $FILE; then
#    sed -i "/<acdb_ids>/a\        <device name=\"$PART4\" acdb_id=\"0\"\/>" $FILE
#  fi
#  if ! grep -Eq "$PART3\" acdb_id" $FILE; then
#    sed -i "/<acdb_ids>/a\        <device name=\"$PART3\" acdb_id=\"0\"\/>" $FILE
#  fi
#  if ! grep -Eq "$PART2\" acdb_id" $FILE; then
#    sed -i "/<acdb_ids>/a\        <device name=\"$PART2\" acdb_id=\"0\"\/>" $FILE
#  fi
#  if ! grep -Eq "$PART1\" acdb_id" $FILE; then
#    sed -i "/<acdb_ids>/a\        <device name=\"$PART1\" acdb_id=\"0\"\/>" $FILE
#  fi
#fi

# function
patch_adc_volume() {
  sed -i "s/$OLD/$NEW/g" $FILE
  sed -i "s/$OLD1/$NEW/g" $FILE
  sed -i "s/$OLD2/$NEW/g" $FILE
  sed -i "s/$OLD3/$NEW/g" $FILE
  sed -i "s/$OLD4/$NEW/g" $FILE
  sed -i "s/$OLD5/$NEW/g" $FILE
  #addon1
}

# patch mixer paths
FILE=`find $MODPATH/system -type f -name *mixer*paths*.xml`
NUM=6
if [ "$FILE" ]; then
  NEW="\"ADC1 Volume\" value=\"$NUM\""
  OLD="\"ADC1 Volume\" value=\"0\""
  OLD1="\"ADC1 Volume\" value=\"1\""
  OLD2="\"ADC1 Volume\" value=\"2\""
  OLD3="\"ADC1 Volume\" value=\"3\""
  OLD4="\"ADC1 Volume\" value=\"4\""
  OLD5="\"ADC1 Volume\" value=\"5\""
  #addon2
  patch_adc_volume
  NEW="\"ADC2 Volume\" value=\"$NUM\""
  OLD="\"ADC2 Volume\" value=\"0\""
  OLD1="\"ADC2 Volume\" value=\"1\""
  OLD2="\"ADC2 Volume\" value=\"2\""
  OLD3="\"ADC2 Volume\" value=\"3\""
  OLD4="\"ADC2 Volume\" value=\"4\""
  OLD5="\"ADC2 Volume\" value=\"5\""
  #addon3
  patch_adc_volume
  NEW="\"ADC3 Volume\" value=\"$NUM\""
  OLD="\"ADC3 Volume\" value=\"0\""
  OLD1="\"ADC3 Volume\" value=\"1\""
  OLD2="\"ADC3 Volume\" value=\"2\""
  OLD3="\"ADC3 Volume\" value=\"3\""
  OLD4="\"ADC3 Volume\" value=\"4\""
  OLD5="\"ADC3 Volume\" value=\"5\""
  #addon4
  patch_adc_volume
fi


