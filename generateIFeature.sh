set -uex

feature_type=$1

input_fasta_file='../ThioesteraseEnzymeSpecificity/data/SeqFile/EnzymeFasta.fa'
input_test_fasta_file='../ThioesteraseEnzymeSpecificity/data/SeqFile/TestEnzymeFasta.fa'

mkdir -p '../ThioesteraseEnzymeSpecificity/featEngg/ifeatMethods/data/featfiles/trainfiles/'

mkdir -p '../ThioesteraseEnzymeSpecificity/featEngg/ifeatMethods/data/featfiles/testfiles/'

output_fasta_file='../ThioesteraseEnzymeSpecificity/featEngg/ifeatMethods/data/featfiles/trainfiles/'$feature_type'.tsv'

output_test_fasta_file='../ThioesteraseEnzymeSpecificity/featEngg/ifeatMethods/data/featfiles/testfiles/'$feature_type'.tsv'

#echo $output_fasta_file


python iFeature.py --file $input_fasta_file --type $feature_type --out $output_fasta_file

python iFeature.py --file $input_test_fasta_file --type $feature_type --out $output_test_fasta_file
