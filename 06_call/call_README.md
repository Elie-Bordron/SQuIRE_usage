# CALL STEP

## Important information
This step uses count's output and needs it to be ordered in a specific way: Count's output needs to be placed in a folder called "conditions" (/scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/conditions). This folder contains five folders, one per condition:
```
$ ls /scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/conditions
Cultivated  Resistance-cons  Resistance-ind  Sensible  Wild
```
As all the samples are part of a condition (Wild, Cultivated, Sensible...), the data (count output) is distributed among these folders; each file of a sample is moved to its condition folder.
Call doesn't use directly these folders. When this step is run, the script call.sh reads the two conditions used (we provide this information in count_arguments.sh), copies the content of the corresponding folders to a temporary folder (/scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/files_to_use_for_one_run
) that Call will browse for data.
At the end of this step, this temporary folder is emptied.



## Prerequisites

- The script run_call.sh must be filled. It can be used in its present state, but if you need to use squire on different data, you may need to edit these fields:
    - ```path_scripts="/scratch/qtbui_TE/analysis/squire/scripts_squire"```\
        This variable stores the path to the scripts folder. This folder must contain run_call.sh, call.sh and call_arguments.sh
    - ```call_script=$path_scripts/call.sh```\
        This variable stores the path to the script call.sh .
    - ```arguments_script=$path_scripts/call_arguments.sh```\
        This variable stores the path to the script call_arguments.sh .

- The script call_arguments.sh must be filled. It can be used in its present state, but if you need to use squire on different data, you may need to edit these fields:
    - `condition1=Cultivated` and `condition2=Wild`\
        These are the names of the conditions chosen for a run of this step. This could be changed, for example, to
		`condition1=Resistance-ind` and `condition2=Resistance-cons`.
    - `group1=$(bash $get_list_of_samples $condition1)` and	`group2=$(bash $get_list_of_samples $condition2)`\
        Each of these values hold a comma-separated list of the samples for each of the two conditions used in this run:
        ```
        group1=A0008-1,A0014-1,A0074-1,A0110-1,A0157-1,A0217-1,A0544-1,A0654-1,A0665-1,A0682-1,A0882-1,A1267-1,A1275-1,A1314-1,A1319-1,A1333-1,A1352-1,A1458-1,A1600-1,A1601-1,A1690-1,A1714-1,A1721-1,A1792-1,A2067-1,A2137-1,A2204-1,A2314-1,A2351-1,A2645-1,A3024-1,A3509-1,A3517-1,A3522-1,A4082-1,A5406-1,A5614-1,A5615-1,A5618-1,A5620-1,A5790-1,A5810-1,A5928-1
        ```
        These lists are created via a script located at `/scratch/qtbui_TE/analysis/squire/scripts_squire/additional_scripts/call_give_conditions/get_list_of_samples.sh`.
	- `call_folder=/scratch/qtbui_TE/analysis/squire/squire_call/output/wild_cultiv/subfamily`
		Indicate here where the output should be send.

	- `count_folder=/scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/files`
		Indicate here where count's output is.

        It needs a file that indicates, for each sample, the sample name and the condition it belongs to. For example, here are the lines 105 to 115:
        ```
        ...
        Wild	KZ87-2-1
        Wild	UZ10-1-1
        Wild	UZ11-5-1
        Wild	UZ9-1-1
        Sensible	29-1
        Sensible	30-1
        Sensible	120-1
        Sensible	133-1
        Sensible	134-1
        Sensible	202-1
        ...
        ```
		this file is located at `/scratch/qtbui_TE/analysis/squire/scripts_squire/additional_scripts/call_give_conditions/conditions_table.txt`



- The script call.sh must be filled. It can be used in its present state, but if you need to use squire on different data, you may need to edit these fields:
    - `tmp_input=/scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/files_to_use_for_one_run`\
        This variable stores the path to the temporary folder that Call will open to find the files it needs (count output) for the two conditions compared here (e.g. Wild and Cultivated). It will contain only the files for these two conditions.
    - ```conditions_folder=/scratch/qtbui_TE/analysis/squire/squire_count/input_for_call/conditions```\
        This variable stores the path to the count output after being distributed within the five conditions folders.
    This script first removes all files contained in the tmp_input folder (they come from a previous run), then copies the appropriate files from the conditions_folder to the tmp_input folder. This ensures that Call doesn't use files from a precedent run.
    The script knows which conditions to use when reading the call_arguments.sh script.

- Count step outputs one folder per sample, which contains 5 files. A directory holds all of these folders. This directory's path must be specified in call_arguments.sh: `/scratch/qtbui_TE/analysis/squire/squire_count/output`

##  Path & command

The files run_call.sh , call.sh and call_arguments.sh must all be in the same directory:
```
conda activate squire
/scratch/qtbui_TE/analysis/squire/scripts_squire
```

Command to run:
```
conda activate squire
sbatch /scratch/qtbui_TE/analysis/squire/scripts_squire/run_call.sh
```

## Output

The output folder is:
```
/scratch/qtbui_TE/analysis/squire/squire_call/output
```
After runnin Call WITHOUT the "--subfamily" option, check that you have all of these 10 files:
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

- DESeq2_all.txt
```
baseMean	log2FoldChange	lfcSE	stat	pvalue	padj
PruarM.3G223100,+	28110.4588780326	2.59803818186455	0.926703684597118	2.8035263321458	0.0050547104487357	0.999607548664912
PruarM.4G030400,+	3027.98311568304	2.58911061227747	0.931336341517045	2.77999525720224	0.00543596923741185	0.999607548664912
PruarM.1G733600,-	6584.22722023317	2.59425635991897	0.933435749344037	2.77925541392866	0.00544836666091491	0.999607548664912
PruarM.4G282200,+	2983.06229635494	2.56012580652973	0.927840354538083	2.7592309323561	0.00579375764635101	0.999607548664912
PruarM.4G241800,-	3777.31730709495	-2.56611515655036	0.933663124268256	-2.7484379428196	0.00598799689355639	0.999607548664912
PruarM.5G225400,-	1864.97601131185	-2.55945383639638	0.933124878562022	-2.74288457547139	0.00609020887709398	0.999607548664912
chr4|1377182|1380023|mp49454-1_chr4_RLX-incomp_reswagMde-B-G3671-Map3:RLX:LTR|0|-,+	1633.6270015912	2.55332131535278	0.932162418660539	2.73913779856278	0.00616005485846384	0.999607548664912
chr5|12756167|12757847|mp281185-1_chr5_RLX-incomp_reswagMde-B-G4008-Map7:RLX:LTR|0|+,-	1390.28200551992	-2.5380509341357	0.933152387380658	-2.71986758910831	0.00653080619912677	0.999607548664912
chr3|7433091|7434451|mp75421-1_chr3_RLX-incomp_reswagMde-B-R4810-Map5:RLX:LTR|0|-,-	4408.24583197426	2.48231246328534	0.919561985425202	2.69945093710842	0.00694539958922284	0.999607548664912
```

- DESeq2_RefSeq_only.txt
```
baseMean	log2FoldChange	lfcSE	stat	pvalue	padj
PruarM.3G223100,+	28110.4588780326	2.59803818186455	0.926703684597118	2.8035263321458	0.0050547104487357	0.999607548664912
PruarM.4G030400,+	3027.98311568304	2.58911061227747	0.931336341517045	2.77999525720224	0.00543596923741185	0.999607548664912
PruarM.1G733600,-	6584.22722023317	2.59425635991897	0.933435749344037	2.77925541392866	0.00544836666091491	0.999607548664912
PruarM.4G282200,+	2983.06229635494	2.56012580652973	0.927840354538083	2.7592309323561	0.00579375764635101	0.999607548664912
PruarM.4G241800,-	3777.31730709495	-2.56611515655036	0.933663124268256	-2.7484379428196	0.00598799689355639	0.999607548664912
PruarM.5G225400,-	1864.97601131185	-2.55945383639638	0.933124878562022	-2.74288457547139	0.00609020887709398	0.999607548664912
PruarM.2G477100,-	12215.7618741519	2.47290044843829	0.916519228304061	2.69814355451568	0.00697273651018054	0.999607548664912
PruarM.2G488400,+	1181.47639656386	2.49898253104291	0.929379696127247	2.68887144991034	0.00716940222102188	0.999607548664912
PruarM.5G225900,-	1021.72607267184	-2.50693806056524	0.933130553483211	-2.68658876424878	0.00721857653358886	0.999607548664912
```

- DESeq2_TE_only.txt
```
aseMean	log2FoldChange	lfcSE	stat	pvalue	padj
chr4|1377182|1380023|mp49454-1_chr4_RLX-incomp_reswagMde-B-G3671-Map3:RLX:LTR|0|-,+	1633.6270015912	2.55332131535278	0.932162418660539	2.73913779856278	0.00616005485846384	0.999607548664912
chr5|12756167|12757847|mp281185-1_chr5_RLX-incomp_reswagMde-B-G4008-Map7:RLX:LTR|0|+,-	1390.28200551992	-2.5380509341357	0.933152387380658	-2.71986758910831	0.00653080619912677	0.999607548664912
chr3|7433091|7434451|mp75421-1_chr3_RLX-incomp_reswagMde-B-R4810-Map5:RLX:LTR|0|-,-	4408.24583197426	2.48231246328534	0.919561985425202	2.69945093710842	0.00694539958922284	0.999607548664912
chr8|1877465|1877749|mp162020-1_chr8_DTX-incomp_reswagMde-B-G7569-Map5_reversed:DTX:TIR|0|-,+	951.251539023239	2.48998323564429	0.931205368137027	2.67393565462982	0.00749668339295764	0.999607548664912
chr8|1877750|1878242|mp162024-1_chr8_DTX-incomp_reswagMde-B-P638.249-Map5_reversed:DTX:TIR|0|-,+	1160.13259443434	2.47242024581416	0.927363496183712	2.66607458239263	0.00767426656160959	0.999607548664912
chr1|39502663|39502972|mp137274-1_chr1_RIX-incomp_reswagMde-B-R4258-Map3:RIX:LINE|0|-,-	1991.53743963379	2.42980753154701	0.932556612932835	2.60553353850058	0.00917312924163874	0.999607548664912
chr8|1878249|1878678|mp162021-1_chr8_DTX-incomp_reswagMde-B-G854-Map12_reversed:DTX:TIR|0|-,+	1157.43161134407	2.36835522991196	0.919370015285346	2.57606316340097	0.00999323892991271	0.999607548664912
chr5|540621|541341|mp11057-1_chr5_RIX-incomp_reswagMde-B-P400.448-Map3:RIX:LINE|0|+,-	732.011685335777	2.38649003795226	0.926593306848263	2.57555285616052	0.0100079975634107	0.999607548664912
chr1|42374112|42377431|mp132651-1_chr1_DHX-incomp_reswagMde-B-R3105-Map11_reversed:DHX:Helitron|0|+,+	842.495474089663	2.36659048311315	0.923194746975926	2.56347914767204	0.0103628925555096	0.999607548664912
```

- count_graph_all.pdf
<img src="https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/count_graph_all-1.png" alt="count_graph_all.pdf" width="500"/>

- MA_plot_all.pdf
<img src="https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/MA_plot_all-1.png" alt="MA_plot_all.pdf" width="500"/>


- MA_plot_RefSeq_only.pdf
<img src="https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/MA_plot_RefSeq_only-1.png" alt="MA_plot_RefSeq_only.pdf" width="500"/>


- MA_plot_TE_only.pdf
<img src="https://github.com/Elie-Bordron/SQuIRE_usage/blob/main/call/call_images/MA_plot_TE_only-1.png" alt="MA_plot_TE_only.pdf" width="500"/>


## Error logs

The log folder can be specified with this Slurm option:
```
#SBATCH -o /scratch/qtbui_TE/analysis/squire/squire_call/logs/call.out
```
Add this line to split the log file and the error file:
```
#SBATCH -e /scratch/qtbui_TE/analysis/squire/squire_call/logs/call_error.out
```
