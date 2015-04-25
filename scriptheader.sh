\#!/bin/ksh
\# author: #name#
\# date  : #date#-#time#
\# description: enter description
\#-------------------------------------------------------------------------------
\# everybody knows what this if for
\#-------------------------------------------------------------------------------
function usage
{
   $debug
   echo "USAGE: ${scriptname} -s source -a account [-r revision] [-u username] [-p password]"
   echo "WHERE: source   - subversion repository directory to check out"
   echo "       account  - target account where assets will be delivered in /app"
   echo "       revision - for checkout (svn default applies)"
   echo "       username - for checkout (svn default applies)"
   echo "       password - for checkout (requested interactively)"
   echoMessage USAGE "Finished"
}
