today=$(date +"%m-%d-%y")
lw=$(date -d '7 days ago' +" %m-%d-%y" )

echo $today
echo $lw
mkdir -p /home/fandri/stashcache-metrics/st/$today
cd /home/fandri/stashcache-metrics/st/$today
python3 /home/fandri/stashcache-metrics/gather-working-set.py $lw $today
python3 /home/fandri/stashcache-metrics/csvtoinflux.py
