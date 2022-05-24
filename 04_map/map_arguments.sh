############ clean_arguments.sh ############
# Bash script to save and import arguments for squire clean

## Data information REQUIRED
virtual_env='squire'
fastq_folder=/scratch/qtbui_TE/raw_data/test_fastq

#Location of fastq files
samplenames=`ls $fastq_folder |  xargs | sed -e 's/ /,/g'`
#Comma separated list of sample names found in Fastq files
build=Marouch
#UCSC designation for genome build, eg. 'hg38'; if using custom repeatmasker file (see below), enter custom build name
strandedness=1
#'0' if unstranded, 1 if first-strand eg Illumina Truseq, dUTP, NSR, NNSR, 2 if second-strand, eg Ligation, Standard
read_length=150
#read length of FASTQ data
#
projectname=02_clean
#
#r1suffix=-1_1.fastq.gz
# Common suffix of all r1 fastq files (e.g. for project1_file1_r1.fastq.gz, r1suffix='_r1').  If unpaired data, r1suffix='.fastq'.
#r2suffix=-1_2.fastq.gz
# Common suffix of all r2 fastq files (e.g. for project1_file1_r2.fastq, r2suffix='_r2').  If unpaired data, r2suffix='False'
#
#ADVANCED
#repeatmasker_file=/scratch/qtbui_TE/03_fetch/Marouch_rmsk.txt
#filepath of repeatmasker file if using RepeatMasker software output (Leave blank if you want repeatmasker file from UCSC)
#
#non_reference=
#filepath of table of non-reference TEs (eg polymorphic or plasmid TEs) of interest
#
#EM=auto
#desired number of EM iterations other than auto
#
temp_folder=/scratch/qtbui_TE/04_map/tmp
#Location or variable (such as $TMPDIR) to store intermediate files
#
#group1=
#Name of basenames of samples in group 1
#group2=
#Name of basenames of samples in group 2
#
#condition1=cultivated
#Name of condition for group 1 in squire Call
#condition2=wild
#Name of condition for group 2 in squire Call
#
#output_format=pdf
#Desired output of figures as html or pdf
#
#normlib="--normlib"
#Uncomment to normalize bedgraphs by library size (default = False) for squire Draw.
#
verbosity="--verbosity"
#report progress of SQuIRE script
#
trim3=0

#fetch_folder=/scratch/qtbui_TE/03_fetch
clean_folder=/scratch/qtbui_TE/02_clean
#map_folder=/scratch/qtbui_TE/04_map
#count_folder=/scratch/qtbui_TE/05_count
# draw_folder=/scratch/qtbui_TE/analysis/squire/squire_draw
# call_folder=/scratch/qtbui_TE/analysis/squire/squire_call
# seek_folder=/scratch/qtbui_TE/analysis/squire/squire_seek
# download_folder=/scratch/qtbui_TE/analysis/squire/squire_download

