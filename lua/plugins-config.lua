--> autopair
require('nvim-autopairs').setup{}

--> treesitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "go", "lua", "rust" },

    --Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },
}

--> indent line
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

--> theme
require('monokai').setup {}


--> lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local lspconfig = require('lspconfig')
local servers = { 'gopls', 'rust_analyzer' }
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


--> autocomplete
-- Add additional capabilities supported by nvim-cmp

--> luasnip setup
local luasnip = require 'luasnip'

--> nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
        luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

--> rust-tools
local rust_opts = {
    tools = { -- rust-tools options
        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require("rust-tools/executors").termopen,
        
        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,
        
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,
        
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        },

        -- whether the hover action window gets automatically focused
        -- default: false
        auto_focus = false,
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion
            -- Last updated: 2021-08-26
         enabled_graphviz_backends = {
            "bmp",
            "cgimage",
            "canon",
            "dot",
            "gv",
            "xdot",
            "xdot1.2",
            "xdot1.4",
            "eps",
            "exr",
            "fig",
            "gd",
            "gd2",
            "gif",
            "gtk",
            "ico",
            "cmap",
            "ismap",
            "imap",
            "cmapx",
            "imap_np",
            "cmapx_np",
            "jpg",
            "jpeg",
            "jpe",
            "jp2",
            "json",
            "json0",
            "dot_json",
            "xdot_json",
            "pdf",
            "pic",
            "pct",
            "pict",
            "plain",
            "plain-ext",
            "png",
            "pov",
            "ps",
            "ps2",
            "psd",
            "sgi",
            "svg",
            "svgz",
            "tga",
            "tiff",
            "tif",
            "tk",
            "vml",
            "vmlz",
            "wbmp",
            "webp",
            "xlib",
            "x11",
        },
    },
},

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
    }, -- rust-analyer options

    -- debugging stuff
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
}
require('rust-tools').setup(rust_opts)

--> lualine
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
