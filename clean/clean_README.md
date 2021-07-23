# CLEAN STEP

## Prerequisites

- Fill clean_arguments.sh, and put it in the same directory as clean.sh
- Make sure that the following files are in the fetch folder. You may run squire fetch for this, or just provide your own:
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


##  Command

Command to run:
```
conda activate squire
sbatch /scratch/qtbui_TE/analysis/squire/scripts_squire/clean.sh  /scratch/qtbui_TE/analysis/squire/scripts_squire/clean_arguments.sh
```

## Output


Check that you have all of these files in /scratch/qtbui_TE/analysis/squire/squire_clean :
- table_col_0.txt_all.bed
```
chr1	43849613	43849713	chr1|43849613|43849713|mp131073-1_chr1_DTX-incomp_reswagMde-B-R2276-Map20:DTX:TIR|0|+	0	+	43849613	43849713120,91,12
chr1	43728152	43728320	chr1|43728152|43728320|mp131074-1_chr1_DTX-incomp_reswagMde-B-R3621-Map9:DTX:TIR|0|-	0	-	43728152	4372832094,137,255
chr1	43822961	43823104	chr1|43822961|43823104|mp131075-1_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed:DTX:TIR|0|+	0	+	43822961	43823104	120,91,12
chr1	43854171	43854284	chr1|43854171|43854284|mp131076-1_chr1_DTX-incomp_reswagMde-B-R5137-Map13_reversed:DTX:TIR|0|+	0	+	43854171	43854284	120,91,12
chr1	43819314	43819425	chr1|43819314|43819425|mp131077-1_chr1_DTX-incomp_reswagMde-B-R608-Map20:DTX:TIR|0|+	0	+	43819314	43819425120,91,12
chr1	43834255	43834366	chr1|43834255|43834366|mp131078-1_chr1_DTX-incomp_reswagMde-B-R608-Map20:DTX:TIR|0|+	0	+	43834255	43834366120,91,12
chr1	43849921	43850053	chr1|43849921|43850053|mp131079-1_chr1_DTX-incomp_reswagMde-B-R608-Map20:DTX:TIR|0|+	0	+	43849921	43850053120,91,12
chr1	43771819	43771996	chr1|43771819|43771996|mp131080-1_chr1_DTX-incomp_reswagMde-B-R6235-Map4:DTX:TIR|0|-	0	-	43771819	4377199694,137,255
chr1	43772016	43772178	chr1|43772016|43772178|mp131080-2_chr1_DTX-incomp_reswagMde-B-R6235-Map4:DTX:TIR|0|-	0	-	43772016	4377217894,137,255
chr1	43673605	43673665	chr1|43673605|43673665|mp131081-1_chr1_DXX-MITE_reswagMde-B-G5785-Map16:DXX:II_Unclassified|0|-	0	-	43673605	43673665	94,137,255
```

- table_col_0.txt_all_copies.txt
```
Subfamily:Family:Class	Copies	Tot.Length	Avg.Length
mp100-1_chr8_RXX-LARD_reswagMde-B-G2981-Map11:RXX:I_Unclassified	1	38	38.00
mp100-2_chr8_RXX-LARD_reswagMde-B-G2981-Map11:RXX:I_Unclassified	1	16	16.00
mp1000-1_chr4_DHX-comp_reswagMde-B-R1049-Map8_reversed:DHX:Helitron	1	34	34.00
mp10000-1_chr5_DXX-MITE_reswagMde-B-P159.625-Map20:DXX:II_Unclassified	1	222	222.00
mp100000-1_chr8_RLX-incomp_reswagMde-B-R2235-Map20_reversed:RLX:LTR	1	72	72.00
mp100001-1_chr8_RLX-incomp_reswagMde-B-R2235-Map20_reversed:RLX:LTR	1	203	203.00
mp100003-1_chr8_RLX-incomp_reswagMde-B-R2312-Map20:RLX:LTR	1	379	379.00
mp100003-2_chr8_RLX-incomp_reswagMde-B-R2312-Map20:RLX:LTR	1	737	737.00
mp100004-1_chr8_RLX-incomp_reswagMde-B-R2312-Map20:RLX:LTR	1	192	192.00
```

## Error logs
The log folder is /scratch/qtbui_TE/analysis/squire/squire_clean/clean_on_our_data/error_log/clean.out
