

vim.opt.autoindent = true

-- Set the behavior of tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


vim.o.scrolloff = 12 -- screen lines to keep above/below the cursor
vim.o.title = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- line number
vim.wo.number = true
vim.wo.relativenumber = true

-- Line Numbers
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = { "*:i*", "i*:*" },
    group = group,
    callback = function()
        vim.o.relativenumber = vim.v.event.new_mode:match("^i") == nil
    end,
})

--> Completion
--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])
