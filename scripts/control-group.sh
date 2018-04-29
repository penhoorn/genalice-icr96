#!/bin/bash
# bas.tolhuis@genalice.com
#   script to create GCO file for every target sample
#------------------------------------------------------------------------------
# Use alignment data from two assemblies
for assembly in GRCh37.p13.genome GCA_000001405.15_GRCh38_full_plus_hs38d1_analysis_set
do
        # data paths
        gco_path=controls/$assembly

        # list all sample lists
        list=`ls lists/$assembly/*.list`
        
        # loop over list
        for gco_list in ${list[@]}
        do
                # sample name
                name=`basename $gco_list .list`
                
                # gco filename
                gco_file=controls/$assembly/$name.gco

                # create gco
                gaStructure create \
                        $gco_list \
                        $gco_file
                
        
        done
done
#------------------------------------------------------------------------------
