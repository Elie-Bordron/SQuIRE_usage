#!/bin/bash
#SBATCH --job-name=count
#SBATCH -e /scratch/qtbui_TE/log/count_%j_%a.out
#SBATCH -o /scratch/qtbui_TE/log/count_%j_%a.out
#SBATCH -t 1-12:00:00
#SBATCH --mem=12GB 
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --export=ALL
#SBATCH --array=1-242

# FOLDERS
path_data="/scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata" # Where the map output is stored: one folder per sample.
path_out="/scratch/qtbui_TE/05_count/out" # where squire will create an output folder named squire_count/
path_scripts="/scratch/qtbui_TE/05_count" # choose the path where all your scripts are stored.
loop_script="$path_scripts/loop_count.sh"

# CREATE OUTPUT AND TEMPORARY FOLDERS
mkdir -pv "$path_out/tmp"
export TMPDIR="$path_out/tmp"
cd $path_out

echo RUN SQUIRE-COUNT

# RUN SQUIRE-COUNT
bash $loop_script $path_scripts/count_arguments.sh $path_data $path_out 	# make sure that count_arguments.sh is stored in your $path_scripts

