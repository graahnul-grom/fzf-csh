#
# [dmn]: csh support for textproc/fzf - fbsd 13 - 2022
#

set KEY_RUN = "^R"     # Ctrl + R
set KEY_1   = "^[[23~" # F11
set KEY_2   = "^[[24~" # F12

bindkey -c $KEY_1 "history -h >! ${HOME}/fzf_history.tmp; \
                   /home/fzf_csh.git/fzf_impl.csh; \
                   source ${HOME}/fzf_cmd.tmp; \
                   rm -f ${HOME}/fzf_cmd.tmp"

bindkey -s $KEY_RUN "${KEY_1}${KEY_2}"

unset KEY_2  
unset KEY_1  
unset KEY_RUN

