#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_5
#SBATCH -n 16
#SBATCH -t 16:00:00
#SBATCH -J Genome_analysis_2022_paper2_RNA_preprocess
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

module load bioinfo-tools trimmomatic

indict="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/raw_data/RNA_raw_data"
outdict="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/preprocessRNA"
trimmdict="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/trimmed_data"

for x in $indict/*_1.fastq.gz; do
 xn=$(basename -s _1.fastq.gz $x)

 trimmomatic PE -threads 4 -phred33 \
 $indict/${xn}_1.fastq.gz $indict/${xn}_2.fastq.gz \
 $trimmdict/${xn}_p_1.fastq.gz \
 $trimmdict/${xn}_u_1.fastq.gz \
 $trimmdict/${xn}_p_2.fastq.gz \
 $trimmdict/${xn}_u_2.fastq.gz \
 ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
 SLIDINGWINDOW:4:15
done

