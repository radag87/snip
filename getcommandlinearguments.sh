#-------------------------------------------------------------------------------
# get command line arguments
#-------------------------------------------------------------------------------
unset argument
replace=0
# : means expect argument value (no colon means flag type argument)
while getopts "a:r" arg
do
   case $arg in
      a)
         argument=${OPTARG}
         ;;
      r)
         replace=1
         ;;
      *)
         usage
         ;;
   esac
done
