#!/bin/sh

#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

FILE_CMD=$1
FILE_HIS=$2

KEY_2="^X^F^G^H^I^J"

echo -n bindkey -s \"${KEY_2}\" > $FILE_CMD
echo -n " " >> $FILE_CMD

fzf --tac --no-sort < $FILE_HIS | \
    sed -e 's,\\,\\\\\\\\,g' | \
    sed -e 's, ,\\ ,g'  | \
    sed -e "s,',\\',g"  | \
    sed -e 's,",\\",g'  | \
    sed -e 's,\$,\\$,g' | \
    sed -e 's,#,\\#,g'  | \
    sed -e 's,`,\\`,g'  | \
    sed -e 's,&,\\&,g'  | \
    sed -e 's,(,\\(,g'  | \
    sed -e 's,),\\),g'  | \
    sed -e 's,~,\\~,g'  | \
    sed -e 's,\[,\\[,g' | \
    sed -e 's,],\\],g'  | \
    sed -e 's,{,\\{,g'  | \
    sed -e 's,\},\\},g' | \
    sed -e 's,<,\\>,g'  | \
    sed -e 's,>,\\>,g'  | \
    sed -e 's,\;,\\;,g' | \
    sed -e 's,\|,\\|,g' | \
    sed -e 's,\?,\\?,g' | \
    sed -e 's,\^,\\\\^,g' \
    >> $FILE_CMD

# TODO:
# csh: cat LINES | fzf | sed -e 's,1,Y,' => press Esc => $? == 130
# sh:  cat LINES | fzf | sed -e 's,1,Y,' => press Esc => $? == 0
ret=$?
echo ".. [$ret]"

if [ $ret -ne 0 ]; then
    echo bindkey \"${KEY_2}\" backward-char > $FILE_CMD
fi

rm -f $FILE_HIS

unset FILE_CMD
unset FILE_HIS
unset KEY_2

