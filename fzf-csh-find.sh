#!/bin/sh

find . \
    -mount \
    -and \( -type f -or -type d \) \
    -and -not -path '*/.git/*' \
    -and -not -path '*/.svn/*'

