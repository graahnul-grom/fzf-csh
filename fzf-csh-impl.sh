#!/bin/sh

# fzf-csh: C shell (csh) history support for fzf
#
# home page: https://github.com/graahnul-grom/fzf-csh
# copyright (c) 2022 dmn <graahnul.grom@ya.ru>
# license: BSD
# fzf home page: https://github.com/junegunn/fzf
#

FILE_CMD=$1

KEY_2="^X^F^G^H^I^J"

echo -n bindkey -s \"${KEY_2}\" > $FILE_CMD
echo -n " " >> $FILE_CMD

set -o pipefail

SED="sed -E"

while read line; do echo $line; done | \
fzf --tac --no-sort | \
    $SED -e 's,\\,\\\\\\\\,g' | \
    $SED -e 's, ,\\ ,g'       | \
    $SED -e "s,',\\',g"       | \
    $SED -e 's,",\\",g'       | \
    $SED -e 's,\$,\\$,g'      | \
    $SED -e 's,#,\\#,g'       | \
    $SED -e 's,`,\\`,g'       | \
    $SED -e 's,&,\\&,g'       | \
    $SED -e 's,\(,\\(,g'      | \
    $SED -e 's,\),\\),g'      | \
    $SED -e 's,~,\\~,g'       | \
    $SED -e 's,\[,\\[,g'      | \
    $SED -e 's,],\\],g'       | \
    $SED -e 's,\{,\\{,g'      | \
    $SED -e 's,\},\\},g'      | \
    $SED -e 's,<,\\<,g'       | \
    $SED -e 's,>,\\>,g'       | \
    $SED -e 's,\;,\\;,g'      | \
    $SED -e 's,\|,\\|,g'      | \
    $SED -e 's,\?,\\?,g'      | \
    $SED -e 's,\^,\\\\^,g'      \
    >> $FILE_CMD

if [ $? -ne 0 ]; then
    echo bindkey \"${KEY_2}\" backward-char > $FILE_CMD
fi

unset FILE_CMD
unset KEY_2

