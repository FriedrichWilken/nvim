vim.opt.autoindent = true

-- Set the behavior of tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.o.scrolloff = 8 -- screen lines to keep above/below the cursor
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
