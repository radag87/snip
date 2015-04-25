#-------------------------------------------------------------------------------
# check to see if this script is already running
#-------------------------------------------------------------------------------
function checkRunning
{
   $debug
    # check to see if I am already running
    if [[ -d /prod ]]
    then
        rundir="/prod/run"
    else
        rundir="/tmp/run"
    fi

    if [[ ! -d ${rundir} ]]
    then
        mkdir -p ${rundir}
        if [[ $? -ne 0 ]]
        then
            echoMessage ERROR "Unable to create ${rundir}"
        fi
        chmod 1777 ${rundir}
        if [[ $? -ne 0 ]]
        then
            echoMessage ERROR "Unable to set permissions on ${rundir}"
        fi
    fi

    pidfile="${rundir}/${scriptname}"

    if [[ -e ${pidfile} ]]
    then
        # the pid file exists
        read oldpid < ${pidfile}
        if [[ $? -ne 0 ]]
        then
            echoMessage ERROR "Failed to read existing ${pidfile}"
        fi

        # and it is readable
        psout=$(ps -p ${oldpid} -opid=)
        if [[ $? -eq 0 ]]
        then
            # pid is still running
            echoMessage SUCCESS "${scriptname} already running as ${oldpid}."
        else
            # pid is no longer running
            echoMessage ERROR "${scriptname} no longer running as ${oldpid}."
        fi
    else
        echo $$ > ${pidfile}
        if [[ $? -ne 0 ]]
        then
            echoMessage ERROR "Could not save $$ to ${pidfile}"
        fi
    fi
    return 0
}
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
         echo "ERROR: Failed to remove ${pidfile}"
         exit 1
      fi
   fi
   export TERM=$MYTERM
   return 0
}
