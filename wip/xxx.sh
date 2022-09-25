#!/bin/sh

SED="sed -E" # NB: gsed complains on un-escaped (
# echo 1\"2\'3 | \
# cat LINE | \
cat LINES | \
csh -c "fzf --tac --no-sort   | \
    $SED -e 's,\\\,\\\\\\\,g' | \
    $SED -e 's, ,\\\ ,g'      | \
    $SED -e \"s,',\\\\\',g\"  | \
    $SED -e 's,\",\\\\\",g'   | \
    $SED -e 's,\\\$,\\\\\$,g' | \
    $SED -e 's,#,\\\#,g'      | \
    $SED -e 's,\`,\\\\\`,g'   | \
    $SED -e 's,&,\\\&,g'      | \
    $SED -e 's,\(,\\\(,g'     | \
    $SED -e 's,\),\\\),g'     | \
    $SED -e 's,~,\\\~,g'      | \
    $SED -e 's,\[,\\\[,g'     | \
    $SED -e 's,],\\\],g'      | \
    $SED -e 's,\{,\\\{,g'     | \
    $SED -e 's,},\\\},g'      | \
    $SED -e 's,<,\\\<,g'      | \
    $SED -e 's,>,\\\>,g'      | \
    $SED -e 's,;,\\\;,g'      | \
    $SED -e 's,\|,\\\|,g'     | \
    $SED -e 's,\?,\\\?,g'     | \
    $SED -e 's,\^,\\\^,g'     | \
    $SED -e 's,EKLMN,oprst,g'"  # placeholder
echo $?


# FAIL:
# while read line; do echo $line; done | \
# csh -c "fzf --tac --no-sort | \
# sed -E -e 's,1,Y,'"


# OK:
# while read line; do echo $line; done | fzf


# OK:
# while read line; do
    # echo $line
# done | fzf

# OK:
# {
    # while read line
    # do
        # echo $line
    # done
# } | fzf

# OK:
# {
    # pwd;
    # ls xxx.*;
# } | fzf

