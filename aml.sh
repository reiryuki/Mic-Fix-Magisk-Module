MODPATH=${0%/*}

# patch audio platform info
#FILE=`find $MODPATH/system -type f -name *audio*platform*info*.xml`
#NAME='SND_DEVICE_IN_HANDSET_MIC
#      SND_DEVICE_IN_HANDSET_MIC_EXTERNAL
#      SND_DEVICE_IN_HANDSET_STEREO_DMIC
#      SND_DEVICE_IN_HANDSET_GENERIC_QMIC
#      SND_DEVICE_IN_HANDSET_DMIC_AEC_NS
#      SND_DEVICE_IN_SPEAKER_DMIC_AEC_NS
#      SND_DEVICE_IN_CAMCORDER_MIC
#      SND_DEVICE_IN_HEADSET_MIC
#      SND_DEVICE_IN_HEADSET_MIC_FLUENCE
#      SND_DEVICE_IN_USB_HEADSET_MIC
#      SND_DEVICE_IN_USB_HEADSET_HEX_MIC
#      SND_DEVICE_IN_USB_HEADSET_HEX_MIC_AEC
#      SND_DEVICE_IN_UNPROCESSED_MIC
#      SND_DEVICE_IN_UNPROCESSED_STEREO_MIC
#      SND_DEVICE_IN_UNPROCESSED_THREE_MIC
#      SND_DEVICE_IN_UNPROCESSED_QUAD_MIC
#      SND_DEVICE_IN_UNPROCESSED_HEADSET_MIC
#      SND_DEVICE_IN_UNPROCESSED_USB_HEADSET_MIC
#      SND_DEVICE_IN_UNPROCESSED_USB_HEADSET_HEX_MIC
#      SND_DEVICE_IN_VOICE_SPEAKER_MIC
#      SND_DEVICE_IN_VOICE_HEADSET_MIC
#      SND_DEVICE_IN_VOICE_REC_MIC
#      SND_DEVICE_IN_VOICE_REC_HEADSET_MIC
#      SND_DEVICE_IN_VOICE_REC_TMIC
#      SND_DEVICE_IN_VOICE_REC_QMIC_FLUENCE
#      SND_DEVICE_IN_VOICE_REC_DMIC_FLUENCE
#      SND_DEVICE_IN_VOICE_REC_MIC_AEC
#      SND_DEVICE_IN_VOICE_REC_MIC_NS
#      SND_DEVICE_IN_VOICE_RECOG_USB_HEADSET_MIC
#      SND_DEVICE_IN_VOICE_RECOG_USB_HEADSET_HEX_MIC'
#if [ "$FILE" ]; then
#  for NAMES in $NAME; do
#    if ! grep -Eq "$NAMES\" acdb_id" $FILE; then
#      sed -i "/<acdb_ids>/a\        <device name=\"$NAMES\" acdb_id=\"0\"\/>" $FILE
#    fi
#  done
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


