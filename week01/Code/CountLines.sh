
#!/bin/bash

#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' CountLines.sh
#----------------------------------------------------------------------------

NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo


# ERROR: line 10: $1: ambiguous redirect?????????


