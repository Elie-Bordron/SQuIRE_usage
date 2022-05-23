#!/bin/bash

#SBATCH --job-name gff2gft 		# Job name
#SBATCH -o log/gff_%j.out		# File to which standard out will be written
#SBATCH -e log/gff_%j.err 		# File to which standard err will be written

conda deactivate
conda activate agatenv
conda install -c bioconda agat

agat_convert_sp_gff2gtf.pl --gff ../raw_data/PruarM.annotated.gff3 -o 03_fetch/Marouch_refGene.gtf

