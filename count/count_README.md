# COUNT STEP

## Prerequisites

- The script run_count.sh must be filled. It can be used in its present state, but if you need to use it on different data, edit these fields:
	- ```SBATCH -t 1-12:00:00``` \
		Counting ran correctly with this time limit, but adjust this to your data.
	- ```SBATCH --mem=13GB```\
		Counting ran correctly with this memory limit, but adjust this to your data.
	- ```SBATCH --cpus-per-task=1```\
		Counting ran correctly with parameter, but adjust this to your data.
	- ```path_data="/scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map"```\
		The folder where the map output is stored. The map output consists of one folder per sample.
	- ```path_out="/scratch/qtbui_TE/analysis/squire/squire_count"```\
		This variable stores the path to the output folder of this command.
	- ```path_scripts="/scratch/qtbui_TE/analysis/squire/scripts_squire"```\
		This variable stores the path to the scripts folder that contains run_count.sh, loop_count.sh and count_arguments.sh
	- ```loop_script="$path_scripts/loop_count.sh"```\
		This variable stores the path to the script loop_count.sh
	This is pretty much everything you need to modify in this script when running squire on different data. For the rest of SLURM options, set them to fit your needs.
- The script count_arguments.sh must be filled. It can be used in its present state, but if you need to use it on different data, edit these fields:
	- ```strandedness=1```\
		Adjust this to your data. See Count step in SQuIRE github: '0' if unstranded eg Standard Illumina, 1 if first- strand eg Illumina Truseq, dUTP, NSR, NNSR, 2 if second-strand, eg Ligation, Standard SOLiD (optional,default=0)
	- ```read_length=150```\
		Adjust this to your data.
	- ```fetch_folder=/scratch/qtbui_TE/analysis/squire/squire_fetch```
		Path to the fetch output folder. Make sure that it contains the following files. You may run squire fetch for this, or just provide your own files:
	    - Marouch_genome.fasta
	    - Marouch_refGene.gtf
	    - Marouch_rmsk.txt (the custom-made repeatmasker file. make sure that the columns are the same as in a repeatmasker file.)
	    - Marouch_TE.gff
	    - Marouch_STAR (a directory)
	- ```clean_folder=/scratch/qtbui_TE/analysis/squire/squire_clean```
		Path to the clean output folder. You need to run squire clean beforehand. Make sure that it contains the following files:
		- table_col_0.txt_all.bed
		- table_col_0.txt_all_copies.txt
	- ```map_folder=/scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map```
		Path to the map output folder. You need to run squire map beforehand. Check the files using map_README.md.
	- ```count_folder=/scratch/qtbui_TE/analysis/squire/squire_count/output```
		Path to the count output folder: Where the output will be sent. By default, one folder per sample will be generated, but you can send all the output files in the same directory by editing the count command in loop_count.sh. To do this, edit this:
		```squire Count --f $fetch_folder --map_folder $map_folder/$basename --clean_folder $clean_folder --count_folder $count_folder/$basename --temp_folder $TMPDIR --name $basename --strandedness $strandedness --EM $EM $verbosity -r $read_length --pthreads $pthreads```\
		into this:
		```squire Count --f $fetch_folder --map_folder $map_folder/$basename --clean_folder $clean_folder --count_folder $count_folder --temp_folder $TMPDIR --name $basename --strandedness $strandedness --EM $EM $verbosity -r $read_length --pthreads $pthreads```




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
