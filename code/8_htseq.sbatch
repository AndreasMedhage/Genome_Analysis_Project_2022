#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p node
#SBATCH --reservation=uppmax2022-2-5_6
#SBATCH -n 4
#SBATCH -t 16:00:00
#SBATCH -J Genome_analysis_2022_paper2_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user Andreas.Medhage.8947@student.uu.se

cat $0
echo QOS = $SLURM_JOB_QOS

map="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_mapping/bwa"
out="/proj/genomeanalysis2022/nobackup/work/amedhage/htseq"
gff="/home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/annotation/clean.gff"


module load bioinfo-tools htseq samtools

for x in $map/*.bam; do
 xn=$(basename -s .bam $x)
 samtools index $x
 htseq-count -f bam -r pos -i gene_name -s no -t cds $x $gff -o $out/$xn
done

ln -s /proj/genomeanalysis2022/nobackup/work/amedhage/htseq /home/amedhage/GenomeAnalysis/Genome_Analysis_Project_2022/analysis/transcript_mapping/
