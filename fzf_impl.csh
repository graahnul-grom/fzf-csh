#!/usr/bin/env csh
#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

set KEY_2 = "^[[24~" # F12

echo -n bindkey -s \"${KEY_2}\" >! ${HOME}/fzf_cmd.tmp
echo -n " " >> ${HOME}/fzf_cmd.tmp

fzf --tac --no-sort < ${HOME}/fzf_history.tmp \
    >> ${HOME}/fzf_cmd.tmp

if ( $? != 0 ) then
    echo bindkey \"${KEY_2}\" backward-char >! ${HOME}/fzf_cmd.tmp
endif

rm -f ${HOME}/fzf_history.tmp

unset KEY_2
unset CMD

