-- plugin management
-- boostraping packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- parsing, lsp, completion, etc
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("trouble").setup()
        end
    }

    -- explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup()
        end
    }

    -- startup screen
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('alpha').setup(require('alpha.themes.startify').config)
        end
    }

    -- theme
    use 'ellisonleao/gruvbox.nvim'

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- tabline
    use {
        'kdheepak/tabline.nvim',
        commit = "bbaf9a97b24ae2d4f0c7d8751d5f28aa45332480",
        config = function()
            require 'tabline'.setup {
                enable = true,
                options = { modified_italic = true }
            }
            vim.cmd [[
            set guioptions-=e " use showtabline in gui vim
            set sessionoptions+=tabpages,globals " store tabpages and globals in session
        ]]
        end,
        requires = {
            { 'nvim-lualine/lualine.nvim', opt = true },
            { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    }

    -- lsp visuals
    use 'onsails/lspkind-nvim'

    -- key menus
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
            })
        end
    }

    -- must be at the end
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- use space as a the leader key
vim.g.mapleader = ' '

-- generic settings
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.timeoutlen = 250

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- visual settings
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.gruvbox_italicize_strings = 1
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Search", timeout=200}
augroup END]]
vim.cmd [[highlight NormalFloat guibg=#282828]]
vim.cmd [[highlight FloatBorder guifg=#fbf1c7 guibg=#282828]]
vim.cmd [[highlight Search guibg=#fabd2f guifg=#282828]]

local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    purple = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
}

-- statusbar
local window_width_limit = 70

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > window_width_limit
    end,
}

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local components = {
    mode = {
        function()
            return " "
        end,
        padding = { left = 0, right = 0 },
        color = {},
        cond = nil,
    },
    branch = {
        "b:gitsigns_head",
        icon = " ",
        color = { gui = "bold" },
        cond = conditions.hide_in_width,
    },
    filename = {
        "filename",
        color = {},
        cond = nil,
    },
    diff = {
        "diff",
        source = diff_source,
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.yellow },
            removed = { fg = colors.red },
        },
        cond = nil,
    },
    diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        cond = conditions.hide_in_width,
    },
    treesitter = {
        function()
            local b = vim.api.nvim_get_current_buf()
            if next(vim.treesitter.highlighter.active[b]) then
                return ""
            end
            return ""
        end,
        color = { fg = colors.green },
        cond = conditions.hide_in_width,
    },
    lsp = {
        function(msg)
            msg = msg or "LS Inactive"
            local buf_clients = vim.lsp.buf_get_clients()
            if next(buf_clients) == nil then
                -- TODO: clean up this if statement
                if type(msg) == "boolean" or #msg == 0 then
                    return "LS Inactive"
                end
                return msg
            end
            -- local buf_ft = vim.bo.filetype
            local buf_client_names = {}

            -- add client
            for _, client in pairs(buf_clients) do
                if client.name ~= "null-ls" then
                    table.insert(buf_client_names, client.name)
                end
            end

            -- -- add formatter
            -- local formatters = require "lvim.lsp.null-ls.formatters"
            -- local supported_formatters = formatters.list_registered(buf_ft)
            -- vim.list_extend(buf_client_names, supported_formatters)
            --
            -- -- add linter
            -- local linters = require "lvim.lsp.null-ls.linters"
            -- local supported_linters = linters.list_registered(buf_ft)
            -- vim.list_extend(buf_client_names, supported_linters)

            return "[" .. table.concat(buf_client_names, ", ") .. "]"
        end,
        color = { gui = "bold" },
        cond = conditions.hide_in_width,
    },
    location = { "location", cond = conditions.hide_in_width, color = {} },
    progress = { "progress", cond = conditions.hide_in_width, color = {} },
    spaces = {
        function()
            if not vim.api.nvim_buf_get_option(0, "expandtab") then
                return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
            end
            local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
            if size == 0 then
                size = vim.api.nvim_buf_get_option(0, "tabstop")
            end
            return "Spaces: " .. size .. " "
        end,
        cond = conditions.hide_in_width,
        color = {},
    },
    encoding = {
        "o:encoding",
        fmt = string.upper,
        color = {},
        cond = conditions.hide_in_width,
    },
    filetype = { "filetype", cond = conditions.hide_in_width },
    scrollbar = {
        function()
            local current_line = vim.fn.line "."
            local total_lines = vim.fn.line "$"
            local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
        end,
        padding = { left = 0, right = 0 },
        color = { fg = colors.yellow, bg = colors.bg },
        cond = nil,
    },
}

require('lualine').setup({
    options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "NvimTree", "Outline", "packer" },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            components.mode,
        },
        lualine_b = {
            components.branch,
            components.filename,
        },
        lualine_c = {
            components.diff,
        },
        lualine_x = {
            components.diagnostics,
            components.treesitter,
            components.lsp,
            components.filetype,
        },
        lualine_y = {},
        lualine_z = {
            components.scrollbar,
        },
    },
    inactive_sections = {
        lualine_a = {
            "filename",
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "nvim-tree" },
})

-- treesitter
local configs = require('nvim-treesitter.configs')
configs.setup({
    ensure_installed = 'all',
    highlight = { enable = true },
    indent = { enable = true }
})

-- lsp
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == 'sumneko_lua' then
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim', 'use' }
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
                    }
                }
            }
        }
    end
    server:setup(opts)
end)


-- completion
local lspkind = require('lspkind')
lspkind.setup()
local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                luasnip = "[snip]",
            },
        },
    },
})

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- telescope
local telescope = require('telescope')
telescope.setup()
telescope.load_extension('fzf')

-- keymaps
local function keymap(mode, map, action)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, map, action, opts)
end

-- save
keymap('n', '<leader><space>', '<cmd>:w<cr>')
-- close buffer
keymap('n', '<leader>q', '<cmd>:bd<cr>')
-- move between panes
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')
-- move between buffers
keymap('n', 'H', '<cmd>:bnext<cr>')
keymap('n', 'L', '<cmd>:bprevious<cr>')
-- clear selection
keymap('n', '<leader>n', '<cmd>:noh<cr>')
-- comments
keymap('n', '<leader>/', '<cmd>:lua require("Comment.api").toggle_current_linewise()<cr>')
keymap('x', '<leader>/', '<cmd>:lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>')
-- explorer
keymap('n', '<leader>e', '<cmd>:NvimTreeToggle<cr>')
-- lsp
keymap('n', 'gd', '<cmd>:lua vim.lsp.buf.definition()<cr>')
keymap('n', 'gD', '<cmd>:lua vim.lsp.buf.declaration()<cr>')
keymap('n', 'gi', '<cmd>:lua vim.lsp.buf.implementation()<cr>')
keymap('n', 'gw', '<cmd>:lua vim.lsp.buf.document_symbol()<cr>')
keymap('n', 'gw', '<cmd>:lua vim.lsp.buf.workspace_symbol()<cr>')
keymap('n', 'gr', '<cmd>:lua vim.lsp.buf.references()<cr>')
keymap('n', 'gt', '<cmd>:lua vim.lsp.buf.type_definition()<cr>')
keymap('n', 'K', '<cmd>:lua vim.lsp.buf.hover()<cr>')
keymap('n', '<c-k>', '<cmd>:lua vim.lsp.buf.signature_help()<cr>')
keymap('n', '<leader>af', '<cmd>:lua vim.lsp.buf.code_action()<cr>')
keymap('n', '<leader>rn', '<cmd>:lua vim.lsp.buf.rename()<cr>')
-- telescope
keymap('n', '<leader>ff', '<cmd>:Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>:Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>:Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>:Telescope help_tags<cr>')
-- trouble
keymap('n', '<leader>xx', '<cmd>:TroubleToggle<cr>')
keymap('n', '<leader>xw', '<cmd>:TroubleToggle workspace_diagnostics<cr>')
keymap('n', '<leader>xd', '<cmd>:TroubleToggle document_diagnostics<cr>')
keymap('n', '<leader>xq', '<cmd>:TroubleToggle quickfix<cr>')
keymap('n', '<leader>xl', '<cmd>:TroubleToggle loclist<cr>')
keymap('n', 'gR', '<cmd>:TroubleToggle lsp_references<cr>')

-- autocmds
-- format on save
local group = vim.api.nvim_create_augroup("format_group", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { command = "lua vim.lsp.buf.formatting_sync(nil, 1000)", group = group })
