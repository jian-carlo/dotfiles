" Highlight inline math: $...$
syntax match markdownMathDelimiter "\$" contained
syntax region markdownInlineMath matchgroup=markdownMathDelimiter start="\$" end="\$" contains=markdownMathContent

syntax match markdownMathContent "\%(\$\\?\)\@<=.\{-}\%(\$\\?\)\@=" contained

" Highlight block math: $$...$$
syntax match markdownBlockMathDelimiter "\$\$" contained
syntax region markdownBlockMath matchgroup=markdownBlockMathDelimiter start="\$\$" end="\$\$" contains=markdownBlockMathContent nextgroup=markdownMathLabel skipwhite
syntax match markdownMathLabel /\v\{\#eq:[A-Za-z0-9_-]+\}/ contained
syntax match markdownBlockMathContent "\%(\$\$\\?\)\@<=.\{-}\%(\$\$\\?\)\@=" contained
