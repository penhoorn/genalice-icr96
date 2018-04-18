# Methods

## Genalice reference file
Genalice Map requires a reference index for read aligment. To this end, we first made a Genalice Reference File (GRF) from fasta sequences. This GRF is a binary reference sequences, which is essential to the Genalice Aligned Reads (GAR) file format. We annotated the GRF into primary assembly and alternative contigs using a so called `alt file`.

Next, we made an comprehensive Genalice Index File (GRI) using GRF as input.

### Example command GRF file
The command line tool to create a GRF is called `gaReference` and it requires an input fasta and output GRF file. The `alt file` can be added through the `alt_file` option.

    gaReference \
            --input=reference.fa \
            --output=reference.grf \
            --alt_file=reference.alt
### Example command GRI file
The `gaIndex` tool creates a comprehensive reference index for read alignment. It requires an input GRF and output GRI file.

    gaIndex \
            --input=reference.grf \
            --output=reference.gri
            
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
