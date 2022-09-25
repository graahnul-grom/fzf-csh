#!/bin/csh





set FILE_CMD = $1

set KEY_2 = "^X^F^G^H^I^J"

echo -n bindkey -s \"${KEY_2}\" >! $FILE_CMD
echo -n " " >> $FILE_CMD

set SED = "gsed -E"

fzf --tac --no-sort | \
    $SED -e 's,\\,\\\\\\\\,g' \
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

# cat $FILE_CMD

if ( $? != 0 ) then
    echo bindkey \"${KEY_2}\" backward-char >! $FILE_CMD
endif

unset FILE_CMD
unset KEY_2
unset SED 

