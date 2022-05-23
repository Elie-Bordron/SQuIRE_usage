#!/usr/bin/python
#usage: python3.7 extract_info_REPET_refTEsgff.py -i data/reswagMa4S_refTEs_TE.gff -o info_reswagMa4S_refTEs_TE_match.tsv -fai data/Marouch_v3.1_w60.fasta.fai -m match

#Note: dont forget to save output in .tsv and not csv!

# Main goal is to extract the detail information of TE to have an idea about the distribution and density of TE in the genome. Length of chromosomes is given in a separate file which will 
# have to be included as an option 

#import the package allow to write an option

import re 
import argparse

from pathlib import Path


parser=argparse.ArgumentParser(prog="Gff file manipulator", description="This scripts extracts information from a gff file and stores it in a new one.")

#Giving an input file then creat a final output:
parser.add_argument('-i',action='store',dest='input_file',type=Path,help='GFF filename that contains the data')
parser.add_argument('-o',action='store',dest='output_file',type=Path,help='Output GFF filename')

# Calling a complement file for some extra information, example file "fai" for information about Chromosome. Giving "match_part conditions to know where extract information in this file
parser.add_argument('-fai',action='store',dest='fai_file',type=Path,help='Fasta.fai filename')
parser.add_argument('-m', action='store',dest='match_part',type=str,help='match_part conditions')

#Join all information in an output file:
args=parser.parse_args()

filename=args.output_file

#Open the file we giving beyond:
f=open(args.input_file,'r')
new_f=open(filename,'w')
fai_f=open(args.fai_file,'r')
#reading the line of information we need , ex in the file .fai
fai_lines=fai_f.readlines()

#Dicrtionary for the name of TE

classes = { "RLC": ["I", "LTR", "Copia"], 
	"RLG": ["I", "LTR", "Gypsy"],
	"RLB": ["I", "LTR", "Bel-Pao"],
	"RLR": ["I", "LTR", "Retrovirus"],
	"RLE": ["I", "LTR", "ERV"],
	"RLX": ["I", "LTR", "Unclassified"],
	"RYD": ["I", "DIRS", "DIRS"],
	"RYN": ["I", "DIRS", "Ngaro"],
	"RYV": ["I", "DIRS", "VIPER"],
	"RYX": ["I", "DIRS", "Unclassified"],
	"RPP": ["I", "PLE", "Penelope"],
	"RPX": ["I", "PLE", "Unclassified"],
	"RIR": ["I", "LINE", "R2"],
	"RIT": ["I", "LINE", "RTE"],
	"RIJ": ["I", "LINE", "Jockey"],
	"RIL": ["I", "LINE", "L1"],
	"RII": ["I", "LINE", "I"],
	"RIX": ["I", "LINE", "Unclassified"],
	"RST": ["I", "SINE", "tRNA"],
	"RSL": ["I", "SINE", "7SL"],
	"RSS": ["I", "SINE", "5S"],
	"RSA": ["I", "SINE", "Alu"],
	"RSX": ["I", "SINE", "Unclassified"],
	"RXX": ["I", "I_Unclassified", "Unclassified"],
	"DTT": ["II", "TIR", "Tc1-Mariner"],
	"DTA": ["II", "TIR", "hAT"],
	"DTM": ["II", "TIR", "Mutator"],
	"DTE": ["II", "TIR", "Merlin"],
	"DTR": ["II", "TIR", "Transib"],
	"DTP": ["II", "TIR", "P"],
	"DTB": ["II", "TIR", "PiggyBac"],
	"DTH": ["II", "TIR", "PIF-Harbinger"],
	"DTC": ["II", "TIR", "CACTA"],
	"DTX": ["II", "TIR", "Unclassified"],
	"DYC": ["II", "Crypton", "Crypton"],
	"DYX": ["II", "Crypton", "Unclassified"],
	"DHH": ["II", "Helitron", "Helitron"],
	"DHX": ["II", "Helitron", "Unclassified"],
	"DMM": ["II", "Maverick", "Maverick"],
	"DMX": ["II", "Maverick", "Unclassified"],
	"DXX": ["II", "II_Unclassified", "Unclassified"],
	"noCat": ["noCat", "noCat", "noCat"]
	} # A dictionary which contains information about TE classes is created
	

#Calling the keys in the dictionary to extract information	
class_keys=classes.keys() # A list which contains the keys to be searched in the GFF file is made


# Two lists are created in which chromosome names and their length will be stored
chrom=[] 
chrom_len=[]

for i in fai_lines : 
	chrom.append(i.split('\t')[0]) # Chromosome name from the fisrt column of fai file is added
	chrom_len.append(i.split('\t')[1]) #Chromosome length from the second column of fai file is added
#Adding header
cont=0
header='Chromosome Length_Chr Type match/match_part_part Start End Length Score Strand Frame Attribute Code Class TE_Name TE_Status'.split()
# Data is appended to each line depending on the criteria
for x in f :
	cont=cont+1
	if cont==1 : # Header is added 
		for i in range(0,len(header)-1) : 
			new_f.write(header[i]+"\t")
		new_f.write(header[len(header)-1]+"\n")
	line=x.strip('\n') #removing new line to avoid problem format
	line=line.split('\t')
	if (line[2]==args.match_part) :
		TElength=int(line[4])-int(line[3]) # Length of transposable elements is calculated by substraction
		line.insert(5,TElength) # Adding new column at the position 6th with the name "TElength" 
		line.insert(1,chrom_len[chrom.index(line[0])]) # Chromosome length is added in the 2nd column by extracting the index of chromosome 
		TE_class=re.search('(?<=Target=)[A-Za-z|0-9]*',line[len(line)-1]).group(0) # The substring that comes next to 'Target=' and corresponds to the desired 1st feature is extracted
		if TE_class in class_keys : # If possible, class name and their info, stored in the dictionary previously defined, is appended. 
			line.append(TE_class) 
			line.extend(classes[TE_class])
		else : # If the class does not belong to the dictionary, a new class 'SSR' and whitespaces are appended 
			line.append('SSR')
			line.extend(['SSR','SSR',TE_class])
		for j in range(0,len(line)-1) : # All the new data is written in a new file 
			new_f.write(str(line[j])+"\t")
		new_f.write(str(line[len(line)-1])+"\n")	

new_f.close()
fai_f.close()
f.close()


