
From ubuntu:16.04

#Initial module requirements on Artemis
#module load fastqc/0.11.8
#module load star/2.6.1b
#module load star/2.7.2b
#module load samtools/1.9
#module load python/2.7.9

WORKDIR /build

#Build unix stuff
RUN apt-get update -y && \
apt install build-essential -y && \
apt install -y default-jre wget unzip bzip2 liblzma-dev libncurses5-dev libncursesw5-dev libbz2-dev libz-dev libcurl4-gnutls-dev python2.7-dev python-numpy python-matplotlib python-pysam python-htseq python-pip &&\
rm -rf /var/lib/apt/lists/*

#Download required files
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip && \
wget https://github.com/alexdobin/STAR/archive/2.6.1b.zip && \
wget https://github.com/alexdobin/STAR/archive/2.7.2b.zip && \
wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \ 
wget https://downloads.sourceforge.net/project/bbmap/BBMap_38.86.tar.gz

#Unpack all the downloads
RUN unzip fastqc_v0.11.8.zip &&\ 
unzip 2.6.1b.zip &&\
unzip 2.7.2b.zip &&\ 
tar -xjvf samtools-1.9.tar.bz2 &&\ 
tar -xzvf BBMap_38.86.tar.gz

#Install the things
RUN  cd /build/STAR-2.6.1b/source && \
make STAR

RUN cd /build/samtools-1.9/ && \ 
./configure --prefix=/build/samtools-1.9/ && \ 
make && \ 
make install

RUN cd /build && wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 &&\
tar -vxjf htslib-1.9.tar.bz2 &&\
cd htslib-1.9 && \
make

RUN cd /build/STAR-2.7.2b/source && \
make STAR

RUN pip install --upgrade pip
RUN pip install multiqc

RUN cd /build && rm -rf fastqc_v0.11.8.zip htslib-1.9.tar.bz2 2.6.1b.zip 2.7.2b.zip samtools-1.9.tar.bz2 BBMap_38.86.tar.gz samtools-1.9 
