# RNASeq_FASTQ-Counts
Docker/Singularity container for workflow of pre-processing steps (fastq.gz to bam file format) required for a typical RNA sequencing experiment for transcriptome profiling or differential expression for species with an available reference genome. 

## A few examples
To build use
```sudo docker build -t star .```

Or To run with singularity use
```singularity exec docker://nbutter/star STAR```


If you have used this work, you must acknoledge SIH, e.g: "The authors acknowledge the technical assistance provided by the Sydney Informatics Hub, a Core Research Facility of the University of Sydney."
