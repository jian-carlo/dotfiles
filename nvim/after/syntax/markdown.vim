" Highlight inline math: $...$
syntax match markdownMathDelimiter "\$" contained
syntax region markdownInlineMath matchgroup=markdownMathDelimiter start="\$" end="\$" contains=markdownMathContent

syntax match markdownMathContent "\%(\$\\?\)\@<=.\{-}\%(\$\\?\)\@=" contained

" Highlight block math: $$...$$
syntax match markdownBlockMathDelimiter "\$\$" contained
syntax region markdownBlockMath matchgroup=markdownBlockMathDelimiter start="\$\$" end="\$\$" contains=markdownBlockMathContent

syntax match markdownBlockMathContent "\%(\$\$\\?\)\@<=.\{-}\%(\$\$\\?\)\@=" contained
