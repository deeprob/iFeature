set -uex

feature_type=$1

input_fasta_file='../ThioesteraseEnzymeSpecificity/data/SeqFile/EnzymeFasta.fa'

mkdir -p '../ThioesteraseEnzymeSpecificity/featEngg/ifeatMethods/data/featfiles/'

output_fasta_file='../ThioesteraseEnzymeSpecificity/featEngg/ifeatMethods/data/featfiles/'$feature_type'.tsv'

#echo $output_fasta_file


python iFeature.py --file $input_fasta_file --type $feature_type --out $output_fasta_file
