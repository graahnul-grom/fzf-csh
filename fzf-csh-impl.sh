#!/bin/sh

#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

FILE_CMD=$1

KEY_2="^X^F^G^H^I^J"

echo -n bindkey -s \"${KEY_2}\" > $FILE_CMD
echo -n " " >> $FILE_CMD

set -o pipefail

while read line; do echo $line; done | \
fzf --tac --no-sort | \
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

if [ $? -ne 0 ]; then
    echo bindkey \"${KEY_2}\" backward-char > $FILE_CMD
fi

unset FILE_CMD
unset KEY_2

