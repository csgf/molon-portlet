#!/bin/sh

echo "aqui hay " `ls`

if [ $1 == "PID" ]; then
	echo "Convert PID into URL"
	URL=`python URLParser.py $2`
	echo "download input file: $URL"
	wget -O inputFile.txt $URL	
	
	
elif [ $1 == "URL" ]; then
	{ # your 'try' block
	     wget -O inputFile.txt $2 &&
	    echo "Suceeded when dowloading file"
	} || { # your 'catch' block
		echo "failed when downloading file, doing it by hand"
		wget -O inputFile.txt http://joseba.mpch-mainz.mpg.de/spectral_atlas_data/cross_sections/Sulfur%20compounds/Inorganic%20S-compounds/SO3_BurkholderMcKeen\(1997\)_298K_196-330nm.txt
	}
else
	mv $2 inputFile.txt
	echo "No need to convert"
fi




echo "compile executable"

g++ molon.cpp -o molon

chmod +x molon
echo "aaaand execute"

./molon inputFile.txt > outputFile.txt


echo "al acabar hay" `ls` 
