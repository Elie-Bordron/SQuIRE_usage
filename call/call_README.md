# CALL STEP

## Input

- The results of Count step. They can be found in the count output folder. Specify this folder in call_arguments.sh .
- Specifications about the two groups compared. The samples are split within the two groups. Specify this folder in call_arguments.sh .


##  Path & command

The files run_call.sh , call.sh and call_arguments.sh must all be in the same directory:
```
/scratch/qtbui_TE/analysis/squire/scripts_squire
```

Command to run:
```
conda activate squire
sbatch /scratch/qtbui_TE/analysis/squire/scripts_squire/run_call.sh
```

## Output


Check that you have all of these files:
- call_step_coldata.txt
```
sample	condition
114-1-1	Resistance-cons
48-1	Resistance-ind

```

- call_step_gene_TE_counttable.txt
```
gene_id	114-1-1	48-1
PruarM.4G283000,-	6256	7828
PruarM.5G265800,+	0	0
PruarM.1G123400,-	4	35
PruarM.4G139000,+	2535	1474
PruarM.7G318500,-	1399	964
PruarM.2G110900,-	0	0
PruarM.6G375500,-	59	5
PruarM.4G228200,-	1280	789
PruarM.1G261700,-	0	0
```

- call_step_TE_combo.txt
```
tx_chr	tx_start	tx_stop	TE_ID	fpkm	tx_strand	Sample	alignedsize	TE_chr	TE_start	TE_stop	TE_name	milliDiv	TE_strand	uniq_counts	tot_counts	tot_reads	score
chr3	17404748	17405064	chr3|17404819|17404997|mp58884-1_chr3_RXX_reswagMde-B-R2874-Map6:RXX:I_Unclassified|0|+	3309.25	-	114-1-1	30378043	chr3	17404819	17404997	mp58884-1_chr3_RXX_reswagMde-B-R2874-Map6:RXX:I_Unclassified	0	+	31693	31766.99	31840	99.77
chr4	9256285	9256642	chr4|9256360|9256567|mp37623-1_chr4_RIX-incomp_reswagMde-B-R4258-Map3:RIX:LINE|0|-	2455.22	-	114-1-1	30378043	chr4	92563609256567	mp37623-1_chr4_RIX-incomp_reswagMde-B-R4258-Map3:RIX:LINE	0	-	26612	26626.76	26637	99.96
chr2	22157552	22159154	chr2|22157708|22159080|mp92927-1_chr2_RLX-incomp_reswagMde-B-R4810-Map5:RLX:LTR|0|-	2228.58	-	114-1-1	30378043	chr2	22157708	22159080	mp92927-1_chr2_RLX-incomp_reswagMde-B-R4810-Map5:RLX:LTR	0	-	101335	108455.09	115545	93.86
chr8	2698034	2698429	chr8|2698137|2698319|mp150433-1_chr8_DTX-incomp_reswagMde-B-G854-Map12_reversed:DTX:TIR|0|+	2079.05	+	114-1-1	30378043	chr8	2698137	2698319	mp150433-1_chr8_DTX-incomp_reswagMde-B-G854-Map12_reversed:DTX:TIR	0	+	24813	24947.17	24987	99.84
chr3	21980009	21980208	chr3|21980036|21980133|mp52669-2_chr3_DTX-incomp_reswagMde-B-R1640-Map5:DTX:TIR|0|-	1804.39	-	114-1-1	30378043	chr3	21980036	21980133	mp52669-2_chr3_DTX-incomp_reswagMde-B-R1640-Map5:DTX:TIR	0	-	10901	10907.98	10911	99.97
chr3	13368829	13369134	chr3|13368904|13369059|mp65918-1_chr3_RLX-comp_reswagMde-B-G4710-Map3:RLX:LTR|0|-	1766.54	-	114-1-1	30378043	chr3	13368904	13369059	mp65918-1_chr3_RLX-comp_reswagMde-B-G4710-Map3:RLX:LTR	0	-	15495	16367.51	16561	98.83
chr6	20596249	20597917	chr6|20596318|20597684|mp243191-1_chr6_RLX-incomp_reswagMde-B-R4810-Map5:RLX:LTR|0|+	1609.58	+	114-1-1	30378043	chr6	20596318	20597684	mp243191-1_chr6_RLX-incomp_reswagMde-B-R4810-Map5:RLX:LTR	0	+	76096	81558.21	87004	93.74
chr5	10320717	10321062	chr5|10320828|10320978|mp284122-1_chr5_RLX-incomp_reswagMde-B-R6496-Map10:RLX:LTR|0|+	1003.82	-	114-1-1	30378043	chr5	10320828	10320978	mp284122-1_chr5_RLX-incomp_reswagMde-B-R6496-Map10:RLX:LTR	0	+	10513	10520.48	10527	99.94
chr4	9243754	9244111	chr4|9243829|9244036|mp37948-1_chr4_RIX-incomp_reswagMde-B-R4258-Map3:RIX:LINE|0|-	947.10	-	114-1-1	30378043	chr4	92438299244036	mp37948-1_chr4_RIX-incomp_reswagMde-B-R4258-Map3:RIX:LINE	0	-	10263	10271.30	10275	99.96

```

- count_graph_all.pdf
[alt text](https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/count_graph_all.pdf)

- MA_plot_all.pdf
![MA_plot_all.pdf](https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/MA_plot_all-1.png "This is a png. To see the pdf, go to the call_images folder")

- MA_plot_RefSeq_only.pdf
<img src="https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/MA_plot_RefSeq_only.png" alt="MA_plot_RefSeq_only.pdf" width="200"/>

- MA_plot_TE_only.pdf
<img src="https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/MA_plot_TE_only.png" alt="MA_plot_TE_only.pdf" width="200"/>

## Error logs
The log folder is /scratch/qtbui_TE/analysis/squire/squire_clean/clean_on_our_data/error_log.



edit 16:11

