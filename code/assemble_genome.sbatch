#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J Genome_analysis_2022_paper2_genome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se
#SBATCH -o /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/code/logs
#SBATCH -e /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/code/logs


module load bioinfo-tools
module load canu/2.0

canu -p L.Ferriphilum \
 -d /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/canu \
 genomeSize=2.4m useGrid=false -maxThreads=4 \
 -pacbio-raw /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/raw_data/DNA_raw_data/*
