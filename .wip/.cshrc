# [dmn]: ~/.cshrc - fbsd 13 - 2022

# [dmn]: NB:
#
# - 'set VAR = VAL'  / 'unset VAR'    - "Special shell variables" - tcsh(1)
# - 'setenv VAR VAL' / 'unsetenv VAR' - env vars

if ( `uname -s` == "FreeBSD" ) then
    set fbsd = 1
endif

if ( $?fbsd ) then
    alias ll  'ls -lhGo  -D "%Y-%m-%d %H:%M"'
    alias lll 'ls -lhAGo -D "%Y-%m-%d %H:%M"'
    alias tvl tail -f /var/log/messages
    alias vl  vim -R + /var/log/messages
else
    alias ll  'ls -lh  --color=auto --time-style=+"%Y-%m-%d %H:%M"' # --group-directories-first
    alias lll 'ls -lhA --color=auto --time-style=+"%Y-%m-%d %H:%M"' # --group-directories-first
    alias tvl journalctl -ef
endif

alias cp     cp -i
alias mv     mv -i
alias rm     rm -i
alias grep   grep --color
alias egrep  egrep --color

umask 0002
set path = ($HOME/fzf-csh.git $HOME/bin /sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin)

setenv  t       $HOME/tmp
setenv  lepton  $HOME/lepton
setenv  dt      ~dmn/tmp
setenv  dcfg    ~dmn/dcfg
setenv  dprj    ~dmn/dprj
setenv  ee      ~dmn/ee
setenv  EDITOR  vim
setenv  PAGER   'less -i'

set nobeep

if ( $?prompt ) then
    set prompt = "%n@%m %c $ " # [dmn]: orig: "%N@%m:%~ %# "

    set noclobber # error on > (redirect) if file exist; to override: >!
    set rmstar # confirm 'rm *' - doesn't work?

    set filec # file name completion ON
    set autolist = ambiguous
    set autoexpand
    set autorehash
    set mail = (/var/mail/$USER)

    # [dmn]: how to edit history:
    # 1) edit ~/.history
    # 2) history -c
    # 3) history -L
    #
    set histfile = $HOME/.history
    set history = 10000
    # NOTE: 'lock' may block in 'history -S' on ubuntu 20.04 => prevent logout
    set savehist = (10000 merge lock) # call 'history -S' on exit; should be <= $history
    set histdup = prev # don't save consecutive duplicated cmds

    if ( $?tcsh ) then
        bindkey    "^W" backward-delete-word
        bindkey -k up   history-search-backward
        bindkey -k down history-search-forward

        bindkey "^[[3~" delete-char       # [dmn]
        bindkey "^[[7~" beginning-of-line # [dmn]
        bindkey "^[[8~" end-of-line       # [dmn]

        if ( -r "$HOME/fzf-csh.git/fzf-csh.csh" ) then
            # setenv FZF_CSH_TMP_DIR /tmp
            source $HOME/fzf-csh.git/fzf-csh.csh
        endif

        # mc -u: no subshell, otherwise mc writes crap to ~/.history
        #
        if ( $?fbsd ) then
            if ( -r "/usr/local/libexec/mc/mc-wrapper.csh" ) then
                alias mc 'source /usr/local/libexec/mc/mc-wrapper.csh -u'
            endif
        else
            if ( -r "/usr/lib/mc/mc-wrapper.csh" ) then
                alias mc 'source /usr/lib/mc/mc-wrapper.csh -u'
            endif
        endif
    endif # if tcsh
endif # if prompt

