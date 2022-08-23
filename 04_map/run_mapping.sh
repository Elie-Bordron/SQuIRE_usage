#!/bin/bash
#SBATCH --job-name="map"
#SBATCH -e /scratch/qtbui_TE/log/map_%j_%a.out
#SBATCH -o /scratch/qtbui_TE/log/map_%j_%a.out
#SBATCH -t 1-00:00:00
#SBATCH	--mem=15GB 
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --export=ALL
#SBATCH --array=1-121
 
#Load arguments
echo 'Loading arguments from mapping_arguments'
argument_file=$1
. $argument_file

# Set up environment and modules for SQuIRE
#echo 'Setting up environment' $virtual_env
#conda activate $virtual_env

# PATHS
path_data="/scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata" # path to fastq files
path_squire_fetch="/scratch/qtbui_TE/03_fetch/Marouch" # where squire fetch output is stored
path_out="/scratch/qtbui_TE/04_map/out" # output path of squire map
read_length=100
RUN_SQUIRE="/scratch/qtbui_TE/04_map/squire_star.sh" #script that will launch squire map

r1suffix=_R1
# Common suffix of all r1 fastq files (e.g. for project1_file1_r1.fastq.gz, r1suffix='_r1').  If unpaired data, r1suffix='.fastq'.
r2suffix=_R2
# Common suffix of all r2 fastq files (e.g. for project1_file1_r2.fastq, r2suffix='_r2').  If unpaired data, r2suffix='False'

suffix_fastq=".fastq.gz"

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
