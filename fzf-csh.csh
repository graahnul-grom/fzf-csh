# fzf-csh: C shell (csh) history support for fzf
#
# home page: https://github.com/graahnul-grom/fzf-csh
# copyright (c) 2022 dmn <graahnul.grom@ya.ru>
# license: BSD
# fzf home page: https://github.com/junegunn/fzf
#

set DIR_OUT = $HOME

if ( $?FZF_CSH_TMP_DIR ) then
    set DIR_OUT = $FZF_CSH_TMP_DIR
endif

if ( -dw $DIR_OUT ) then
    set FILE_CMD  = "${DIR_OUT}/fzf-csh-cmd.tmp"
    set FILE_IMPL = "fzf-csh-impl.csh"
else
    echo "fzf-csh: unable to write to ${DIR_OUT}."
    echo "         make sure the directory is writable, or set the"
    echo '         $FZF_CSH_TMP_DIR env var to point to it before'
    echo "         sourcing the fzf-csh.csh file."
    unset DIR_OUT
    exit 1
endif

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

