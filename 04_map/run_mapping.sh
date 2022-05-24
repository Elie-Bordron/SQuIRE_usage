#!/bin/bash
#SBATCH --job-name="map"
#SBATCH -e /scratch/qtbui_TE/log/map_%j_%a.out
#SBATCH -o /scratch/qtbui_TE/log/map_%j_%a.out
#SBATCH -t 1-00:00:00
#SBATCH	--mem=13GB 
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --export=ALL
#SBATCH --array=1
 
#Load arguments
echo 'Loading arguments'
argument_file=$1
. $argument_file

# Set up environment and modules for SQuIRE
echo 'Setting up environment'
source activate $virtual_env

# PATHS
path_data="/scratch/qtbui_TE/raw_data/test_fastq" # path to fastq files
path_squire_fetch="/scratch/qtbui_TE/03_fetch" # where squire fetch output is stored
path_out="/scratch/qtbui_TE/04_map/out" # output path of squire map
read_length=150
RUN_SQUIRE="/scratch/qtbui_TE/04_map/squire_star.sh" #script that will launch squire map

# RUN SQUIRE STAR SCRIPT - calling scripts and parameters
echo "Running squire_star.sh..."
bash $RUN_SQUIRE $path_data $path_squire_fetch $path_out $read_length $suffix_fastq
#		 $1	    $2		       $3	 $4	      $5
#
# IMPORTANT NOTES - before running this script
# previous requirements to run this script:
#	- provide squire miniconda environment
#	- run squire_fetch beforehand to download reference genome/annotation files and to generate the STAR genome index, OR provide a file that contains these informations.
#	- All of your fastq files must be in the same folder.
#	- This script (run_mapping.sh) and squire_star.sh must be in the same folder.
