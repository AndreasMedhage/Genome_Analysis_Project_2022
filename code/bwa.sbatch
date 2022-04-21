#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH --reservation=uppmax2022-2-5_5
#SBATCH -t 10:00:00
#SBATCH -J Genome_analysis_2022_paper2_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

module load bioinfo-tools bwa samtools

ref="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/canu/L.Ferriphilum.contigs.fasta"
in="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/trimmed_data"
out="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_mapping"

bwa index ${ref}
for x in ${in}/*_p_1.fastq.gz; do
 xn=$(basename -s _1.fastq.gz $x)
 bwa mem -t 8 ${ref} ${in}/${xn}_1.fastq.gz ${in}/${xn}_2.fastq.gz | samtools sort -@8 -o ${out}/${xn}.bam
done
