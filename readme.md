fzf-csh
=======

C shell
([csh](https://en.wikipedia.org/wiki/C_shell))
history support for
[fzf](https://github.com/junegunn/fzf)
command line fuzzy finder.
<br />
Works with [tcsh](https://www.tcsh.org).


how to use
==========

- clone the repository:

```
git clone https://github.com/graahnul-grom/fzf-csh.git
```

- source `fzf-csh.csh` in your `.cshrc` configuration file:

```
if ( -r "/path/to/fzf-csh.csh" ) then
    source /path/to/fzf-csh.csh
endif
```

- copy `fzf-csh-impl.sh` somewhere in the `$PATH` and
make sure it is executable (`chmod +x`).

After logging out and then in,
pressing `Ctrl + R` will open the `fzf` list with command history.
Press `Enter` to put selected history item on the command line.

Note that you have to press `Ctrl + R` first and then start
typing something to filter the history. Doing the other way
around - typing and then pressing `Ctrl + R` - will not take
into account what have already been typed.

`fzf-csh` requires some temporary writable directory to work,
and by default it uses `$HOME`.
If `$HOME` is not writable or you want to use another directory,
set its path in the `$FZF_CSH_TMP_DIR` environment variable
before including `fzf-csh.csh`, e.g.:

```
if ( -r "/path/to/fzf-csh.csh" ) then
    setenv FZF_CSH_TMP_DIR /tmp
    source /path/to/fzf-csh.csh
endif
```


file name completion
====================

In addition to history, file name completion support has been
added recently. Press `Ctrl + T` to open a list with (regular)
files/dirs names found under the current directory.
Paths like `.git/`, `.svn/`, and those located on other
file systems are excluded by default.


compatibility
=============

Tested with `fzf` 0.33 - 0.38 on FreeBSD 13, so at the
moment `fzf-csh` should work with `tcsh` shell
(6.22.04 - `echo $tcsh`) from the FreeBSD base system.

Also tested on Ubuntu Linux 20.04 LTS ("Focal Fossa").
Note that there are two csh packages:
`csh` (installs `/bin/bsd-csh`) and `tcsh` (installs `/bin/tcsh`).
The former will not work, make sure to install the `tcsh` one or,
if both are installed, run `update-alternatives --config csh`
command and select `tcsh` when prompted.


license
=======

BSD2CLAUSE
<br />
copyright (c) 2022-2023 dmn

