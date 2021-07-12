# CLEAN STEP

## Input

- arguments.sh (must be given from the command line.)
- table_col_0.txt (the custom-made repeatmasker file. make sure that the columns are the same as in a repeatmasker file.)


##  Path & command

List of important paths (they are given with arguments.sh, they are just here for clarity purposes):
- The repeatmasker file is here:	/scratch/qtbui_TE/analysis/squire/clean_on_our_data/input/table_col_0.txt
- The output folder is here: 		/scratch/qtbui_TE/analysis/squire/squire_clean/clean_on_our_data/output

Command to run:
```
conda activate squire
bash /scratch/qtbui_TE/analysis/squire/scripts_squire/clean.sh  /scratch/qtbui_TE/analysis/squire/scripts_squire/arguments.sh
```

## Ouput


Check that you have all of these files:
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
The log folder is /scratch/qtbui_TE/analysis/squire/squire_clean/clean_on_our_data/error_log.


