on_attach_hook = function(_, bufno)
    local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufno, desc = desc })
    end

  nmap('gd', vim.lsp.buf.definition, '[G] to [D]efinition')
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

end

-- test clangd
require("lsp.clangd")
