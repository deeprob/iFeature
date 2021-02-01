set -uex
module load gcc/8.3.1
module load ncbi-blast/2.9.0
enzfile='../ThioesteraseEnzymeSpecificity/data/SeqFile/EnzymeFasta.fa'
testenzfile='../ThioesteraseEnzymeSpecificity/data/SeqFile/TestEnzymeFasta.fa'

python scripts/generatePSSMProfile.py --file $enzfile
echo 'Train Profiles Generated'
tempdir='out/'
mv $tempdir ~/work/ThioesteraseEnzymeSpecificity/featEngg/pssmMethods/data/pssmProfiles/trainfiles/

python scripts/generatePSSMProfile.py --file $testenzfile
echo 'Test Profiles Generated'
mv $tempdir ~/work/ThioesteraseEnzymeSpecificity/featEngg/pssmMethods/data/pssmProfiles/testfiles/