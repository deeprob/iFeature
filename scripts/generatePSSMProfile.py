#!/usr/bin/env python
#_*_coding:utf-8_*_

import sys, os, re
pPath = re.sub(r'scripts$', '', os.path.split(os.path.realpath(__file__))[0])
sys.path.append(pPath)
from codes import readFasta
import argparse
dbName = '/home/zchen/Databases/uniref50/uniref50'
dbName2 = '~/work/iFeature/myData/uniref50/uniref50db'
ncbidir = '/home/zchen/local/Tools/blast-2.2.18/bin'
ncbidir2 = '/opt/aci/sw/ncbi-rmblastn/2.9.0_gcc-8.3.1-bxy/bin/'
outputdir = 'out/'

def generatePSSMProfile(fastas, outDir, blastpgp, db):
	"""
	Generate PSSM file by using the blastpgp program in NCBI blast-2.2.18 package.

	Parameters
	----------
	file : file
		the file, which include the protein sequences in fasta format.

	blastpgp: string
		the path of blastpgp program.
		
	db: string 
		the uniref50 data base, which is formated by the 'formatdb' program in blast package.

	Returns
	-------
	a string: 
		A directory name, which include the predicted protein PSSM information.
	"""


	if os.path.exists(outDir) == False:
		os.mkdir(outDir)

	for i in fastas:
		name, sequence = re.sub('\|', '', i[0]), i[1]
		with open(name + '.txt', 'w') as f:
			f.write('>'+name+'\n'+sequence + '\n')
		myCmd = blastpgp + ' -query ' + name + '.txt' + ' -db ' + db + ' -num_iterations 3 -num_threads 24 -out_ascii_pssm ' + outDir + '/' + name +'.pssm'
#         myCmd = blastpgp + ' -i ' + name + '.txt' + ' -d ' + db + ' -b 0 -v 5000 -j 3 -h 0.001 -Q ' + outDir + '/' + name +'.pssm'
		print('Doing psiblast for protein: ' + name)
		os.system(myCmd)
		os.remove(name + '.txt')
	return outDir


if __name__ == '__main__':
	parser = argparse.ArgumentParser(usage="it's usage tip.", description="generate PSSM profile")
	parser.add_argument("--file", required=True, help="protein sequence file in fasta format")
	parser.add_argument("--blastpgp", help="the path of NCBI psiblast program")
	parser.add_argument("--db", help="the path of uniref50 database")
	args = parser.parse_args()

	blastpgp = args.blastpgp if args.blastpgp != None else ncbidir2 + 'psiblast' #ncbidir + '/blastpgp'
	db = args.db if args.db != None else dbName2#dbName
	fastas = readFasta.readFasta(args.file)
	outputDir = generatePSSMProfile(fastas, outputdir, blastpgp, db)
	print('The PSSM profiles are stored in directory: ' + outputDir)








