#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

set DIR_OUT = "/tmp"
if ( $?TMPDIR ) then
    set DIR_OUT = $TMPDIR
endif

set FILE_HIS = "${DIR_OUT}/fzf_history.tmp"
set FILE_CMD = "${DIR_OUT}/fzf_cmd.tmp"
set FILE_IMPL = "/home/fzf_csh.git/fzf_impl.csh"

set KEY_RUN = "^R"
set KEY_1   = "^X^A^B^C^D^E"
set KEY_2   = "^X^F^G^H^I^J"

bindkey -c $KEY_1 "history -h >! ${FILE_HIS}; \
                   ${FILE_IMPL} ${DIR_OUT}; \
                   source ${FILE_CMD}; \
                   rm -f ${FILE_CMD}"

bindkey -s $KEY_RUN "${KEY_1}${KEY_2}"

unset DIR_OUT
unset FILE_HIS
unset FILE_CMD
unset FILE_IMPL
unset KEY_RUN
unset KEY_1  
unset KEY_2  

