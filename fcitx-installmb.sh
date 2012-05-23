#!/bin/sh

txt=$1

if test "x$txt" = "x"; then
    if test "x$KDE_FULL_SESSION" = "xtrue" && which kdialog; then
        txt=`kdialog --getopenfilename . "*.txt"`
    else
        if which zenity; then
            txt=`zenity --file-selection --file-filter="*.txt"`
        else
            echo "please use $0 [txt file name]"
            exit 1
        fi
    fi
fi

if test "x$txt" = "x"; then
    exit 1;
fi

filename=`basename $txt`

name=${filename/.txt/}
mb=$name.mb

echo "compile txt2mb..."

txt2mb $txt $mb || return 1

echo "done"

if [ ! -f $mb ]; then
    echo "table generate error"
fi

tempfile=`mktemp`

echo "[CodeTable]" >> $tempfile
echo "Name=$name" >> $tempfile
echo "IconName=$name" >> $tempfile
echo "File=$mb" >> $tempfile
echo "AdjustOrder=AdjustFreq" >> $tempfile
echo "UsePY=False" >> $tempfile
echo "AutoSend=-1" >> $tempfile
echo "UseMatchingKey=False" >> $tempfile
echo "NoneMatchAutoSend=-1" >> $tempfile
echo "AutoPhrase=False" >> $tempfile
echo "ExactMatch=False" >> $tempfile
echo "PromptTableCode=False" >> $tempfile

mkdir -p ~/.config/fcitx/table
mv $tempfile ~/.config/fcitx/table/$name.conf
mv $mb ~/.config/fcitx/table/

echo "Check your config file"
xdg-open ~/.config/fcitx/table/$name.conf
