#!/usr/bin/env csh

# fzf-csh: C shell (csh) history support for fzf
#
# home page: https://github.com/graahnul-grom/fzf-csh
# copyright (c) 2022 dmn <graahnul.grom@ya.ru>
# license: BSD
# fzf home page: https://github.com/junegunn/fzf
#

if ( $#argv != 1 ) then
    exit 1
endif

set FILE_CMD = $1

set KEY_2 = "^X^F^G^H^I^J"

echo -n bindkey -s \"${KEY_2}\" >! $FILE_CMD
echo -n " " >> $FILE_CMD

fzf --tac --no-sort | \
    sed -E -e 's,\\,\\\\\\\\,g' \
         -e 's, ,\\ ,g'       \
         -e "s,',\\',g"       \
         -e 's,",\\",g'       \
         -e 's,\$,\\$,g'      \
         -e 's,#,\\#,g'       \
         -e 's,`,\\`,g'       \
         -e 's,&,\\&,g'       \
         -e 's,\(,\\(,g'      \
         -e 's,\),\\),g'      \
         -e 's,~,\\~,g'       \
         -e 's,\[,\\[,g'      \
         -e 's,],\\],g'       \
         -e 's,\{,\\{,g'      \
         -e 's,\},\\},g'      \
         -e 's,<,\\<,g'       \
         -e 's,>,\\>,g'       \
         -e 's,\;,\\;,g'      \
         -e 's,\|,\\|,g'      \
         -e 's,\?,\\?,g'      \
         -e 's,\^,\\^,g'      \
    >> $FILE_CMD

if ( $? != 0 ) then
    echo bindkey \"${KEY_2}\" backward-char >! $FILE_CMD
endif

unset FILE_CMD
unset KEY_2

