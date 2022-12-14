require('monokai').setup() 


local lspconfig = require('lspconfig')
local servers = { 'gopls' }
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
