#!/bin/bash -l
#SBATCH -A uppmax2022-2-5_1
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J Genome_analysis_2022_paper2_genome_assembly

module load bioinfo-tools
module load canu

canu \
 -p L.Ferriphilum -d /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly \
 genomeSize=2.41m \
 -maxThreads=2 \
 useGrid=false \
 -pacbio /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/raw_data/DNA_raw_data/*
