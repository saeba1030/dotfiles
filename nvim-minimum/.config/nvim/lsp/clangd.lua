return {
    cmd = { 'clangd' },
    root_makers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },

    -- custom keymap
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local nmap = function(keys, func, desc)
                if desc then
                  desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
            end

          nmap('gd', vim.lsp.buf.definition, '[G] to [D]efinition')
          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        end
    }),

}
