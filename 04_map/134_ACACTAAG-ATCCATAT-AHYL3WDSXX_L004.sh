#!/bin/bash
#SBATCH -t 1-00:00:00
#SBATCH --mem=15GB
#SBATCH --cpus-per-task=8
#SBATCH --export=ALL
squire Map --read1 /scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata/134_ACACTAAG-ATCCATAT-AHYL3WDSXX_L004_R1.fastq.gz --read2 /scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata/134_ACACTAAG-ATCCATAT-AHYL3WDSXX_L004_R2.fastq.gz --map_folder /scratch/qtbui_TE/04_map/out/134_ACACTAAG-ATCCATAT-AHYL3WDSXX_L004  --read_length 100 --fetch_folder /scratch/qtbui_TE/03_fetch/Marouch --pthreads 12 --name 134_ACACTAAG-ATCCATAT-AHYL3WDSXX_L004
