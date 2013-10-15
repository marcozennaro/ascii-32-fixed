 #!/bin/bash

for freq in {401..899}
do
grep $freq data.txt | awk '{ print $2 }' > $freq.txt
average=$(awk '{ total += $1 } END { print total/NR }' $freq.txt)
min=$(sort -n $freq.txt | head -n1)
max=$(sort -n $freq.txt | tail -n1)   
rm $freq.txt
echo $freq, $min, $average, $max >> result.txt
echo $freq, $min >> min.txt
echo $freq, $average >> average.txt
echo $freq, $max >> max.txt
echo "for frequency ", $freq
echo "min is ", $min
echo "average is ",$average
echo "max is ",$max
done

