#! /bin/bash

####################################################################
# Function :pool seq with filename in header                       #
# Platform :All Linux Based Platform                               #
# Version  :1.0                                                    #
# Date     :2023-03-17                                             #
# Author   :Yihsuan Wu                                             #
# Contact  :yixuan.w99@gmail.com                                   #
####################################################################

#-------------------
input_fasta_dir="/home2/yxwu/Probe_final/10gene_0411"
output_dir="/home2/yxwu/Probe_final"
#-------------------

for file in "$input_fasta_dir"/*.fas
do
  sed -i 's/\r//g' ${file}
  file_name=${file##*/}
  file_name_to_add=${file_name%_copy1.fas}
  # file_name_to_add2=${file_name_to_add#final_trim_}
  echo "processing: "${file_name%\.fas}
  awk -v file_name_add=${file_name_to_add} '/^>/ {printf("%s_from_%s\n",$0,file_name_add);next; } { printf("%s\n",$0);}' < ${file} >> "${output_dir}"/pooled.fas
  # while read line
  # do
    # awk 
  # done < "${file}"
done