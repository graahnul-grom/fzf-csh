#!/usr/bin/env csh

#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

set FILE_CMD = $1
set FILE_HIS = $2

set KEY_2 = "^X^F^G^H^I^J"

echo -n bindkey -s \"${KEY_2}\" >! $FILE_CMD
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

if ( $? != 0 ) then
    echo bindkey \"${KEY_2}\" backward-char >! $FILE_CMD
endif

rm -f $FILE_HIS

unset FILE_CMD
unset FILE_HIS
unset KEY_2

