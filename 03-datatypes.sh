NUMBER1=100
NUMBER2=200
TIMESTAMP=$(date)
echo "script executed at: $TIMESTAMP"
SUM=$((NUMBER1+NUMBER2))
echo "SUM OF $NUMBER1 AND $NUMBER2 IS:: $SUM"





#OUTPUT: script executed at: Mon Mar  2 10:55:59 UTC 2026
#-->     SUM OF 100 AND 200 IS:: 300
