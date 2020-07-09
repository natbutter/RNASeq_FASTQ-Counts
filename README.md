# RNASeq_FASTQ-Counts
Docker/Singularity container for workflow of pre-processing steps (fastq.gz to bam file format) required for a typical RNA sequencing experiment for transcriptome profiling or differential expression for species with an available reference genome. 

## A few examples
To build with docker, change into the directory with the "Dockerfile" and execute:
```sudo docker build -t star .```

Then run with docker using:
```docker run star STAR```

Or to run the dockerhub version directly:
```docker run nbutter/star STAR```

To build the docker image with singularity use:
```sudo singularity build star.sif docker://nbutter/star```

Or if you want to build the local singularity image use:
```sudo singularity build star.sif star.build```

To run the docker contianer with singularity use:
```singularity exec docker://nbutter/star STAR```

Or to run your locally built singularity image use:
```singularity exec star.sif STAR```


If you have used this work, you must acknoledge SIH, e.g: "The authors acknowledge the technical assistance provided by the Sydney Informatics Hub, a Core Research Facility of the University of Sydney."
