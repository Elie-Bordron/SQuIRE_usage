#!/bin/bash
#SBATCH --job-name="call"
#SBATCH -e /scratch/qtbui_TE/log/call_%j_%a.out
#SBATCH -o /scratch/qtbui_TE/log/call_%j_%a.out
#SBATCH -t 10:00:00
#SBATCH --mem=13GB
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --export=ALL

# ENVIRONMENT
#Load arguments
#echo 'Loading arguments'
#argument_file=$1
#. $argument_file

# FOLDERS
path_scripts=/scratch/qtbui_TE/06_call
path_tmp=/scratch/qtbui_TE/06_call		# the folder that will contain the tmp folder
call_script=$path_scripts/call.sh
arguments_script=$path_scripts/call_arguments.sh
cd $path_tmp
mkdir -pv "$path_tmp/tmp"
export TMPDIR="$path_tmp/tmp"

# RUN SQUIRE-CALL
bash $call_script $arguments_script
