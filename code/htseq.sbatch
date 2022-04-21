#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_6
#SBATCH -n 8
#SBATCH -t 16:00:00
#SBATCH -J Genome_analysis_2022_paper2_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

map="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_mapping"

module load bioinfo-tools htseq samtools

for x in $map/*; do
 samtools index x
done

htseq-count -f bam -r pos  $map/* \
 /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/annotation/prokka/annotation_L_ferriphilum.gff
