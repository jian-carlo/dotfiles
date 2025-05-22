return {
    cmd = { "texlab" },
    filetypes = { "tex", "bib", "plaintex" },
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { ".pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
            },
            lint = {
                onChange = true,
            },
        },
    },
}
