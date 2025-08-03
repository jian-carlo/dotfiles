#!/usr/bin/env bash

/usr/local/bin/pandoc -F pandoc-crossref \
    --lua-filter $HOME/.config/scripts/toc-css.lua \
    --standalone $1 \
    -o $2 \
    -M eqnPrefix='Eq' \
    --mathjax \
    --toc &&
    $BROWSER $(wslpath -w $(realpath $2))
