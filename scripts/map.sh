#!/bin/bash
# map.sh
# bas.tolhuis@genalice.com
#   read mapping and metrics for 96 samples of ICR96 dataset
#------------------------------------------------------------------------------
# input fastq file list
list=`ls json/*.json`

#------------------------------------------------------------------------------
# loop over assemblies
for assembly in GRCh37.p13.genome GCA_000001405.15_GRCh38_full_plus_hs38d1_analysis_set
do
        # select fasta and alt_file
        grf=references/$assembly.grf
        gri=references/$assembly.gri

        # start server
        gaServer \
                --server_name=$assembly \
                --index=$gri \
                --reference=$grf \
                --report_file=log/$assembly.gaserver.log \
                --error_file=log/$assembly.gaserver.err
        
        # loop over input file list
        for myJson in ${list[@]}
        do
                # sample name
                sample=`basename $myJson .json`
                
                # read mapping per sample
                gaMap \
                        --server_name=$assembly \
                        --input=json/$myJson \
                        --output=gar_files/$assembly/$sample.gar \
                        --cmd_file=configs/human.map.conf \
                        --alt_score_bias=0.9 \
                        --report_file=log/$sample.mapping.trc \
                        --error_file=log/$sample.mapping.err
                        
        done
        
        # stop server
        gaMap --server_name=$assembly --stop_server
                
done

#------------------------------------------------------------------------------
