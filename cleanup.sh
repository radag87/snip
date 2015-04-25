#-------------------------------------------------------------------------------
# clean up after script is done
#-------------------------------------------------------------------------------
function cleanup
{
   $debug
   if [[ -e ${pidfile} ]];then
      rm ${pidfile}
      if [[ $? -ne 0 ]]
      then
         echo "ERR: Failed to remove ${pidfile}"
         exit 1
      fi
   fi
   export TERM=$MYTERM
   return 0
}
