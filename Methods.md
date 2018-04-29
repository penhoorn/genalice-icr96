# Methods

## Genalice reference file
Genalice Map requires a reference index for read aligment. To this end, we first made a Genalice Reference File (GRF) from fasta sequences. This GRF is a binary reference sequences, which is essential to the Genalice Aligned Reads (GAR) file format. We annotated the GRF into primary assembly and alternative contigs using a so called `alt file`. Next, we made an comprehensive Genalice Index File (GRI) using GRF as input.

We used a [shell script](scripts/reference.sh) to automate GRF and GRI construction for the two human reference assemblies. The command line tool to create a GRF is called `gaReference` and it requires an input fasta and output GRF file. The `alt file` is added through the `alt_file` option. The `gaIndex` tool creates a comprehensive reference index for read alignment. It requires an input GRF and output GRI file.


## Genalice Map
Genalice Map aligns short sequence reads to the reference index (GRI) with a patented high performance mapping algorithm (REF). First, the GRI is loaded into memory (RAM) and subsequently raw sequence reads of a single sample are matched to the index in memory.  After all sequence reads have been processed the alignment result is written to disk in the GAR file format. This mapping procedure repeats itself for every sample of the ICR96 dataset, while the GRI remains in memory. 

The read alignment tool is set up for optimal results using the configuration files described in the [Materials](Materials.md) section. The exact commands and configurations used in this study can be found [here](scripts/map.sh). The `gaServer` tool loads the GRI into memory as a `named server`. The `gaMap` tool is the client that sends alignemnt jobs to the `named server` instance. Each alignment job consists of the following components:

* `input` defines raw sequence reads in FASTQ format as a list in JSON format. Each sample has its own [JSON input file](json) describing the location of (multiple) first and second in pair FASTQ files.
* `output` defines the output GAR file.
* `cmd_file` defines the [configuration file](configs/human.map.conf) consisting of alignment parameters.
* `alt_score_bias=0.9` defines a mapping bias in favor of the primary sequence relative to the alternative contigs. An `alt_score_bias` larger than 1 indicates a bias in favor of the alternative contigs, while a score of 1 indicates no bias. The bias results in a preferable mapping location when a read is equally likely to align to a primary sequence or alternative contig.
* `capture_bed_file` defines the captured regions of a targeted NGS assay in BED format. These regions are used to accurately calculate coverage depth over the captured regions, which is essential for copy number detection. 

## Genalice CNV
...

### Control group
...

### CNV calling
...

## Gene plots
...

## Single base resolution analysis
...
