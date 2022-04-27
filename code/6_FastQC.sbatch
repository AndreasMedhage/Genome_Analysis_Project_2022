#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_4
#SBATCH -n 8
#SBATCH -t 16:00:00
#SBATCH -J Genome_analysis_2022_paper2_RNA_preprocess
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

module load bioinfo-tools FastQC

indict="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/raw_data/RNA_raw_data"
outdict="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/preprocessRNA"
trimmdict="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/trimmed_data"

fastqc -t 8 -o $outdict/fastqc -f fastq $indict/*.fastq.gz $trimmdict/*.fastq*

