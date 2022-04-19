# GenomeAnalysis
Genome analysis project/code

Directory for storing scripts used in the project

assemble_genome.sbatch - sbatch script for (the trimming) and the assembly of the PacBio long reads using canu
quality_assembly.sbatch - sbatch script for quality assesment of canu assembly
annotation.sbatch - sbatch script for annotating genome using prokka

synteny.sbatch - sbatch script homology study using blastn

trimm_RNA.sbatch - sbatch script for preprocessing of Illumina short RNA reads using Trimmomatic
check_RNA.sbatch - sbatch script for quality assesment of short RNA reads and trimmed read using FastQC


logs - loggs from slurm

