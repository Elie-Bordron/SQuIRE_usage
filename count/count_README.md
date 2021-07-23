# COUNT STEP

## Prerequisites

- The script run_count.sh must be filled. It can be used in its present state, but if you need to use it on different data, edit these fields:
	- ```SBATCH -t 1-12:00:00``` \n
		Counting ran correctly with this time limit, but adjust this to your data.
	- ```SBATCH --mem=13GB```
		Counting ran correctly with this memory limit, but adjust this to your data.
	- ```SBATCH --cpus-per-task=1```
		Counting ran correctly with parameter, but adjust this to your data.
	- ```path_data="/scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map"```
		The folder where the map output is stored. The map output consists of one folder per sample.
	- ```path_out="/scratch/qtbui_TE/analysis/squire/squire_count"```
		This variable stores the path to the output folder of this command.
	- ```path_scripts="/scratch/qtbui_TE/analysis/squire/scripts_squire"```
		This variable stores the path to the scripts folder that contains run_count.sh, loop_count.sh and count_arguments.sh
	- ```loop_script="$path_scripts/loop_count.sh"```
		This variable stores the path to the script loop_count.sh
	This is pretty much everything you need to modify in this script when running squire on different data. For the rest of SLURM options, set them to fit your needs.
- Fill count_arguments.sh:
	- ```strandedness=1```
	Adjust this to your data. See Count step in SQuIRE: '0' if unstranded eg Standard Illumina, 1 if first- strand eg Illumina Truseq, dUTP, NSR, NNSR, 2 if second-strand, eg Ligation, Standard SOLiD (optional,default=0)
	- ```read_length=150```
	Adjust this to your data.
	- ``` ```


- Fetch folder: Make sure that it contains the following files. You may run squire fetch for this, or just provide your own files:
    - Marouch_genome.fasta
    ```
    >chr1
    atcatgtcttgCGGTAAGTTATAGTGTAAAAAGCCTATATATCAGAGAACGCAACATCTT
    ACAAGTAATTTATTAAGTAAATAGCCTAATTTCCCAAAAACACCATATCTTACCGGTAAG
    TTATAGTGTAAAAAGCCAATAAATCTGAGAACGCAACATCTTACCCTTAATTTATTAAGT
    AAATAGCTTAATTTTCCATAAACATCATGTCTTGCCGGTAAGTTATAGTGTAAAAAGCCT
    ATATATCAGAGAACGCAACATCTTACAAGTAATTTATTAAGTAAATAGCCTAATTTCCCA
    AAAACACCATATCTTACCGGTAAGTTATAGTGTAAAAAGCCAATAAATCTGAGAACGCAA
    CATCTTACCCTTAATTTATTAAGTAAATAGCTTAATTTTCCAAAACACATGTCTTGCCGG
    TAAGTTATAGTGTAAAAAGCTATATATCAGAGAACGCAACATCTTACAAGTAATTTATTA
    AGTAAATAGCCTAATTTTCCCAAAACACCATATCTTACCGGTAAGTTATAGTGTAAAAAG
    ```
    - Marouch_refGene.gtf
    ```
    chr1	transdecoder	exon	19904	20044	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	20148	20257	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	20365	20437	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	21107	21168	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	21847	21988	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	23272	23490	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	23633	23699	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	25537	25936	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	27296	27443	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    chr1	transdecoder	exon	27567	27727	.	+	.	transcript_id "PruarM.1G000100.t1.p1"; gene_id "PruarM.1G000100"; gene_name "PruarM.1G000100%20type%3Acomplete%20len%3A1278%20%28%2B%29%2Cscore%3D183.78";
    ```
    - Marouch_rmsk.txt (the custom-made repeatmasker file. make sure that the columns are the same as in a repeatmasker file.)
    ```
    Chromosome	Start	End		Strand	Attribute	TE_Name	Code				Length_Chr	match/match_part_part	Length			
    0	0	0	0	0	chr1	43849613	43849713	0	+	mp131073-1_chr1_DTX-incomp_reswagMde-B-R2276-Map20	TIR	DTX	0	0	0	44417728	match_part	100	Parent=ms131073_chr1_DTX-incomp_reswagMde-B-R2276-Map20	Target=DTX-incomp_reswagMde-B-R2276-Map20 524 613	Identity=79.3
    0	0	0	0	0	chr1	43728152	43728320		-	mp131074-1_chr1_DTX-incomp_reswagMde-B-R3621-Map9	TIR	DTX	0	0	0	44417728	match_part	168	Parent=ms131074_chr1_DTX-incomp_reswagMde-B-R3621-Map9	Target=DTX-incomp_reswagMde-B-R3621-Map9 3329 3493	Identity=71.5
    0	0	0	0	0	chr1	43822961	43823104		+	mp131075-1_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed	TIR	DTX	0	0	0	44417728	match_part	143	Parent=ms131075_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed	Target=DTX-incomp_reswagMde-B-R5137-Map13_reversed 1954 2086	Identity=78.5
    0	0	0	0	0	chr1	43854171	43854284		+	mp131076-1_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed	TIR	DTX	0	0	0	44417728	match_part	113	Parent=ms131076_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed	Target=DTX-incomp_reswagMde-B-R5137-Map13_reversed 2813 2911	Identity=81.7
    0	0	0	0	0	chr1	43819314	43819425		+	mp131077-1_chr1_DTX-incomp_reswagMde-B-R608-Map20	TIR	DTX	0	0	0	44417728	match_part	111	Parent=ms131077_chr1_DTX-incomp_reswagMde-B-R608-Map20	Target=DTX-incomp_reswagMde-B-R608-Map20 224 329	Identity=72.8
    0	0	0	0	0	chr1	43834255	43834366		+	mp131078-1_chr1_DTX-incomp_reswagMde-B-R608-Map20	TIR	DTX	0	0	0	44417728	match_part	111	Parent=ms131078_chr1_DTX-incomp_reswagMde-B-R608-Map20	Target=DTX-incomp_reswagMde-B-R608-Map20 224 329	Identity=72.8
    0	0	0	0	0	chr1	43849921	43850053		+	mp131079-1_chr1_DTX-incomp_reswagMde-B-R608-Map20	TIR	DTX	0	0	0	44417728	match_part	132	Parent=ms131079_chr1_DTX-incomp_reswagMde-B-R608-Map20	Target=DTX-incomp_reswagMde-B-R608-Map20 1194 1328	Identity=83.5
    0	0	0	0	0	chr1	43771819	43771996		-	mp131080-1_chr1_DTX-incomp_reswagMde-B-R6235-Map4	TIR	DTX	0	0	0	44417728	match_part	177	Parent=ms131080_chr1_DTX-incomp_reswagMde-B-R6235-Map4	Target=DTX-incomp_reswagMde-B-R6235-Map4 998 1177	Identity=75.3
    0	0	0	0	0	chr1	43772016	43772178		-	mp131080-2_chr1_DTX-incomp_reswagMde-B-R6235-Map4	TIR	DTX	0	0	0	44417728	match_part	162	Parent=ms131080_chr1_DTX-incomp_reswagMde-B-R6235-Map4	Target=DTX-incomp_reswagMde-B-R6235-Map4 3 164	Identity=69.7
    ```
    - Marouch_TE.gff
    ```
    chr1	reswagMa4S_REPET_TEs	match	43849613	43849713	0.0	+	.	ID=ms131073_chr1_DTX-incomp_reswagMde-B-R2276-Map20;Target=DTX-incomp_reswagMde-B-R2276-Map20 524 613;TargetLength=974;TargetDescription=CI:12 struct:(TElength: >700bps TermRepeats: termTIR: 14) other:(SSRCoverage:0.40);Identity=79.3
    chr1	reswagMa4S_REPET_TEs	match	43728152	43728320	0.0	-	.	ID=ms131074_chr1_DTX-incomp_reswagMde-B-R3621-Map9;Target=DTX-incomp_reswagMde-B-R3621-Map9 3329 3493;TargetLength=4031;TargetDescription=CI:25 struct:(TElength: >1000bps TermRepeats: termTIR: 28) other:(SSRCoverage:0.11);Identity=71.5
    chr1	reswagMa4S_REPET_TEs	match	43822961	43823104	0.0	+	.	ID=ms131075_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed;Target=DTX-incomp_reswagMde-B-R5137-Map13_reversed 1954 2086;TargetLength=4012;TargetDescription=CI:87 coding:(TE_BLRtx: HARB-2B_Mad:ClassII:TIR:PIF-Harbinger: 17.87% | HARB-2_Mad:ClassII:TIR:PIF-Harbinger: 29.91% TE_BLRx: HARB-1_GM_2p:ClassII:TIR:PIF-Harbinger: 9.91% | HARB-2B_Mad_1p:ClassII:TIR:PIF-Harbinger: 82.05% profiles: PF04827.9_Plant_tran_NA_Tase_20.7: 99.02%(99.02%)) struct:(TElength: >1000bps ORF: >1000bps) other:(Other_profiles: PF14303.1_NAM-associated_NA_OTHER_27.0: 99.35%(99.35%) SSR: (AGCCC)2_start SSRCoverage:0.14);Identity=78.5
    chr1	reswagMa4S_REPET_TEs	match	43854171	43854284	0.0	+	.	ID=ms131076_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed;Target=DTX-incomp_reswagMde-B-R5137-Map13_reversed 2813 2911;TargetLength=4012;TargetDescription=CI:87 coding:(TE_BLRtx: HARB-2B_Mad:ClassII:TIR:PIF-Harbinger: 17.87% | HARB-2_Mad:ClassII:TIR:PIF-Harbinger: 29.91% TE_BLRx: HARB-1_GM_2p:ClassII:TIR:PIF-Harbinger: 9.91% | HARB-2B_Mad_1p:ClassII:TIR:PIF-Harbinger: 82.05% profiles: PF04827.9_Plant_tran_NA_Tase_20.7: 99.02%(99.02%)) struct:(TElength: >1000bps ORF: >1000bps) other:(Other_profiles: PF14303.1_NAM-associated_NA_OTHER_27.0: 99.35%(99.35%) SSR: (AGCCC)2_start SSRCoverage:0.14);Identity=81.7
    chr1	reswagMa4S_REPET_TEs	match	43819314	43819425	0.0	+	.	ID=ms131077_chr1_DTX-incomp_reswagMde-B-R608-Map20;Target=DTX-incomp_reswagMde-B-R608-Map20 224 329;TargetLength=1336;TargetDescription=CI:25 struct:(TElength: >1000bps TermRepeats: termTIR: 19) other:(SSRCoverage:0.19);Identity=72.8
    chr1	reswagMa4S_REPET_TEs	match	43834255	43834366	0.0	+	.	ID=ms131078_chr1_DTX-incomp_reswagMde-B-R608-Map20;Target=DTX-incomp_reswagMde-B-R608-Map20 224 329;TargetLength=1336;TargetDescription=CI:25 struct:(TElength: >1000bps TermRepeats: termTIR: 19) other:(SSRCoverage:0.19);Identity=72.8
    chr1	reswagMa4S_REPET_TEs	match	43849921	43850053	0.0	+	.	ID=ms131079_chr1_DTX-incomp_reswagMde-B-R608-Map20;Target=DTX-incomp_reswagMde-B-R608-Map20 1194 1328;TargetLength=1336;TargetDescription=CI:25 struct:(TElength: >1000bps TermRepeats: termTIR: 19) other:(SSRCoverage:0.19);Identity=83.5
    chr1	reswagMa4S_REPET_TEs	match	43771819	43772178	0.0	-	.	ID=ms131080_chr1_DTX-incomp_reswagMde-B-R6235-Map4;Target=DTX-incomp_reswagMde-B-R6235-Map4 3 1177;TargetLength=1185;TargetDescription=CI:25 struct:(TElength: >1000bps TermRepeats: termTIR: 18) other:(SSRCoverage:0.19)
    chr1	reswagMa4S_REPET_TEs	match	43673605	43673665	0.0	-	.	ID=ms131081_chr1_DXX-MITE_reswagMde-B-G5785-Map16;Target=DXX-MITE_reswagMde-B-G5785-Map16 25 85;TargetLength=561;TargetDescription=CI:20 struct:(TElength: <700bps TermRepeats: termTIR: 25) other:(SSRCoverage:0.25);Identity=80.3
    chr1	reswagMa4S_REPET_TEs	match	43669822	43669976	0.0	-	.	ID=ms131082_chr1_DXX-MITE_reswagMde-B-G7379-Map7;Target=DXX-MITE_reswagMde-B-G7379-Map7 519 696;TargetLength=698;TargetDescription=CI:20 struct:(TElength: <700bps TermRepeats: termTIR: 236) other:(TE_BLRtx: MuDR-9_Mad:ClassII:?:MuDR: 6.52% SSRCoverage:0.19);Identity=77.1
    ```
    - Marouch_STAR (a directory)
    ```
    ll Marouch_STAR/
    -rwxrwsr-x 1 ebordron inra         72  3 juin  10:52 chrLength.txt
    -rwxrwsr-x 1 ebordron inra        112  3 juin  10:52 chrNameLength.txt
    -rwxrwsr-x 1 ebordron inra         40  3 juin  10:52 chrName.txt
    -rwxrwsr-x 1 ebordron inra         79  3 juin  10:52 chrStart.txt
    -rwxrwsr-x 1 ebordron inra    3274347  3 juin  10:52 exonGeTrInfo.tab
    -rwxrwsr-x 1 ebordron inra    1275136  3 juin  10:52 exonInfo.tab
    -rwxrwsr-x 1 ebordron inra    1087494  3 juin  10:52 geneInfo.tab
    -rwxrwsr-x 1 ebordron inra  228838869 17 juin  12:08 Genome
    -rwxrwsr-x 1 ebordron inra        820 22 juin  11:11 genomeParameters.txt
    -rwxrwsr-x 1 ebordron inra 1876963575  3 juin  10:52 SA
    -rwxrwsr-x 1 ebordron inra   97867203  3 juin  10:52 SAindex
    -rwxrwsr-x 1 ebordron inra    2145845  3 juin  10:52 sjdbInfo.txt
    -rwxrwsr-x 1 ebordron inra    2371830  3 juin  10:52 sjdbList.fromGTF.out.tab
    -rwxrwsr-x 1 ebordron inra    1931354  3 juin  10:52 sjdbList.out.tab
    -rwxrwsr-x 1 ebordron inra    1805442  3 juin  10:52 transcriptInfo.tab
    ```

- Map folder: Make sure that it contains one folder per sample:
```
114-1-1  134-1  207-1    226-1  38-1    55-1  81-1     A0157-1  A1267-1  A1600-1  A2137-1  A3509-1  A5618-1  CH264-4-1  KR91-1-1   KZ127-1-1  KZ232-1-1  KZ82-1-1
116-2-1  159-1  211-1    228-1  40-1-1  56-1  85-1     A0217-1  A1275-1  A1601-1  A2204-1  A3517-1  A5620-1  CH320-5-1  KZ101-1-1  KZ137-1-1  KZ236-1-1  KZ87-2-1
118-1    174-1  217-1    232-1  43-1    57-1  86-1     A0544-1  A1314-1  A1690-1  A2313-1  A3522-1  A5790-1  KR169-1-1  KZ113-2-1  KZ150-8-1  KZ247-1-1  UZ10-1-1
119-1    202-1  218-1    29-1   48-1    61-1  A0008-1  A0654-1  A1319-1  A1714-1  A2314-1  A4082-1  A5810-1  KR170-4-1  KZ114-1-1  KZ159-1-1  KZ259-1-1  UZ11-5-1
120-1    203-1  221-1-1  30-1   51-1    62-1  A0014-1  A0665-1  A1333-1  A1721-1  A2351-1  A5406-1  A5928-1  KR176-1-1  KZ123-2-1  KZ165-1-1  KZ261-1-1  UZ9-1-1
131-1    204-1  224-1    35-1   52-1    69-1  A0074-1  A0682-1  A1352-1  A1792-1  A2645-1  A5614-1  CH123-1  KR181-2-1  KZ124-1-1  KZ167-1-1  KZ264-1-1
133-1    206-1  225-1    37-1   53-1    70-1  A0110-1  A0882-1  A1458-1  A2067-1  A3024-1  A5615-1  CH128-1  KR84-1-1   KZ125-1-1  KZ231-1-1  KZ74-5-1
```


##  Path & command

List of important paths (given in the script already, no changes to do):
- fetch folder:
```
/scratch/qtbui_TE/analysis/squire/squire_fetch
```

- data folder:
```
/scratch/qtbui_TE/rawdata/
```


Command to run:
```
sbatch /scratch/qtbui_TE/analysis/squire/scripts_squire/run_count.sh
```

## Output


The output folder is:
```

/scratch/qtbui_TE/analysis/squire/squire_count/output
```
After runnin Call WITHOUT the "--subfamily" option, check that you have all of these 10 files:
- call_step_coldata.txt
```
sample	condition
114-1-1	Resistance-cons
48-1	Resistance-ind

```


/scratch/qtbui_TE/analysis/squire/squire_count
If you ran squire Map for all the samples, check that you have all these folders when you type this command:
```
ls /scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map

114-1-1  134-1  207-1    226-1  38-1    55-1  81-1     A0157-1  A1267-1  A1600-1  A2137-1  A3509-1  A5618-1  CH264-4-1  KR91-1-1   KZ127-1-1  KZ232-1-1  KZ82-1-1
116-2-1  159-1  211-1    228-1  40-1-1  56-1  85-1     A0217-1  A1275-1  A1601-1  A2204-1  A3517-1  A5620-1  CH320-5-1  KZ101-1-1  KZ137-1-1  KZ236-1-1  KZ87-2-1
118-1    174-1  217-1    232-1  43-1    57-1  86-1     A0544-1  A1314-1  A1690-1  A2313-1  A3522-1  A5790-1  KR169-1-1  KZ113-2-1  KZ150-8-1  KZ247-1-1  UZ10-1-1
119-1    202-1  218-1    29-1   48-1    61-1  A0008-1  A0654-1  A1319-1  A1714-1  A2314-1  A4082-1  A5810-1  KR170-4-1  KZ114-1-1  KZ159-1-1  KZ259-1-1  UZ11-5-1
120-1    203-1  221-1-1  30-1   51-1    62-1  A0014-1  A0665-1  A1333-1  A1721-1  A2351-1  A5406-1  A5928-1  KR176-1-1  KZ123-2-1  KZ165-1-1  KZ261-1-1  UZ9-1-1
131-1    204-1  224-1    35-1   52-1    69-1  A0074-1  A0682-1  A1352-1  A1792-1  A2645-1  A5614-1  CH123-1  KR181-2-1  KZ124-1-1  KZ167-1-1  KZ264-1-1
133-1    206-1  225-1    37-1   53-1    70-1  A0110-1  A0882-1  A1458-1  A2067-1  A3024-1  A5615-1  CH128-1  KR84-1-1   KZ125-1-1  KZ231-1-1  KZ74-5-1
```

In each of these folders, you should find 5 files and 2 folders (I see what's in the KZ123-2-1 folder here):
```
ll /scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map/KZ123-2-1

-rw-r--r-- 1 ebordron inra 3189340844 15 juil. 19:42 KZ123-2-1.bam
-rw-r--r-- 1 ebordron inra     456096 15 juil. 19:46 KZ123-2-1.bam.bai
-rw-r--r-- 1 ebordron inra          0 15 juil. 17:12 KZ123-2-1Chimeric.out.junction
-rw-r--r-- 1 ebordron inra       2035 15 juil. 19:08 KZ123-2-1.log
-rw-r--r-- 1 ebordron inra    5782500 15 juil. 19:08 KZ123-2-1SJ.out.tab
drwx--S--- 2 ebordron inra       4096 15 juil. 15:52 KZ123-2-1_STARgenome
drwx--S--- 2 ebordron inra       4096 15 juil. 17:10 KZ123-2-1_STARpass1
```
