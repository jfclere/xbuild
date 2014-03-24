#!/bin/sh
#
TARGET=jb-ep-6.2-win-candidate
VM=jboss-natives-20110516-1
CMD=win-build
for o
do
    case $o in
        --target=* )
            TAG="`sed 's/.*=//'`"
            shift
        ;;
        --vm=* )
            VM="`sed 's/.*=//'`"
            shift
        ;;
        --*    )
            CMD="$CMD $o"
            shift
        ;;
        *      )
          echo "Unknown option $o"
          exit 1
        ;;
    esac
done
HEAD=`svn info http://anonsvn.jboss.org/repos/xbuild/branches/xbuild-2.1.0 | grep Revision: | sed 's/.*: //'`
echo "$CMD $TARGET svn+http://anonsvn.jboss.org/repos/xbuild/branches?xbuild-2.1.0#$HEAD $VM"
brew $CMD $TARGET svn+http://anonsvn.jboss.org/repos/xbuild/branches?xbuild-2.1.0#$HEAD $VM
