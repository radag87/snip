#-------------------------------------------------------------------------------
# initialization
#-------------------------------------------------------------------------------
debug="set -x"
unset debug # comment out this line if you want to see what is going on
$debug

MYTERM=$TERM
export TERM=dumb # needed for universe processing

scriptname=$(basename $0)
if [[ -z ${scriptname} ]]
then
    echoMessage ERROR "Unable to determine script name in $0."
fi

scriptpath=$(dirname $0)
if [[ -z ${scriptpath} ]]
then
    echoMessage ERROR "Unable to determine script path in $0."
fi

# make sure you can find universe
read uvhome < /.uvhome
if [[ $? -ne 0 ]];then
  echoMessage ERROR "Could not read /.uvhome"
fi

which uvsh >/dev/null 2>&1
if [[ $? -ne 0 ]];then
  export PATH=$PATH:${uvhome}/bin
fi

# check to see if this script is already running
checkRunning
