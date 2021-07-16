# MAP STEP

## Input

- the fetch folder, which contains:
	- Marouch_genome.fasta
	- Marouch_refGene.gtf
	- Marouch_STAR (a folder)
	- Marouch_TE.gff

- The data folder, which contains the raw fastq files

##  Path & command

List of important path:
- fetch folder: /scratch/qtbui_TE/analysis/squire/squire_fetch/our_data
- data folder: /scratch/qtbui_TE/rawdata/


Command to run:
```sbatch /scratch/qtbui_TE/analysis/squire/scripts_squire/old_run_count.sh /scratch/qtbui_TE/analysis/squire/scripts_squire/arguments.sh 
```
## Ouput

If you ran squire Map for all the samples, check that you have all these folders when you type this command:
```
(squire) [ebordron@login02 squire_map]$ ls /scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map
```
114-1-1  134-1  207-1    226-1  38-1    55-1  81-1     A0157-1  A1267-1  A1600-1  A2137-1  A3509-1  A5618-1  CH264-4-1  KR91-1-1   KZ127-1-1  KZ232-1-1  KZ82-1-1
116-2-1  159-1  211-1    228-1  40-1-1  56-1  85-1     A0217-1  A1275-1  A1601-1  A2204-1  A3517-1  A5620-1  CH320-5-1  KZ101-1-1  KZ137-1-1  KZ236-1-1  KZ87-2-1
118-1    174-1  217-1    232-1  43-1    57-1  86-1     A0544-1  A1314-1  A1690-1  A2313-1  A3522-1  A5790-1  KR169-1-1  KZ113-2-1  KZ150-8-1  KZ247-1-1  UZ10-1-1
119-1    202-1  218-1    29-1   48-1    61-1  A0008-1  A0654-1  A1319-1  A1714-1  A2314-1  A4082-1  A5810-1  KR170-4-1  KZ114-1-1  KZ159-1-1  KZ259-1-1  UZ11-5-1
120-1    203-1  221-1-1  30-1   51-1    62-1  A0014-1  A0665-1  A1333-1  A1721-1  A2351-1  A5406-1  A5928-1  KR176-1-1  KZ123-2-1  KZ165-1-1  KZ261-1-1  UZ9-1-1
131-1    204-1  224-1    35-1   52-1    69-1  A0074-1  A0682-1  A1352-1  A1792-1  A2645-1  A5614-1  CH123-1  KR181-2-1  KZ124-1-1  KZ167-1-1  KZ264-1-1
133-1    206-1  225-1    37-1   53-1    70-1  A0110-1  A0882-1  A1458-1  A2067-1  A3024-1  A5615-1  CH128-1  KR84-1-1   KZ125-1-1  KZ231-1-1  KZ74-5-1


In each of these folders, you should find 5 files and 2 folders (I see what's in the KZ123-2-1 folder here):
```
(squire) [ebordron@login02 KZ123-2-1]$ ll /scratch/qtbui_TE/analysis/squire/squire_map/output/squire_map/KZ123-2-1

-rw-r--r-- 1 ebordron inra 3189340844 15 juil. 19:42 KZ123-2-1.bam
-rw-r--r-- 1 ebordron inra     456096 15 juil. 19:46 KZ123-2-1.bam.bai
-rw-r--r-- 1 ebordron inra          0 15 juil. 17:12 KZ123-2-1Chimeric.out.junction
-rw-r--r-- 1 ebordron inra       2035 15 juil. 19:08 KZ123-2-1.log
-rw-r--r-- 1 ebordron inra    5782500 15 juil. 19:08 KZ123-2-1SJ.out.tab
drwx--S--- 2 ebordron inra       4096 15 juil. 15:52 KZ123-2-1_STARgenome
drwx--S--- 2 ebordron inra       4096 15 juil. 17:10 KZ123-2-1_STARpass1
```


