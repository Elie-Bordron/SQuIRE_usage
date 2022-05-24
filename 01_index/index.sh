#!/bin/bash

#SBATCH -c 6 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --mem 16G
#SBATCH --job-name STAR_index 		# Job name
#SBATCH -o log/index_%j.out			# File to which standard out will be written
#SBATCH -e log/index_%j.err 		# File to which standard err will be written

cd /scratch/qtbui_TE/

module load star/2.7.5a

STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir 01_index/out/ \
--genomeFastaFiles /scratch/qtbui_TE/03_fetch/Marouch_genome.fasta \
--sjdbGTFfile /scratch/qtbui_TE/03_fetch/Marouch_refGene.gtf \
--sjdbOverhang 99
