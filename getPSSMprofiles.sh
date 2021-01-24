set -uex
module load gcc/5.3.1
module load ncbi-blast/2.6.0
enzfile='../ThioesteraseEnzymeSpecificity/data/SeqFile/EnzymeFasta.fa'
python scripts/generatePSSMProfile.py --file $enzfile
echo 'Profiles Generated'