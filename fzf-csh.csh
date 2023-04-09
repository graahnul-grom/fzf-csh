# fzf-csh: C shell (csh) history support for fzf
#
# home page: https://github.com/graahnul-grom/fzf-csh
# copyright (c) 2022 dmn <graahnul.grom@ya.ru>
# license: BSD2CLAUSE
# fzf home page: https://github.com/junegunn/fzf
#

if ( ! -X "fzf" ) then
    echo "fzf-csh: could not find fzf executable."
    echo "         make sure fzf is installed."
    exit 1
endif

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

if ( ! -X $FILE_IMPL ) then
    echo "fzf-csh: could not find ${FILE_IMPL}."
    echo "         make sure it's in the PATH and is executable."
    unset DIR_OUT
    unset FILE_CMD
    unset FILE_IMPL
    exit 1
endif


set KEY_HISTORY = "^R"
set KEY_1_HISTORY = "^X^A^B^C^D^E"
set KEY_2 = "^X^F^G^H^I^J"

bindkey -c $KEY_1_HISTORY "history -h | ${FILE_IMPL} ${FILE_CMD} && source ${FILE_CMD}; \
                           rm -f ${FILE_CMD}"
bindkey -s $KEY_HISTORY "${KEY_1_HISTORY}${KEY_2}"

unset DIR_OUT
unset FILE_CMD
unset FILE_IMPL
unset KEY_HISTORY
unset KEY_1_HISTORY
unset KEY_2

