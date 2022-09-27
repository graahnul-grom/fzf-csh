fzf-csh
=======

C shell (csh) history support for
[fzf](https://github.com/junegunn/fzf)
command line fuzzy finder.


how to use
==========

- clone the repository or download files `fzf-csh-impl.sh` and `fzf-csh-impl.csh`
- source `fzf-csh.csh` in your `.cshrc` config:

```csh
if ( -r "/path/to/fzf-csh.csh" ) then
    source /path/to/fzf-csh.csh
endif
```

- copy `fzf-csh-impl.sh` somewhere in the `$PATH`

If you're lucky, after logging out and then in,
pressing `Ctrl + R` will open the `fzf` list with command history.
Press `Enter` to put the selected history item on the command line.


compatibility
=============
tested with `fzf` 0.33.0 on FreeBSD 13.1, so at the moment
`fzf-csh` should work with `tcsh` shell from the FreeBSD base system.


license
=======

BSD
copyright (c) 2022 dmn

