#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p node
#SBATCH -n 4
#SBATCH -t 16:00:00
#SBATCH -J Genome_analysis_2022_paper2_deseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

#cat $0
#echo QOS = $SLURM_JOB_QOS

c_reads="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_mapping/htseq"
out="/proj/genomeanalysis2022/nobackup/work/amedhage/deseq2"

module load R_packages/4.1.1 
Rscript DESEQ2.R $out $c_reads

#ln -s /proj/genomeanalysis2022/nobackup/work/amedhage/deseq2 /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_expression/

