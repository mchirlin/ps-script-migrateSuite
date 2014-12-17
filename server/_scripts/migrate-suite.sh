#!/bin/bash
pushd `dirname $0` > /dev/null
. exports.sh
. exports-ant.sh
cd ant

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# 
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Main code
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Variable initialization
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

migratepath=""

CMDNAME=`basename $0`
#
USAGE="Usage: migrate-suite [option] [argument]

 Description: run this script to migrate the newest kdbs from one system to another. 

 Options:

   -target: specify the full path to the new Appian Home directory

   -keep: specify the number of existing files to keep. For data files and log files, provide an integer specifying the number of files to keep. For process archives, provide an integer specifying the number of days of archives to keep.

   -delete: specify if files should be deleted instead of moved.

 Examples:

  migrate-suite -target C:\Appian
  Will migrate the most recent kdbs to C:\Appian
"
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Parse options
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#

if [ "$1" == "-h" ] ; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-H" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-help" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "--help" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-?" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-target" ]; then
 migratepath=$2

fi

ant -f aecopyfiles.xml -Dae.source.location="$AE_HOME"  -Dbatchmode="y" -Dkdb.invertselect="n" -Dae.copycontents="n" -Dkdb.num="1" -Dkdb.bkupdir="$migratepath"
exit 1

popd > /dev/null