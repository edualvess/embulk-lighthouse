#!/bin/bash
#CONFIG_PATH="/usr/tmp/config.yml"

if [ -f /opt/embulk/plugins.txt ]; then
    for plugin in `cat /opt/embulk/plugins.txt`; do
        java -jar /opt/embulk/embulk.jar gem install $plugin
    done
fi

CONFIG_DIR='/tmp/config.yml'
echo "${@}"
if [ -z "$BASE64_CONFIG" ]
then
    # NOT BASE64
    echo "Running embulk without base64 config, a volume should be mapped"
    exec java $JAVA_OPTS -jar /opt/embulk/embulk.jar "${@}"
else
    # BASE64
    echo "Running embulk with base64 config, decoding string to $CONFIG_DIR"
    echo $BASE64_CONFIG | base64 -d > $CONFIG_DIR
    if [ -z "$INCREMENTAL" ]
    then
        # NOT INCREMENTAL
        exec java $JAVA_OPTS -jar /opt/embulk/embulk.jar run $CONFIG_DIR
    fi
fi