fzf-csh
=======

C shell (csh) history support for
[fzf](https://github.com/junegunn/fzf)
command line fuzzy finder.


how to use
==========

- clone the repository or download files `fzf-csh-impl.sh` and `fzf-csh-impl.sh`
- source `fzf-csh.csh` in your `.cshrc` config:

```csh
if ( -r "/path/to/fzf-csh.csh" ) then
    source /path/to/fzf-csh.csh
endif
```

- copy `fzf-csh-impl.sh` somewhere in the `$PATH`

If you're lucky, after logging out and then in,
pressing `Ctrl + R` will show `fzf` stuff with the command history.


license
=======

BSD

