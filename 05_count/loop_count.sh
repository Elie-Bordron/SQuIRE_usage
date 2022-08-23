#! /bin/bash
pthreads=8

# LOAD ARGUMENT FILE
echo 'Loading arguments'
argument_file=$1
. $argument_file
path_data=$2
path_out=$3

echo creating inputCOUNT_ARRAY.txt...
# PRINT BAM FILE PER SAMPLE 
ls -1 $path_data > "$path_out/inputCOUNT_ARRAY.txt" ################ ARRAY TEXT FILE TO PARSE

# parse input file and extract one sample per line by ARRAY_ID
INPUT_FILE=$(sed "$SLURM_ARRAY_TASK_ID"'q;d' "$path_out/inputCOUNT_ARRAY.txt") #takes the nth line (for n=$SLURM_ARRAY_TASK_ID) of inputCount_ARRAY.txt and sends its value to INPUT_FILE .


# EXTRACT SAMPLE NAME
filename_with_path=$INPUT_FILE
echo filename_with_path : $filename_with_path
filename=${filename_with_path#$path_data/}
echo filename: $filename
basename=${filename%$r1suffix.fastq.gz}
basename=${basename%$r2suffix.fastq.gz}
echo basename: $basename


# RUN SQUIRE-COUNT - parameters extracted from arguments.sh script
squire Count --f $fetch_folder --map_folder $map_folder --clean_folder $clean_folder --count_folder $count_folder/$basename --temp_folder $TMPDIR --build $build --name $basename --strandedness $strandedness --EM $EM $verbosity -r $read_length --pthreads $pthreads


