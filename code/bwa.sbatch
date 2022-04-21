#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_6
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -J Genome_analysis_2022_paper2_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

module load bioinfo-tools bwa samtools

ref="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/canu/L.Ferriphilum.contigs.fasta"
in="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/trimmed_data/"
out="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_mapping"

cd $in

bwa index ${ref}
for x in ${in}/*_paired_1.fastq; do
 xn=$(basename -s _1.fastq $x)
 bwa mem ${ref} ${xn}_1.fastq ${xn}_2.fastq | samtools sort -o ${out}/${xn}.bam
done
