today=$(date +"%m-%d-%y")
lw=$(date -d '30 days ago' +" %m-%d-%y" )

echo $today
echo $lw
folder=$(date +"%m-%d-%y")
mkdir -p /home/fandri/stashcache-metrics/st/montly/$folder
cd /home/fandri/stashcache-metrics/st/montly/$folder
python3 /home/fandri/stashcache-metrics/gather-working-set.py $lw $today
python3 /home/fandri/stashcache-metrics/csvtoinflux.py
