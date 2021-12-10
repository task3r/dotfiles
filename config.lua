-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
vim.opt.colorcolumn = "80"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><leader>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>n"] = ":noh<cr>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
}

local efm_opts = {
    init_options = {documentFormatting = true},
    filetypes = {"sh"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            sh = {
                {
                    lintCommand = 'shellcheck -f gcc -x',
                    lintSource = 'shellcheck',
                    lintFormats= {'%f:%l:%c: %trror: %m',
                                '%f:%l:%c: %tarning: %m',
                                '%f:%l:%c: %tote: %m'
                    },
                    formatCommand = 'shfmt -ci -i 4 -s -bn',
                    formatStdin = true
                }

            }
        }
    }
}

require("lspconfig")["efm"].setup(efm_opts)

lvim.autocommands.custom_groups = {
    { "FileType", "make", "set noexpandtab" }
}

