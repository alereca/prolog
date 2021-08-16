# Rename files indexed by a number.
# Warning: this script is not suitable for filenames that contain spaces
# Because of command substitution word splitting
FILE_PREFIX=$1
FILE_EXTENSION=$2
DELIMITER=$3
BASE_DIR=$4
FILES=`ls "$BASE_DIR"`
for FILE in $FILES:
do
    echo $FILE
    FILE_INDEX_NUM=$(egrep -o "[0-9]*" <<< $FILE)
    mv "$BASE_DIR/$FILE" "$BASE_DIR/$FILE_PREFIX$DELIMITER$FILE_INDEX_NUM.$FILE_EXTENSION"
done