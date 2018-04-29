#!/bin/bash
# cnvs.sh
# bas.tolhuis@genalice.com
#   script to call cnvs with gaStructure
#------------------------------------------------------------------------------
# input variables
zscore=4.7
assembly=GRCh37.p13.genome
bed_file=bed/685e972e-7457-4dbf-8a33-3b91ae4a8f29.bed

# all gco lists
list=`ls lists/*.list`

# loop over every list
for gco_list in ${list[@]}
do
        # target name
        target=`basename $gco_list .list`

        # output files
        gco_file=controls$target.gco
        gar_file=gar_files/$assembly/$target.gar
        cnv_file=cnv_files/$assembly/$target.svn3407-filter_z${zscore}.cnv
        cap_file=cnv_files/$assembly/$target.svn3407-filter_z${zscore}.captured.cnv

        # run gastructure cnv
        gaStructure cnv \
                $gco_file \
                $gar_file \
                --output=$cnv_file \
                --base_include=0.01-2.2 \
                --cnv_exclude=0.75-1.25 \
                --min_gain_zscore=${zscore} \
                --min_loss_zscore=${zscore} \
                --zscore_handling=FILTER \
                --tab_separator
                
        # transform cnv output to temporary bed file
        grep '^chr' $flt_file > $tmp_path/temp.bed

        # intersect temp bed with captured regions to get capture only cnvs
        bedtools intersect -wb -a $bed_file -b $tmp_path/temp.bed \
                > $cap_file

        rm $tmp_path/temp.bed

done

#------------------------------------------------------------------------------
