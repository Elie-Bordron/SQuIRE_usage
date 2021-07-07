
############ sample_arguments.sh ############
#Sample arguments file for squire

# Assumes you have four SRR fastq files in directory ''
# Those fastq files should be named in the form 'SRR4016864_1.fastq.gz' and
# 'SRR4016864_2.fastq.gz


# Bash script to save and import arguments for the entire SQuIRE project

## Data information REQUIRED
virtual_env='squire'

#Location of fastq files
fastq_folder=/scratch/qtbui_TE/rawdata/

#Comma separated list of sample names found in Fastq files
samplenames=`ls $fastq_folder |  xargs | sed -e 's/ /,/g'`

#UCSC designation for genome build, eg. 'hg38'; if using custom repeatmasker file (see below), enter custom build name. 
#I did not use this
build=

#'0' if unstranded, 1 if first-strand eg Illumina Truseq, dUTP, NSR, NNSR, 2 if second-strand, eg Ligation, Standard
strandedness=1

#read length of FASTQ data
read_length=300

#I did not use this
projectname=clean_on_our_data
# Common suffix of all r1 fastq files (e.g. for project1_file1_r1.fastq.gz, r1suffix='_r1').  If unpaired data, r1suffix='.fastq'.
r1suffix=-1_1.fastq.gz

# Common suffix of all r2 fastq files (e.g. for project1_file1_r2.fastq, r2suffix='_r2').  If unpaired data, r2suffix='False'
r2suffix=-1_2.fastq.gz



##ADVANCED
#filepath of repeatmasker file(filename_rmsk.txt) if using RepeatMasker software output. Leave blank if you want repeatmasker file from UCSC
repeatmasker_file=/scratch/qtbui_TE/analysis/squire/clean_on_our_data/input/table_col_0.txt

#filepath of table of non-reference TEs (eg polymorphic or plasmid TEs) of interest.
#I did not use this
non_reference=

#desired number of EM iterations other than auto
EM=auto

#Location or variable (such as $TMPDIR) to store intermediate files
temp_folder=/scratch/qtbui_TE/analysis/squire/clean_on_our_data

#Name of basenames of samples in group 1
group1=A0008,A0014
#Name of basenames of samples in group 2
group2=CH123,CH128

#Name of condition for group 1 in squire Call
condition1=cultivated
#Name of condition for group 2 in squire Call
condition2=wild

#Desired output of figures as html or pdf
output_format=pdf

#Uncomment to normalize bedgraphs by library size (default = False) for squire Draw.
#normlib="--normlib"


#report progress of SQuIRE script
verbosity="--verbosity"

# I left this on 0
trim3=0

fetch_folder=/scratch/qtbui_TE/analysis/squire/squire_fetch
clean_folder=/scratch/qtbui_TE/analysis/squire/squire_clean/clean_on_our_data/output
map_folder=/scratch/qtbui_TE/analysis/squire/squire_map/output_run_map/map_output_for_count
count_folder=/scratch/qtbui_TE/analysis/squire/squire_count/output
draw_folder=/scratch/qtbui_TE/analysis/squire/squire_draw
call_folder=/scratch/qtbui_TE/analysis/squire/squire_call_repo 
seek_folder=/scratch/qtbui_TE/analysis/squire/squire_seek
download_folder=/scratch/qtbui_TE/analysis/squire/squire_download
