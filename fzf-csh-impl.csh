#!/usr/bin/env csh

# fzf-csh: C shell (csh) history support for fzf
#
# home page: https://github.com/graahnul-grom/fzf-csh
# copyright (c) 2022 dmn <graahnul.grom@ya.ru>
# license: BSD2CLAUSE
# fzf home page: https://github.com/junegunn/fzf
#

if ( $#argv != 1 ) then
    exit 1
endif

set FILE_CMD = $1
set KEY_2 = "^X^F^G^H^I^J"

touch $FILE_CMD >& /dev/null
if ( $? != 0 ) then
    echo "fzf-csh: unable to write to ${FILE_CMD}."
    unset FILE_CMD
    unset KEY_2
    exit 1
endif

set ES_OLD = $echo_style
set echo_style = both

echo -n bindkey -s \"${KEY_2}\" >! $FILE_CMD
echo -n " " >> $FILE_CMD

set echo_style = $ES_OLD
unset ES_OLD

set HEIGHT = ""
if ( $?DISPLAY ) then
    set HEIGHT = "--height=50%"
endif

fzf --tac --no-sort $HEIGHT | \
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
unset HEIGHT

