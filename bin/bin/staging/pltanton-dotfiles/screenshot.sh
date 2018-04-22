#!/bin/sh

OUTPUT_DIR=$HOME/screenshots
OUTPUT_NAME=shot_`date +%Y%m%d%H%M%S`.png
REMOTE=kaliwe.ru
REMOTE_PREFIX=screenshots.kaliwe.ru/anton/
PATH_ON_REMOTE=screenshots/
ERR=$OUTPUT_DIR/err.log

if maim -s $OUTPUT_DIR/$OUTPUT_NAME ; then
    # Upload to remote server
    if [[ $1 == -r ]]; then
        if scp $OUTPUT_DIR/$OUTPUT_NAME $REMOTE:$PATH_ON_REMOTE > /dev/null 2> $ERR && \
           echo -n "http://$REMOTE_PREFIX$OUTPUT_NAME" | xclip
        then
            notify-send "Seen shot send to $REMOTE, URL copied to clipboard"
        else
            notify-send "Smt went wrong. Shot saved as $OUTPUT_DIR/$OUTPUT_NAME"
        fi
    else
        if xclip -selection clipboard -t image/png -i $OUTPUT_DIR/$OUTPUT_NAME
        then
            notify-send "Your screenshot copied to clipboard"
        else
            notify-send "Smt went wrong. Shot saved as $OUTPUT_DIR/$OUTPUT_NAME"
        fi
    fi
fi
