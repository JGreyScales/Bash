text=$(nmap -T4 $1)
prev=""
ports=""
for line in $text
do
 if [ $line = "open" ]; then
  ports+=${prev: 0: -4}
  ports+=","
 fi
 prev=$line
done
ports=${ports: 0: -1}
nmap -T4 -A -p $ports $1