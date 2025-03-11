

path=/home/shailesh/M
F=ips.txt


if [ ! -d $path ]
then
	mkdir $path
fi

####################################################################

if [ ! -f "$path/$F" ]
then
	touch "$path/$F"
	echo "File created"
fi

###################################################################

if [ -f "$path/$F" ]
then
	netstat -na | grep "EST" | awk '{print $5}' >> "$path/$F"
fi

######################################################################

while read -r IP;
do
	if netstat -na | grep -E "EST" | grep -w "$IP" > /dev/null ;
	then
		echo "Connection Established to ----->> $IP "
	else
		echo "Not connected to ----->> $IP "
	fi
done < ips.txt >> helth.txt

###########################################################################

SPACE=$(free -mt | grep "Mem" | awk '{print $NF}')
TH=4500

if [ $SPACE -lt $TH ]
then
	echo "CPU Space Low ----->>> $SPACE "
else
	echo "CPU RAM Running Good ------>> $SPACE "
fi >> helth.txt

mail=$(mailx -s "Hourly Helth check" shaileshgkh@gmail.com < helth.txt)

echo "Mail has been sent successfully"



