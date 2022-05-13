vim.opt.autoindent = true

-- Set the behavior of tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true


vim.o.scrolloff = 8 -- screen lines to keep above/below the cursor
vim.o.title = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- line number
vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("ModeChanged", { 
    pattern = "*:i",
    group = group,
    callback = function()    
      vim.wo.relativenumber = false
    end,
  }
)

vim.api.nvim_create_autocmd("ModeChanged", { 
    pattern = "i:*",
    group =  group,
    callback = function()
      vim.wo.relativenumber = true
    end,
  }
)
