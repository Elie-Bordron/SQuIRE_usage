#!/bin/bash
######################################################
# Bash script clean.sh to run the Clean step of SQuIRE
# Uses input file clean_arguments.sh
######################################################

#SBATCH --job-name="run_clean"
#SBATCH -o log/clean_%j.out
#SBATCH -e log/clean_%j.err
#SBATCH -t 00:10:00
#SBATCH --mem=8GB
#SBATCH --nodes=1
#SBATCH --export=ALL


#Load arguments
echo 'Loading arguments'
argument_file=$1
. $argument_file

# Set up environment and modules for SQuIRE
echo 'Setting up environment'
source activate $virtual_env

# Run SQuIRE Clean
echo 'Running Clean'

if [ -z $repeatmasker_file ]
then
  if [ -z $non_reference ]; then
    squire Clean --build $build --clean_folder $clean_folder $verbosity
  else
    squire Clean --build $build --clean_folder $clean_folder --extra $non_reference $verbosity
  fi
else
  echo a rmsk file was used
  if [ -z $non_reference ]; then
    squire Clean --rmsk $repeatmasker_file --clean_folder $clean_folder $verbosity
  else
    squire Clean --rmsk $repeatmasker_file --clean_folder $clean_folder --extra $non_reference $verbosity
  fi
fi

echo 'Clean Complete on' `date`

# clean.sh
