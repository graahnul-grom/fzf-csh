# fzf-csh: C shell (csh) history support for fzf
#
# home page: https://github.com/graahnul-grom/fzf-csh
# copyright (c) 2022 dmn <graahnul.grom@ya.ru>
# license: BSD2CLAUSE
# fzf home page: https://github.com/junegunn/fzf
#

set DIR_OUT = $HOME

if ( $?FZF_CSH_TMP_DIR ) then
    set DIR_OUT = $FZF_CSH_TMP_DIR
endif

test -e $DIR_OUT -a -d $DIR_OUT
if ( $? != 0 ) then
    echo "fzf-csh: ${DIR_OUT} does not exist or not a directory."
    unset DIR_OUT
    exit 1
endif

test -w $DIR_OUT
if ( $? != 0 ) then
    echo "fzf-csh: unable to write to ${DIR_OUT}."
    echo "         make sure the directory is writable, or set the"
    echo '         $FZF_CSH_TMP_DIR environment variable to point'
    echo "         to some writable directory before sourcing the"
    echo "         fzf-csh.csh file."
    unset DIR_OUT
    exit 1
endif


set FILE_CMD  = "${DIR_OUT}/fzf-csh-cmd.tmp"
set FILE_IMPL = "fzf-csh-impl.csh"
#
# TODO: check -X $FILE_IMPL # csh(1): "File inquiry operators"

set KEY_RUN = "^R"
set KEY_1   = "^X^A^B^C^D^E"
set KEY_2   = "^X^F^G^H^I^J"

bindkey -c $KEY_1 "history -h | ${FILE_IMPL} ${FILE_CMD}; \
                   source ${FILE_CMD}; \
                   rm -f ${FILE_CMD}"

bindkey -s $KEY_RUN "${KEY_1}${KEY_2}"

unset DIR_OUT
unset FILE_CMD
unset FILE_IMPL
unset KEY_RUN
unset KEY_1  
unset KEY_2  

