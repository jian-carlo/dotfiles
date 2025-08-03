#!/usr/bin/env bash

/usr/local/bin/pandoc -F pandoc-crossref \
    $1 \
    -o $2 \
    -M eqnPrefix='Eq' &&
    $BROWSER $(wslpath -w $(realpath $2))
