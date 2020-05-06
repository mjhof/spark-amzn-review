OUTPUT=output_rdd.txt
TEMP_DICT=temp_dict.txt

#Load files to local fs
hadoop fs -getmerge $1 $OUTPUT
hadoop fs -getmerge $2 $TEMP_DICT

#Replace line breaks by spaces
tr '\n' ' ' < $TEMP_DICT > tmp.txt && mv tmp.txt $TEMP_DICT

#Append dictionary to output
cat $TEMP_DICT >> $OUTPUT

#Remove temp dict
rm $TEMP_DICT