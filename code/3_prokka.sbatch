#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_2
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J Genome_analysis_2022_paper2_prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

module load bioinfo-tools
module load prokka

prokka \
 --outdir /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/annotation/prokka --prefix annotation \
 --addgenes --cpus 2 --kingdom Bacteria --species Leptospirillum_ferriphilum --strain DSM_14647T \
 /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/canu/L.Ferriphilum.contigs.fasta

