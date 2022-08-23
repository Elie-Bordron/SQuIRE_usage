#!/bin/bash
#SBATCH -p workq
#SBATCH -t 30 #time in minutes

#Load binaries
module load bioinfo/kentUtils-302.1.0

gff3ToGenePred PruarM.annotated.cleaned.gff3 tmp.PruarM.annotated.cleaned.genePred

