# Squire usage for prunus

This repository is about my internship of june-july 2021 at INRAE.
My work dealed with the tool [SQuIRE](https://github.com/wyang17/SQuIRE). You may find here informations on the way we to used this tool on plant data.
The scripts have been prepared to run on slurm cluster.


## Installation tips

Installation of squire has been done following the instructions of the github repository at https://github.com/wyang17/SQuIRE#installation .
When using conda to create the squire environment, make sure to use the version of STAR corresponding to the reference genome version (2.7.1a in this case).
The command used is:

```bash
conda create --name squire --override-channels -c iuc -c bioconda -c conda-forge -c defaults -c r python=2.7.13 bioconductor-deseq2=1.16.1 r-base=3.4.1 r-pheatmap bioconductor-vsn bioconductor-biocparallel=1.12.0 r-ggrepel star=2.7.5a bedtools=2.25.0 samtools=1.1 stringtie=1.3.3 igvtools=2.3.93 ucsc-genepredtobed ucsc-gtftogenepred ucsc-genepredtogtf ucsc-bedgraphtobigwig r-hexbin

```

To use the environment:
```bash
conda activate squire
```
or
```bash
source activate squire
```
Clone git repo:
```
git clone https://github.com/wyang17/SQuIRE; cd SQuIRE; pip install -e .
```

## Data preparation
In this case we use a custom genome. Make sure to index your genome.
In `raw_data/` put:
- PruarM.annotated.gff3
- Marouch_v3.1_w60.fasta
- info_reswagMa4S_refTEs_TE_squire.txt

Then:
```
mkdir 03_fetch/
cp raw_data/info_reswagMa4S_refTEs_TE_squire.txt 03_fetch/Marouch_rmsk.txt
cp raw_data/Marouch_v3.1_w60.fasta 03_fetch/Marouch_genome.fasta
```
Convert your gff to gtf:
```
sbatch extra/gff2gtf.sh
```
The output will be `03_fetch/Marouch_refGene.gtf`.
Then you need to index your genome:
```
sbatch 01_index/index.sh
```
The output is in `01_index/out/`.


## Clean
Check `02_clean/arguments.sh` file.
Then run clean step:
```
sbatch 02_clean/run_clean.sh 02_clean/clean_arguments.sh
```
In `02_clean/` you will find 2 files:
- Marouch_all.bed
- Marouch_all_copies.txt

We will skip the **fetch** step.

## Map
As said before, check that you have these files in `03_fetch/`:
- Marouch_genome.fasta
- Marouch_refGene.gtf
- Marouch_rmsk.txt

Check `04_map/run_mapping.sh` and `04_map/map_arguments.sh`.
Run:
```
mkdir 03_fetch/Marouch_STAR/
cp 01_index/out/* 03_fetch/Marouch_STAR/
sbatch 04_map/run_mapping.sh 04_map/map_arguments.sh
```


## TIPS

For RMSK file, you can convert the annotated genome file.
The script can be found at `extra/rmsk.py`.
```
extra/rmsk.py -i raw_data/PruarM.annotated.gff3 -o 03_fetch/Marouch_rmsk.txt -fai raw_data/Marouch_v3.1_w60.fasta.fai -m match
```