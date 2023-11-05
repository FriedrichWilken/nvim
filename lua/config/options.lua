-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "*:i*", "i*:*" },
  callback = function()
    vim.o.relativenumber = vim.v.event.new_mode:match("^i") == nil
  end,
})

-- Completion
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }

-- screen lines to keep above/below the cursor
vim.o.scrolloff = 12

vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })
