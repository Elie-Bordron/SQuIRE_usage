#!/bin/bash

# script that is called by run_mapping.sh
# calls squire Map, which performs the mapping of the paired-end reads
# creates output folders in path specified in run_mapping.sh, and stores out bam files there (one bam file per sample, per two fastq files)
# creates a text file with a list of all fastq files, two fastq files per line, input_ARRAY.txt
# index $PBS_ARRAYID will parse the input_ARRAY.txt file line by line
# when errors in a sample occur, and bam file is not generated, identify its index $PBS_ARRAY, and re-run run_mapping.sh script specifying #PBS -t <indeces>, where <indeces> are comma-separated

# $1 = path to raw data
# $2 = path to fetch output 
# $3 = path squire map's output
# $4 = read length
# $5 = suffix of all r1 fastq files

# CREATE OUTPUT DIRECTORY
echo 'create ' . $3
mkdir -pv $3 # output folder
mkdir -pv "$3/tmp" # temporary folder
export TMPDIR="$3/tmp" # store squire temp files


# EXTRACT BOTH FASTQ FILES PER SAMPLE
echo SLURM_ARRAY_TASK_ID: $SLURM_ARRAY_TASK_ID
ls -1 $1 | while read first_line; read second_line; do echo "$first_line $second_line"; done > "$3/input_ARRAY.txt"
# allow two files per line, "*1_fastq *2_fastq"


INPUT_FILE=$(sed "$SLURM_ARRAY_TASK_ID"'q;d' "$3/input_ARRAY.txt") 
# INPUT_FILE = a string made of the names of the 2 fastq files which names are at the line in position N of input_ARRAY.txt , where N=$SLURM_ARRAY_TASK_ID .
# If $SLURM_ARRAY_TASK_ID = 5 ; the fifth line of input_ARRAY.txt will be selected.
# INPUT_FILE=$(sed "1"'q;d' "$3/input_ARRAY.txt") 


# FASTQ FILES
fastq1=$(echo "$INPUT_FILE" | cut -d' ' -f1 )
fastq2=$(echo "$INPUT_FILE" | cut -d' ' -f2 )
echo input file:: $INPUT_FILE

# EXTRACT SAMPLE NAME
ls $1/*$5 > "$3/inputALL_ARRAY.txt"
# allow one file per line, only for R1
filename=$(sed "$SLURM_ARRAY_TASK_ID"'q;d' "$3/inputALL_ARRAY.txt") 
#rm -rf "$3/inputALL_ARRAY.txt"

# EXTRACT ONE LINE PER ARRAY
path=$1/
echo path:: $path
j=${filename#$path}		#extract the filename only
echo filename:: $filename
echo j: $j
basename=${j%$5} 
echo basename:: $basename
#
# ADD PATH TO FASTQ FILES
read1=$1/$fastq1
read2=$1/$fastq2

#conda activate squire

# RUN SQUIRE-MAP ALIGNMENT
echo running Map.py
#echo the command is: squire Map --read1 "$read1" --read2 "$read2" --map_folder $3/squire_map/$basename --read_length $4 --fetch_folder $2 --pthreads 12  --name "$basename" --verbosity

squire Map --read1 "$read1" --read2 "$read2" --map_folder $3/squire_map/$basename --read_length $4 --fetch_folder $2 --pthreads 12  --name "$basename" --verbosity

sleep 2
echo "End of squire_star.sh ; job was conducted."

# REMOVE TMP ARRAY FILES
#rm -f $3/input_ARRAY.txt
#rm -f $3/inputALL_ARRAY.txt
