MODPATH=${0%/*}

# destination
MODMP=`find $MODPATH/system -type f -name *mixer*paths*.xml`

# patch mixer paths
NUM=6
ROW=`grep '"ADC1 Volume"' $MODMP | sed 's/<ctl name=\"ADC1 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"ADC1 Volume\" value=\"$ROWS\"/\"ADC1 Volume\" value=\"$NUM\"/g" $MODMP
done
ROW=`grep '"ADC2 Volume"' $MODMP | sed 's/<ctl name=\"ADC2 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"ADC2 Volume\" value=\"$ROWS\"/\"ADC2 Volume\" value=\"$NUM\"/g" $MODMP
done
ROW=`grep '"ADC3 Volume"' $MODMP | sed 's/<ctl name=\"ADC3 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"ADC3 Volume\" value=\"$ROWS\"/\"ADC3 Volume\" value=\"$NUM\"/g" $MODMP
done

# patch mixer paths
NUM2=84
ROW=`grep '"IIR1 INP1 Volume"' $MODMP | sed 's/<ctl name=\"IIR1 INP1 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"IIR1 INP1 Volume\" value=\"$ROWS\"/\"IIR1 INP1 Volume\" value=\"$NUM2\"/g" $MODMP
done
ROW=`grep '"IIR1 INP2 Volume"' $MODMP | sed 's/<ctl name=\"IIR1 INP2 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"IIR1 INP2 Volume\" value=\"$ROWS\"/\"IIR1 INP2 Volume\" value=\"$NUM2\"/g" $MODMP
done
ROW=`grep '"IIR1 INP3 Volume"' $MODMP | sed 's/<ctl name=\"IIR1 INP3 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"IIR1 INP3 Volume\" value=\"$ROWS\"/\"IIR1 INP3 Volume\" value=\"$NUM2\"/g" $MODMP
done
ROW=`grep '"IIR1 INP4 Volume"' $MODMP | sed 's/<ctl name=\"IIR1 INP4 Volume\" value=\"//' | sed 's/\" \/>//' | sed 's/\"\/>//' | cut -f 2 -d :`
for ROWS in $ROW; do
  sed -i "s/\"IIR1 INP4 Volume\" value=\"$ROWS\"/\"IIR1 INP4 Volume\" value=\"$NUM2\"/g" $MODMP
done


