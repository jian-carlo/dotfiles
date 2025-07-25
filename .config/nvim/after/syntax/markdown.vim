syntax region markdownBlockMath matchgroup=markdownBlockMathDelimiter start="\$\$" end="\$\$" contains=markdownBlockMathContent nextgroup=markdownMathLabel skipwhite
syntax match markdownMathLabel /\v\{\#eq:[A-Za-z0-9_-]+\}/ contained

syntax region wikiLink matchgroup=wikiLinkDelimiter start="\[\[" end="\]\]" contains=wikiLinkContent
