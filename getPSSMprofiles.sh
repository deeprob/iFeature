# set -uex
# module load gcc/5.3.1
# module load ncbi-blast/2.6.0
# python ../scripts/generatePSSMProfile.py --file EnzymeAlignedFasta.fa
# echo 'Profiles Generated'
python ../iFeature.py --file EnzymeAlignedFasta.fa --type PSSM --path out/