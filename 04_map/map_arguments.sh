############ clean_arguments.sh ############
# Bash script to save and import arguments for squire clean

## Data information REQUIRED
virtual_env='squire'

fastq_folder=/scratch/qtbui_TE/raw_data/GEP4TWAS_rawdata
#Location of fastq files

samplenames=`ls $fastq_folder |  xargs | sed -e 's/ /,/g'`
#Comma separated list of sample names found in Fastq files

build=Marouch
#UCSC designation for genome build, eg. 'hg38'; if using custom repeatmasker file (see below), enter custom build name

strandedness=1
#'0' if unstranded, 1 if first-strand eg Illumina Truseq, dUTP, NSR, NNSR, 2 if second-strand, eg Ligation, Standard

read_length=100
#read length of FASTQ data

projectname=Marouch

## ADVANCED

temp_folder=/scratch/qtbui_TE/04_map/tmp
#Location or variable (such as $TMPDIR) to store intermediate files

verbosity="--verbosity"
#report progress of SQuIRE script

trim3=0

fetch_folder=/scratch/qtbui_TE/03_fetch/Marouch
clean_folder=/scratch/qtbui_TE/02_clean/Marouch
map_folder=/scratch/qtbui_TE/04_map

