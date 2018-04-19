# Methods

## Genalice reference file
Genalice Map requires a reference index for read aligment. To this end, we first made a Genalice Reference File (GRF) from fasta sequences. This GRF is a binary reference sequences, which is essential to the Genalice Aligned Reads (GAR) file format. We annotated the GRF into primary assembly and alternative contigs using a so called `alt file`. Next, we made an comprehensive Genalice Index File (GRI) using GRF as input.

We used a [shell script](scripts/reference.sh) to automate GRF and GRI construction for the two human reference assemblies. The command line tool to create a GRF is called `gaReference` and it requires an input fasta and output GRF file. The `alt file` is added through the `alt_file` option. The `gaIndex` tool creates a comprehensive reference index for read alignment. It requires an input GRF and output GRI file.


## Genalice Map
...

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
