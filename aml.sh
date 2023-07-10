[ -z $MODPATH ] && MODPATH=${0%/*}

# destination
MODAPI=`find $MODPATH -type f -name *audio*platform*info*.xml`
MODMP=`find $MODPATH -type f -name *mixer*paths*.xml`

# function
patch_mixer_paths() {
NUM=6
ROWS=`grep '"ADC1 Volume"' $MODMP | sed -e 's|<ctl name="ADC1 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"ADC1 Volume\" value=\"$ROW\"|\"ADC1 Volume\" value=\"$NUM\"|g" $MODMP
done
ROWS=`grep '"ADC2 Volume"' $MODMP | sed -e 's|<ctl name="ADC2 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"ADC2 Volume\" value=\"$ROW\"|\"ADC2 Volume\" value=\"$NUM\"|g" $MODMP
done
ROWS=`grep '"ADC3 Volume"' $MODMP | sed -e 's|<ctl name="ADC3 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"ADC3 Volume\" value=\"$ROW\"|\"ADC3 Volume\" value=\"$NUM\"|g" $MODMP
done
NUM2=84
ROWS=`grep '"IIR1 INP1 Volume"' $MODMP | sed -e 's|<ctl name="IIR1 INP1 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"IIR1 INP1 Volume\" value=\"$ROW\"|\"IIR1 INP1 Volume\" value=\"$NUM2\"|g" $MODMP
done
ROWS=`grep '"IIR1 INP2 Volume"' $MODMP | sed -e 's|<ctl name="IIR1 INP2 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"IIR1 INP2 Volume\" value=\"$ROW\"|\"IIR1 INP2 Volume\" value=\"$NUM2\"|g" $MODMP
done
ROWS=`grep '"IIR1 INP3 Volume"' $MODMP | sed -e 's|<ctl name="IIR1 INP3 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"IIR1 INP3 Volume\" value=\"$ROW\"|\"IIR1 INP3 Volume\" value=\"$NUM2\"|g" $MODMP
done
ROWS=`grep '"IIR1 INP4 Volume"' $MODMP | sed -e 's|<ctl name="IIR1 INP4 Volume" value="||g' -e 's|" />||g' -e 's|"/>||g'`
for ROW in $ROWS; do
  sed -i "s|\"IIR1 INP4 Volume\" value=\"$ROW\"|\"IIR1 INP4 Volume\" value=\"$NUM2\"|g" $MODMP
done
}

# patch audio platform info
if [ "$MODAPI" ]; then
  if ! grep -q '<acdb_ids>' $MODAPI; then
    sed -i '/<audio_platform_info>/a\
    <acdb_ids>\
        <device name="SND_DEVICE_IN_HANDSET_MIC" acdb_id="0"/>\
        <device name="SND_DEVICE_IN_HANDSET_MIC_EXTERNAL" acdb_id="0"/>\
        <device name="SND_DEVICE_IN_CAMCORDER_MIC" acdb_id="0"/>\
        <device name="SND_DEVICE_IN_HANDSET_STEREO_DMIC" acdb_id="0"/>\
    </acdb_ids>' $MODAPI
  else
    if ! grep -q '<device name="SND_DEVICE_IN_HANDSET_STEREO_DMIC" acdb_id=' $MODAPI; then
      sed -i '/<acdb_ids>/a\
        <device name="SND_DEVICE_IN_HANDSET_STEREO_DMIC" acdb_id="0"/>' $MODAPI
    else
      ROWS=`grep '"SND_DEVICE_IN_HANDSET_STEREO_DMIC" acdb_id="' $MODAPI | sed -e 's|<device name="SND_DEVICE_IN_HANDSET_STEREO_DMIC" acdb_id="||g' -e 's|" />||g' -e 's|"/>||g'`
      for ROW in $ROWS; do
        if [ $ROW != 0 ]; then
          sed -i "s|\"SND_DEVICE_IN_HANDSET_STEREO_DMIC\" value=\"$ROW\"|\"SND_DEVICE_IN_HANDSET_STEREO_DMIC\" acdb_id=\"0\"|g" $MODAPI
        fi
      done
    fi
    if ! grep -q '<device name="SND_DEVICE_IN_CAMCORDER_MIC" acdb_id=' $MODAPI; then
      sed -i '/<acdb_ids>/a\
        <device name="SND_DEVICE_IN_CAMCORDER_MIC" acdb_id="0"/>' $MODAPI
    else
      ROWS=`grep '"SND_DEVICE_IN_CAMCORDER_MIC" acdb_id="' $MODAPI | sed -e 's|<device name="SND_DEVICE_IN_CAMCORDER_MIC" acdb_id="||g' -e 's|" />||g' -e 's|"/>||g'`
      for ROW in $ROWS; do
        if [ $ROW != 0 ]; then
          sed -i "s|\"SND_DEVICE_IN_CAMCORDER_MIC\" value=\"$ROW\"|\"SND_DEVICE_IN_CAMCORDER_MIC\" acdb_id=\"0\"|g" $MODAPI
        fi
      done
    fi
    if ! grep -q '<device name="SND_DEVICE_IN_HANDSET_MIC_EXTERNAL" acdb_id=' $MODAPI; then
      sed -i '/<acdb_ids>/a\
        <device name="SND_DEVICE_IN_HANDSET_MIC_EXTERNAL" acdb_id="0"/>' $MODAPI
    else
      ROWS=`grep '"SND_DEVICE_IN_HANDSET_MIC_EXTERNAL" acdb_id="' $MODAPI | sed -e 's|<device name="SND_DEVICE_IN_HANDSET_MIC_EXTERNAL" acdb_id="||g' -e 's|" />||g' -e 's|"/>||g'`
      for ROW in $ROWS; do
        if [ $ROW != 0 ]; then
          sed -i "s|\"SND_DEVICE_IN_HANDSET_MIC_EXTERNAL\" value=\"$ROW\"|\"SND_DEVICE_IN_HANDSET_MIC_EXTERNAL\" acdb_id=\"0\"|g" $MODAPI
        fi
      done
    fi
    if ! grep -q '<device name="SND_DEVICE_IN_HANDSET_MIC" acdb_id=' $MODAPI; then
      sed -i '/<acdb_ids>/a\
        <device name="SND_DEVICE_IN_HANDSET_MIC" acdb_id="0"/>' $MODAPI
    else
      ROWS=`grep '"SND_DEVICE_IN_HANDSET_MIC" acdb_id="' $MODAPI | sed -e 's|<device name="SND_DEVICE_IN_HANDSET_MIC" acdb_id="||g' -e 's|" />||g' -e 's|"/>||g'`
      for ROW in $ROWS; do
        if [ $ROW != 0 ]; then
          sed -i "s|\"SND_DEVICE_IN_HANDSET_MIC\" value=\"$ROW\"|\"SND_DEVICE_IN_HANDSET_MIC\" acdb_id=\"0\"|g" $MODAPI
        fi
      done
    fi
  fi
fi
        







