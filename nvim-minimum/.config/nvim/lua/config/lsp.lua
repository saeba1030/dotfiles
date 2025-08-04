-- vim.lsp.enable 'clangd'
-- vim.lsp.enable 'lua_ls'
vim.lsp.enable({'lua_ls', 'clangd'})

--[[
GLOBAL DEFAULTS
grr gra grn gri i_CTRL-S an in These GLOBAL keymaps are created unconditionally when Nvim starts:
"grn" is mapped in Normal mode to vim.lsp.buf.rename()
"gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
"grr" is mapped in Normal mode to vim.lsp.buf.references()
"gri" is mapped in Normal mode to vim.lsp.buf.implementation()
"gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
"an" and "in" are mapped in Visual mode to outer and inner incremental selections, respectively, using vim.lsp.buf.selection_range()
--]]
-- custom keymap
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('yf.lsp', {}),

    callback = function(args)
	local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
	local nmap = function(keys, func, desc)
	    if desc then
	      desc = 'LSP: ' .. desc
	    end

	    vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
	end

	-- Use Default key Ctrl+], same as "Jump to tag" in vim
	-- nmap('gd', vim.lsp.buf.definition, '[G] to [D]efinition')
	-- nmap('<leader>rn', vim.lsp.buf.rename, 'Re[n]ame')
	-- nmap('<leader>ra', vim.lsp.buf.code_action, 'Code [A]ction')
	nmap('<leader>rf', vim.lsp.buf.format, '[F]ormat File')

	-- auto-complete
	if client:supports_method('textDocument/completion') then
	    vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
	end

	vim.diagnostic.config { virtual_text = true, }

    end,
})

