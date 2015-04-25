#-------------------------------------------------------------------------------
# general message processor
#-------------------------------------------------------------------------------
function echoMessage
{
   $debug
   if [[ -z $1 ]];then
      echo "ERROR ${scriptname} `date` echoMessage called with no arguments."
      cleanup
      exit 1
   fi
   condition=$1
   shift
   echo "$condition: ${scriptname} `date` $*"
   case $condition in
      INFO)
         return 0
         ;;
      DEBUG)
         return 0
         ;;
      SUCCESS)
         cleanup
         # mail function goes here
         exit $?
         ;;
      USAGE)
         cleanup
         # mail function goes here
         exit 1
         ;;
      ERROR)
         cleanup
         # mail function goes here
         exit 1
         ;;
      *)
         cleanup
         # mail function goes here
         exit 1
         ;;
   esac
}
