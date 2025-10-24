-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "mocha", -- or latte, frappe, macchiato, mocha
          transparent_background = true,
            color_overrides = {
                all = {
                    text = "#ffffff",
                },
                latte = {
                },
                frappe = {},
                macchiato = {},
                mocha = {},
            }
        })
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })          -- keep transparency
      vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn",  { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr",      { fg = "#a6adc8", bg = "none" }) -- lighter grey
      vim.api.nvim_set_hl(0, "CursorLineNr",{ fg = "#f5e0dc", bold = true })  -- accent color
    end,
  })

        vim.cmd.colorscheme("catppuccin")
  vim.api.nvim_set_hl(0, "CursorLine", { underline = true, bg = "none" })
      end,
    },

    {
      "HiPhish/rainbow-delimiters.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
          highlight = { enable = true },
        }
        local rainbow = require "rainbow-delimiters"
        vim.g.rainbow_delimiters = {
          strategy = {
            [''] = rainbow.strategy["global"],
          },
          query = {
            [''] = 'rainbow-delimiters',
          },
          highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        }
      end,
    },

    {
      "mrcjkb/rustaceanvim",
      version = "^5", -- stick to the v5 API for stability
      ft = { "rust" },
      config = function()
        vim.g.rustaceanvim = {
          tools = {
            float_win_config = { border = "rounded" },
            hover_actions = { auto_focus = true },
            inlay_hints = { auto = true },
          },
          server = {
            settings = {
              ["rust-analyzer"] = {
                cargo = { allFeatures = true },
              },
            },
          },
        }
      end,
    },

    {
      'nvim-mini/mini.indentscope',
      version = false,
      config = function()
        require('mini.indentscope').setup()
      end,
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catpuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Options
vim.opt.number = true            -- absolute line number on the current line
vim.opt.relativenumber = true    -- relative numbers on all other lines

-- autocommand for switching automatically
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})


-- screen settings
vim.opt.scrolloff = 2
vim.opt.cursorline = true

-- search settings
-- Key mappings
-- Esc mappings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "Jk", "<ESC>")
vim.keymap.set("i", "JK", "<ESC>")
vim.keymap.set("i", "jK", "<ESC>")
vim.keymap.set("i", "kJ", "<ESC>")
vim.keymap.set("i", "KJ", "<ESC>")
vim.keymap.set("i", "Kj", "<ESC>")

-- visual line mappings
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- merge upwards
vim.keymap.set("n", "K", "kJ", { noremap = true, silent = true })

-- newlines
vim.keymap.set("n", "<leader>o", "o<ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><CR>", "i<CR><ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>O", "O<ESC>", { noremap = true, silent = true })

-- save and quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

-- clear search
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- naturalish copy paste
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })   -- copy
vim.keymap.set("i", "<C-v>", '<C-o>"+P', { noremap = true, silent = true }) -- paste in insert mode

-- ez pane mapping
vim.keymap.set("n", "<leader>p", "<C-w>", { noremap = true, silent = true }) -- paste in insert mode
vim.keymap.set("v", "<leader>p", "<C-w>", { noremap = true, silent = true }) -- paste in insert mode

-- ez + register
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { noremap = true, silent = true })

-- clear trailing whitespace
vim.keymap.set("n", "<leader><Tab>", [[:%s/\s\+$//e<CR>]], { noremap = true, silent = true })

-- Define highlight group for trailing spaces
vim.cmd [[highlight ExtraWhitespace ctermbg=darkgreen guibg=#40a02b]]

-- Match them whenever a buffer is shown
vim.cmd [[match ExtraWhitespace /\s\+$/]]

-- Enter column visual mode
vim.keymap.set("n", "<leader>v", "<C-v>", { noremap = true, silent = true })

-- Exit search/command line
vim.keymap.set("c", "jk", "<C-c>", { noremap = true })
vim.keymap.set("c", "kj", "<C-c>", { noremap = true })

-- comment continuation
vim.keymap.set("n", "<leader>c", function()
  local current_fo = vim.opt.formatoptions:get()
  if current_fo['o'] then
    vim.opt.formatoptions:remove('o')
    print("❌ comment continuation off")
  else
    vim.opt.formatoptions:append('o')
    print("✅ comment continuation on")
  end
end, { desc = "Toggle comment continuation" })

-- rust specific binds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.keymap.set("n", "<leader>k", "<cmd>RustLsp hover actions<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true, desc = "Line diagnostics" })
    vim.keymap.set("n", "<leader>h", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle inlay hints" })
  end,
})


-- file specific behavior
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "haskell", "svelte", "elm", "arduino", "c", "cpp", "systemverilog", "json", "lua" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

