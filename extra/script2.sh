#!/bin/bash
#SBATCH -p workq
#SBATCH -t 30 #time in minutes

#Load binaries
module load bioinfo/kentUtils-302.1.0

genePredToGtf file tmp.PruarM.annotated.cleaned.genePred Marouch_refGene.gtf

