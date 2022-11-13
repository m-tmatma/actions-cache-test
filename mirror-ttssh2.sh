#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
URL=file://$SCRIPT_DIR/ttssh2

cd $SCRIPT_DIR
if [ ! -d ttssh2 ]; then
    svnadmin create ttssh2

    cd $SCRIPT_DIR/ttssh2
    echo '#!/bin/sh'  > hooks/pre-revprop-change
    echo 'exit 0'    >> hooks/pre-revprop-change
    chmod +x            hooks/pre-revprop-change

    svnsync init $URL http://svn.osdn.net/svnroot/ttssh2/
fi

cd $SCRIPT_DIR/ttssh2
svnsync sync $URL
