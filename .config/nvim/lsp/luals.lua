local function get_library_files()
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    local paths = {
        vim.fn.expand('$VIMRUNTIME/lua'),
        vim.fn.stdpath('config') .. '/lua',
        vim.fn.stdpath('data') .. '/lazy',
    }

    local library = {}
    for _, path in ipairs(paths) do
        library[path] = true
    end

    return library
end

return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = get_library_files(),
                checkThirdParty = false,
                maxPreload = 10000,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
