# Squire usage for prunus

This repository is about my internship of june-july 2021 at INRAE.
My work dealed with the tool [SQuIRE](https://github.com/wyang17/SQuIRE). You may find here informations on the way we to used this tool on plant data.


## Installation tips

Installation of squire has been done following the instructions of the github repository at https://github.com/wyang17/SQuIRE#installation .
When using conda to create the squire environment, make sure to use the version of STAR corresponding to the reference genome version (2.7.1a in this case).
The command used is:

```bash
conda create --name squire --override-channels -c iuc -c bioconda -c conda-forge -c defaults -c r python=2.7.13 bioconductor-deseq2=1.16.1 r-base=3.4.1 r-pheatmap bioconductor-vsn bioconductor-biocparallel=1.12.0 r-ggrepel star=2.7.1a bedtools=2.25.0 samtools=1.1 stringtie=1.3.3 igvtools=2.3.93 ucsc-genepredtobed ucsc-gtftogenepred ucsc-genepredtogtf ucsc-bedgraphtobigwig r-hexbin

```

To use the environment:
```bash
conda activate squire
```
or
```bash
source activate squire
```

