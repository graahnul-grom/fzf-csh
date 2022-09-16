#!/usr/bin/env csh
#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

set KEY_2 = "^[[24~" # F12

set CMD="`fzf --tac --no-sort < ${HOME}/fzf_history.tmp`"
set RET=$?
rm -f ${HOME}/fzf_history.tmp

if ( $RET == 0 ) then
    echo bindkey -s \"${KEY_2}\" \'${CMD}\' >! ${HOME}/fzf_cmd.tmp
else
    echo bindkey \"${KEY_2}\" backward-char >! ${HOME}/fzf_cmd.tmp
endif

unset KEY_2
unset CMD
exit $RET

