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

conda create --name squire --override-channels -c iuc -c bioconda -c conda-forge -c defaults -c r python=2.7.13 bioconductor-deseq2=1.16.1 r-base=3.4.1 r-pheatmap bioconductor-vsn bioconductor-biocparallel=1.12.0 r-ggrepel star=2.7.5a bedtools=2.25.0 samtools=1.1 stringtie=2.1.0 igvtools=2.3.93 ucsc-genepredtobed ucsc-gtftogenepred ucsc-genepredtogtf ucsc-bedgraphtobigwig r-hexbin
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
Raw data are from:
```
rsync -av /mnt/cbib/GEP4TWAS/Lane1/*.gz --exclude A5928* CH264-4* CH320-5* qtbui@curta.mcia.fr:/scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata/
rsync -av /mnt/cbib/GEP4TWAS/Lane2/*.gz --exclude A5928* CH264-4* CH320-5* qtbui@curta.mcia.fr:/scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata/
```
&
In this case we use a custom genome. Make sure to index your genome.
In `raw_data/` put:
- PruarM.annotated.gff3
- Marouch_v3.1_w60.fasta
- infos_reswagMa4S_refTEs_TE_match_squire.txt

The `infos_reswagMa4S_refTEs_TE_match_squire.txt` comes from `info_reswagMA4S_refTEs_TE_match.tsv` (output of Juanma pipeline, with script `extract_info_REPEt_refTEsgff.py`). The description column was cleaned and adapated to match HG38 rmsk file.

Then:
```
mkdir 03_fetch/
cp raw_data/infos_reswagMa4S_refTEs_TE_match_squire.txt 03_fetch/Marouch/Marouch_rmsk.txt
cp raw_data/Marouch_v3.1_w60.fasta 03_fetch/Marouch/Marouch_genome.fasta
```
Convert your gff to gtf using [kentutils](https://agat.readthedocs.io/en/latest/gff_to_gtf.html#kent-utils).
Use `PruarM.annotated.gff3` as original GFF file.
/!\ check that your gff has a header: `##gff-version 3`. In our case we must cleand our file before using kentutils.
The cleaned file is called `PruarM.annotated.cleaned.gff3`
```
gff3ToGenePred PruarM.annotated.cleaned.gff3 tmp.PruarM.annotated.cleaned.genePred
genePredToGtf file tmp.PruarM.annotated.cleaned.genePred Marouch_refGene.gtf
cp raw_data/Marouch_refGene.gtf 03_fetch/Marouch/
```

Then you need to index your genome with STAR=2.7.5a:
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
In `02_clean/Marouch` you will find 2 files:
- Marouch_all.bed
- Marouch_all_copies.txt

We will skip the **fetch** step.


## Map
As said before, check that you have these files in `03_fetch/Marouch/`:
- Marouch_genome.fasta
- Marouch_refGene.gtf
- Marouch_rmsk.txt

Check `04_map/run_mapping.sh` and `04_map/map_arguments.sh`.
If you have paired reads (r1 and r2), the number of array is the number of samples divided by 2.
Run:
```
mkdir 03_fetch/Marouch_STAR/
cp 01_index/out/* 03_fetch/Marouch_STAR/
sbatch 04_map/run_mapping.sh 04_map/map_arguments.sh
```
In `04_map/out` you will find one folder per samples.

## Count
Run count step:
```
sbatch 05_count/run_count.sh 05_count/count_arguments.sh
```
In `05_count/out` you will find one folder per samples.

## Call
From 05_count/out copy all \*\.txt in 05_count/TE_counts. Example:
```
cp 05_count/out/CH128_CGTTAGAA-TTCAGGTC-AHYL3WDSXX_L004/CH128_CGTTAGAA-TTCAGGTC-AHYL3WDSXX_L004_TEcounts.txt 05_count/TE_counts/
```

Run call step:
```
sbatch 06_call/run_call.sh 06_call/call_arguments.sh
```
cultivated=CH123_TAAGTGGT-CTTAAGCC-AHYL3WDSXX_L004,CH128_CGTTAGAA-TTCAGGTC-AHYL3WDSXX_L004,KR169-1_GGAGCGTC-GTCCGTGC-AHYL3WDSXX_L004,KR170-4_ATGGCATG-AAGGTACC-AHYL3WDSXX_L004,KR176-1_GCAATGCA-GGAACGTT-AHYL3WDSXX_L004,KR181-2_AGCCTCAT-AGTAGAGA-AHYL3WDSXX_L004,KR84-1_TACTCATA-CCTGTGGC-AHYL3WDSXX_L004,KR91-1_CGTCTGCG-TTCACAAT-AHYL3WDSXX_L004,KZ101-1_CGGACAAC-TCCGGATT-AHYL3WDSXX_L004,KZ113-2_ATATGGAT-CTGTATTA-AHYL3WDSXX_L004,KZ114-1_GCGCAAGC-TCACGCCG-AHYL3WDSXX_L004,KZ123-2_CAAGCTAG-ACATAGCG-AH25VGDSXY_L001,KZ124-1_AAGATACT-ACTTACAT-AHYL3WDSXX_L004,KZ125-1_CCATTCGA-GTTGTCCG-AH25VGDSXY_L001,KZ127-1_TGGATCGA-GTGCGATA-AH25VGDSXY_L001,KZ137-1_GTTCCAAT-AATTCTGC-AHYL3WDSXX_L004,KZ150-8_ACCTTGGC-GGCCTCAT-AHYL3WDSXX_L004,KZ159-1_TTATAACC-GATATCGA-AH25VGDSXY_L001,KZ165-1_GATTCTGC-GACGAGAG-AHYL3WDSXX_L004,KZ167-1_GGACTTGG-CGCAGACG-AH25VGDSXY_L001,KZ231-1_TCGTAGTG-AGACTTGG-AHYL3WDSXX_L004,KZ232-1_CTCTCGTC-TATAACCT-AH25VGDSXY_L001,KZ236-1_TTGGACTC-GGAAGCAG-AH25VGDSXY_L001,KZ247-1_CTACGACA-GAGTCCAA-AHYL3WDSXX_L004,KZ259-1_AAGTCCAA-TATGAGTA-AH25VGDSXY_L001,KZ261-1_CCAAGTCT-AAGGATGA-AH25VGDSXY_L001,KZ264-1_ATCCACTG-AGGTGCGT-AH25VGDSXY_L001,KZ74-5_AGTTCAGG-CCAACAGA-AH25VGDSXY_L001,KZ82-1_GGCTTAAG-TCGTGACC-AH25VGDSXY_L001,KZ87-2_TCTCTACT-CGCGGTTC-AH25VGDSXY_L001,UZ10-1_GCTTGTCA-GAACATAC-AH25VGDSXY_L001,UZ11-5_TTGCCTAG-ACCACTTA-AH25VGDSXY_L001,UZ9-1_AATCCGGA-CTACAGTT-AH25VGDSXY_L001

wild=A0008_ATATGGAT-CTGTATTA-AH25VGDSXY_L001,A0014_GCGCAAGC-TCACGCCG-AH25VGDSXY_L001,A0074_AAGATACT-ACTTACAT-AH25VGDSXY_L001,A0110_GGAGCGTC-GTCCGTGC-AH25VGDSXY_L001,A0157_ATGGCATG-AAGGTACC-AH25VGDSXY_L001,A0217_GCAATGCA-GGAACGTT-AH25VGDSXY_L001,A0544_GTTCCAAT-AATTCTGC-AH25VGDSXY_L001,A0654_ACAGGCGC-CTCTGCCT-AHYL3WDSXX_L004,A0665_ACCTTGGC-GGCCTCAT-AH25VGDSXY_L001,A0682_ATATCTCG-ATCTTAGT-AH25VGDSXY_L001,A0882_GTCTACAC-GCCAAGGT-AHYL3WDSXX_L004,A1267_ATTGTGAA-TGCATTGC-AHYL3WDSXX_L004,A1275_GTGAATAT-TCTCATTC-AHYL3WDSXX_L004,A1314_CAATTAAC-CGAGATAT-AHYL3WDSXX_L004,A1319_TGGCCGGT-TAGAGCGC-AHYL3WDSXX_L004,A1333_AACTGTAG-ACGCCGCA-AHYL3WDSXX_L004,A1352_GCGCTCTA-GCTCCGAC-AH25VGDSXY_L001,A1458_AGTACTCC-AACCTGTT-AHYL3WDSXX_L004,A1600_GGTCACGA-GTATTATG-AHYL3WDSXX_L004,A1601_GACGTCTT-GGTTCACC-AHYL3WDSXX_L004,A1690_TGCGAGAC-CATTGTTG-AHYL3WDSXX_L004,A1714_AACAGGTT-ATACCAAG-AH25VGDSXY_L001,A1721_CATAGAGT-TGCCACCA-AHYL3WDSXX_L004,A1792_CTGCTTCC-GATAGATC-AHYL3WDSXX_L004,A2067_GGTGAACC-GCGTTGGA-AH25VGDSXY_L001,A2137_CAACAATG-CTTCACGG-AH25VGDSXY_L001,A2204_TGGTGGCA-TCCTGTAA-AH25VGDSXY_L001,A2313_TCATCCTT-AGCGAGCT-AHYL3WDSXX_L004,A2314_AGGCAGAG-AGAATGCC-AH25VGDSXY_L001,A2351_AGGTTATA-CAGTTCCG-AHYL3WDSXX_L004,A2645_GAATGAGA-GAGGCATT-AH25VGDSXY_L001,A3024_GAACCGCG-TGACCTTA-AHYL3WDSXX_L004,A3509_CTCACCAA-CTAGGCAA-AHYL3WDSXX_L004,A3517_TCTGTTGG-TCGAATGG-AHYL3WDSXX_L004,A3522_TATCGCAC-CTTAGTGT-AHYL3WDSXX_L004,A4082_ACTCGTGT-ATTGGAAC-AHYL3WDSXX_L004,A5406_CGCTATGT-TCCGACAC-AHYL3WDSXX_L004,A5614_TGCGGCGT-CCTCGGTA-AH25VGDSXY_L001,A5615_CATAATAC-TTCTAACG-AH25VGDSXY_L001,A5618_GATCTATC-ATGAGGCT-AH25VGDSXY_L001,A5620_AGCTCGCT-GCAGAATC-AH25VGDSXY_L001,A5790_CGGAACTG-CACTACGA-AH25VGDSXY_L001,A5810_TAAGGTCA-TGTCGTAG-AH25VGDSXY_L001

## TIPS

For RMSK file, you can convert the annotated genome file.
The script can be found at `extra/rmsk.py`.
```
extra/rmsk.py -i raw_data/PruarM.annotated.gff3 -o 03_fetch/Marouch_rmsk.txt -fai raw_data/Marouch_v3.1_w60.fasta.fai -m match
```
