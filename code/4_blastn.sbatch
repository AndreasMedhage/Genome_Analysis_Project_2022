#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH --reservation=uppmax2022-2-5_10
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -J Genome_analysis_2022_paper2_synteny
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

module load bioinfo-tools blast

in="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/assembly/canu/L.Ferriphilum.contigs.fasta"
out="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/synteny/blastn.out"
ref="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/data/raw_data/reference/OBMB01.fasta"

blastn -query $in -subject $ref -out $out -outfmt 6
