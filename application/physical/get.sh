#!/bin/bash
#set -o nounset #exit on undeclared variable

declare -a __STEPS 
input="solution.txt"
path="../../business/marketing/website/assets/images"
pixels=180

visualcube_sch="b58900,dc322f,268bd2,eee8d5,orange,859900"
visualcube_contourcolor="002b36"
visualcube_backgroundcolor="fdf6e3" #t needs format png or gif
#visualcube_view="trans"
visualcube_size="180"
visualcube_path="../../business/marketing/website/assets/images/visualcube"
visualcube_fileformat="png"

output_basepath="../../business/marketing/website/assets/images"
output_facedefinition=""

# while IFS= read -r line
# do
#   url="http://qblog.be/imagecube/imagecube.php?size=${pixels}&stickers=${line##*\_}"
#   filename="${line}_${pixels}.png"

#   echo $path/$filename $url
#   curl -o $path/$filename $url
# done < "$input"

INPUT=../../data/solutions.csv
OLDIFS=$IFS
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

#https://stackoverflow.com/a/14110529/9576512
linesToSkip=1
{
for ((i=$linesToSkip;i--;)); do read; done
while IFS=',' read -r f1 solutionid imagegenerator step variant param face_definition urlappend f6 f7
do
    if [ -z "$variant" ]; then variant="0"; fi;#do NOT compare against ${variant}
	echo "$f1 $solutionid $imagegenerator $step $variant $param $face_definition $urlappend $f6 $f7"
    if [ -z "$face_definition" ]; then output_facedefinition="solved"; else output_facedefinition=${face_definition}; fi; #room for filesystem-sanitization
    paddedstep="$( printf '%04d' "$step" )"
    if [ ! -d "${output_basepath}/${imagegenerator:-default}/${solutionid}" ]; then mkdir "${output_basepath}/${imagegenerator:-default}/${solutionid}"; fi #omitted -p on purpose
    output_pathfilename="${output_basepath}/${imagegenerator:-default}/${solutionid}/${paddedstep}-${variant}_${output_facedefinition}_${visualcube_size}.${visualcube_fileformat}"
    url="http://cube.crider.co.uk/visualcube.php?fmt=${visualcube_fileformat}&size=${visualcube_size}&cc=${visualcube_contourcolor}&bg=${visualcube_backgroundcolor}&sch=${visualcube_sch}&${param}=${face_definition}&"$urlappend
    #echo "${output_pathfilename} $url"
    echo $url
    curl -o $output_pathfilename $url --silent
done
} < "$INPUT"
IFS=$OLDIFS

#ls "${output_basepath}/${imagegenerator:-visualcube}/simple"

#![](http://cube.crider.co.uk/visualcube.php?fmt=png&size=${visualcube_size}&cc=${visualcube_contourcolor}&bg=${visualcube_backgroundcolor}&sch=${visualcube_sch}&view=${visualcube_view}&fc=twtwwwtwttrttrtttttgttgttttttttytttttottotttttbttbtttt)

#http://cube.crider.co.uk/visualcube.php?fmt=png&size=180&cc=002b36&bg=t&sch=b58900,dc322f,268bd2,eee8d5,orange,859900&view=trans&fc=twtwwwtwtttttttttttrttrttttttwtttttttttttttttttttttttt
#http://cube.crider.co.uk/visualcube.php?fmt=png&size=180&cc=002b36&bg=w&sch=b58900,dc322f,268bd2,eee8d5,orange,859900&view=trans&fc=twtwwwtwtttttttttttrttrttttttwtttttttttttttttttttttttt&&co=30
#http://cube.crider.co.uk/visualcube.php?fmt=svg&size=200&r=y45x34&cc=n&fo=100&co=35&fd=tototototttttttttttttofotfttdtodotdtttttttttttttobotbt