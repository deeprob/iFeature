feattypes=(AAC CKSAAP TPC DPC DDE GAAC CKSAAGP GTPC GDPC Moran Geary NMBroto CTDC CTDT CTDD CTriad KSCTriad SOCNumber QSOrder PAAC APAAC)

for i in "${feattypes[@]}"
do
  echo $i
  bash generateIFeature.sh $i
done