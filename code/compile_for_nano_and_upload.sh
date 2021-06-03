FQBN='arduino:avr:nano'
PROBABLE_BOARD=`arduino-cli board list | grep USB | cut -d " " -f1`

arduino-cli compile --fqbn "$FQBN" $1


arduino-cli upload -p $PROBABLE_BOARD --fqbn "$FQBN" $1
