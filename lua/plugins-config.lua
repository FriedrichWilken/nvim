--> theme
require('monokai').setup() 

--> fterm
require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
    -- cmd = os.getenv('SHELL'),
    cmd = "bash"
})
vim.keymap.set('n', '<leader>ii', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>ii', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

--> Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("telescope").load_extension "file_browser"
local file_browser = require "telescope".extensions.file_browser.file_browser
vim.keymap.set('n', '<leader>jj', file_browser, {})

-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml", "go", "yaml", "bash" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}



--> LSP config
local lspconfig = require('lspconfig')
-- be aware 
local servers = { 'gopls', 'bashls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer= 0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer= 0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer= 0})
        vim.keymap.set("n", "ej", vim.diagnostic.goto_next, {buffer= 0})
        vim.keymap.set("n", "ek", vim.diagnostic.goto_prev, {buffer= 0})
        vim.keymap.set("n", "fe", "<cmd>Telescope diagnostics<cr>", {buffer= 0})
        vim.keymap.set("n", "rr", vim.lsp.buf.rename, {buffer= 0})
        vim.keymap.set("n", "fmt", vim.lsp.buf.formatting, {buffer= 0})
        vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {buffer= 0})
        end,
        capabilities = capabilities,
    }
end

require('mason').setup()

-- rust-tools sets up lsp for rust so do not set up lsp for rust or this will cause conflicts
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer= 0})
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer= 0})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer= 0})
      vim.keymap.set("n", "ej", vim.diagnostic.goto_next, {buffer= 0})
      vim.keymap.set("n", "ek", vim.diagnostic.goto_prev, {buffer= 0})
      vim.keymap.set("n", "fe", "<cmd>Telescope diagnostics<cr>", {buffer= 0})
      vim.keymap.set("n", "rr", vim.lsp.buf.rename, {buffer= 0})
      vim.keymap.set("n", "fmt", vim.lsp.buf.formatting, {buffer= 0})
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {buffer= 0})
    end,
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
  },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
