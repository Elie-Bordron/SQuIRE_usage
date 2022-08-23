######################################################
# Bash script call.sh to run squire Call job
# using input file call_arguments.sh
# Last update: 31_07_2021
######################################################

#!/bin/bash

#Load arguments
echo 'Loading arguments'
argument_file=$1
. $argument_file
pthreads=8

# Set up environment and modules for SQuIRE
#conda activate $virtual_env

# Run SQuIRE Call
echo 'Running call.sh'
#pwd_var=$(pwd)
#echo current directory:: $pwd_var
echo count_folder :: $count_folder
echo condition 1:: $condition1
echo condition 2:: $condition2

# Folder used by Call as input. It must contain all the data of samples matching the chosen conditions.
#tmp_input=/scratch/qtbui_TE/
# Folder containing the data of all samples, classified by condition.
#conditions_folder=/scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/conditions



# Remove all unneeded files from the tmp input folder:
#rm $tmp_input/*

# Add the appropriate files in the Call input folder
#cp $conditions_folder/$condition1/* $tmp_input
#cp $conditions_folder/$condition2/* $tmp_input



if squire Call --group1 $group1 --group2 $group2 --condition1 $condition1 --condition2 $condition2 --projectname $projectname --pthreads $pthreads --output_format $output_format --call_folder $call_folder --count_folder $count_folder --subfamily $verbosity
then
	echo 'squire Call is complete'
fi

#rm $tmp_input/*
