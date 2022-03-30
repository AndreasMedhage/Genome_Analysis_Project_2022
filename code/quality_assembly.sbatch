#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_2
#SBATCH -n 1
#SBATCH -t 20:00
#SBATCH -J Genome_analysis_2022_paper2_quality_assembly
#SBATCH --mail-type = ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se
#SBATCH -o /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/code/logs
#SBATCH -e /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/code/logs

module load bioinfo-tools
module load quast

quast.py -o /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/quast \
--threads 1 \
-r /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/raw_data/reference/OBMB01.fasta \
/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/canu/L.Ferriphilum.contigs.fasta
