#!/bin/bash

function usage
{
    echo "typesetacesdocs - typesets each of the ACES documents using pdflatex"
    echo "                  The result is a PDF in each of the document folders" 
    echo ""
    echo "usage:"
    echo "    typsetacesdocs [ -k ]"
    echo ""
    echo "options:"
    echo "    -k | --keep-logs   Preserves the log files from the typesetting"
    echo "                       (by default, extra files are cleaned up)"
}

### MAIN
K=0

while [ "$1" != "" ]; do
    case $1 in
        -k | --keep-logs )    shift
                              K=1
                              ;;
        -h | --help )         usage
                              exit
                              ;;
        * )                   usage
                              exit 1
    esac
    shift
done

for d in */ ; do
    FILENAME=${d%/}
    
#     if [ "$FILENAME" != "template" ]
#     if [ "$FILENAME" == "S-2014-006" ]
    if [ "$FILENAME" == "ACES-Document-Manifest" ]
      then
        echo $FILENAME

        cd $FILENAME
        pdflatex $FILENAME.tex
        pdflatex $FILENAME.tex
        
        if [ !$K ]
          then
            rm ${FILENAME}.aux
            rm ${FILENAME}.log
            rm ${FILENAME}.out
            rm ${FILENAME}.toc
        fi        

#         cp ${FILENAME}.pdf /Users/scott/Dropbox/work/ACES/Internal/Documents/dev/
#         cp ${FILENAME}.pdf /Users/scott/Dropbox/work/ACES/Public/aces-dev/docs/
#         cp ${FILENAME}.pdf /Users/scott/Dropbox\ \(Academy\)/work/ACES/Public/aces-dev/docs
#         cp ${FILENAME}.pdf /Users/scott/tmp/docs/

        cd ..        
    fi    

done

# FILEPATH=${FILE%/*}
# FILENAME=${FILE##*/}
# FILENAME=${FILENAME%%.*}

# pdflatex /Users/scott/Documents/ampas/iif/aces-dev/documents/P-2013-001/P-2013-001.tex