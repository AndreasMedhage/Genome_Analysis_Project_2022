# GenomeAnalysis
Genome analysis project/code

Directory for storing scripts used in the project

1_canu.sbatch - sbatch script for assembling (and built in trimming) of the PacBio long reads using canu

2_quast.sbatch - sbatch script for quality assesment of assembly using quast

3_prokka.sbatch - sbatch script for annotating genome using prokka

4_blastn.sbatch - sbatch script homology study using blastn

5_trimmomatic.sbatch - sbatch script for preprocessing of Illumina short RNA reads using Trimmomatic

6_FastQC.sbatch - sbatch script for quality assesment of short RNA reads and trimmed read using FastQC

7_bwa.sbatch - script for mapping Illumina short reads to the genome assembly

8_htseq.sbatch - script counting mapped reads

TruSeq3-PE.fa - adapter file for trimming

logs - loggs from slurm
