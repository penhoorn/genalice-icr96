# Methods

## Genalice reference file
Genalice Map requires a reference index for read aligment. To this end, we first made a Genalice Reference File (GRF) from fasta sequences. This GRF is a binary reference sequences, which is essential to the Genalice Aligned Reads (GAR) file format. We annotated the GRF into primary assembly and alternative contigs using a so called `alt file`. Next, we made an comprehensive Genalice Index File (GRI) using GRF as input.

We used a [shell script](scripts/reference.sh) to automate GRF and GRI construction for the two human reference assemblies. The command line tool to create a GRF is called `gaReference` and it requires an input fasta and output GRF file. The `alt file` is added through the `alt_file` option. The `gaIndex` tool creates a comprehensive reference index for read alignment. It requires an input GRF and output GRI file.


## Genalice Map
Genalice Map aligns short sequence reads to the reference index (GRI) with a patented high performance mapping algorithm (REF). First, the GRI is loaded into memory (RAM) and subsequently raw sequence reads of a single sample are matched to the index in memory.  After all sequence reads have been processed the alignment result is written to disk in the GAR file format. This mapping procedure repeats itself for every sample of the ICR96 dataset, while the GRI remains in memory. 

The read alignment tool is set up for optimal results using the configuration files described in the [Materials](Materials.md) section. The exact commands and configurations used in this study can be found [here](scripts/map.sh).

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
