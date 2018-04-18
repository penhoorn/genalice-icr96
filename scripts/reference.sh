#!/bin/bash
# reference.sh
# bas.tolhuis@genalice.com
#   prepare GRF and GRI prior to mapping
#------------------------------------------------------------------------------
# reference assemblies
ref37=references/GRCh37.p13.genome.fa
alt37=references/GRCh37.p13.genome.alt
ref38=references/GCA_000001405.15_GRCh38_full_plus_hs38d1_analysis_set.fa
alt38=references/GCA_000001405.15_GRCh38_full_plus_hs38d1_analysis_set.alt

#------------------------------------------------------------------------------
# GRF/GRI files
for assembly in GRCh37.p13.genome GCA_000001405.15_GRCh38_full_plus_hs38d1_analysis_set
do
        # select fasta and alt_file
        if [ "$assembly" == "GRCh37.p13.genome" ]; then
                fasta=$ref37
                altfile=$alt37
        else
                fasta=$ref38
                altfile=$alt38
        fi
        
        # create grf
        gaReference \
                --input=$fasta \
                --output=references/$assembly.grf \
                --alt_file=$altfile \
                --report_file=log/$assembly.gareference.log \
                --error_file=log/$assembly.gareference.err
                
        # create gri
        gaIndex \
                --input=references/$assembly.grf \
                --output=references/$assembly.gri \
                --report_file=log/$assembly.gaindex.log \
                --error_file=log/$assembly.gaindex.err
                
done

#------------------------------------------------------------------------------
