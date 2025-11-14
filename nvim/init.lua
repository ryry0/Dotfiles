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
          ensure_installed = { "just", "nu", "gdscript", "wgsl", "c", "rust", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
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
    },
    {
      'ggandor/leap.nvim',
      config = function()
        -- require('leap').opts.preview = function (ch0, ch1, ch2)
          -- return not (
            -- ch1:match('%s')
            -- or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
          -- )
        -- end

        -- Define equivalence classes for brackets and quotes, in addition to
        -- the default whitespace group:
        require('leap').opts.equivalence_classes = {
          ' \t\r\n', '([{', ')]}', '\'"`'
        }

        -- Use the traversal keys to repeat the previous motion without
        -- explicitly invoking Leap:
        require('leap.user').set_repeat_keys('<enter>', '<backspace>')
        vim.keymap.set({'n', 'x', 'o'}, '<TAB>', '<Plug>(leap)')
        vim.keymap.set({'n', 'x', 'o'}, '<leader>f', '<Plug>(leap)')
        vim.keymap.set('n',             '<S-TAB>', '<Plug>(leap-from-window)')
      end,
    },
    {
      "chrisgrieser/nvim-spider", lazy = true,
      keys = {
        { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
        { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
        { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      },
      config = function()
        require("spider").setup {
          skipInsignificantPunctuation = false,
        }
      end,
    },
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
    --vim.lsp.inlay_hint.enable(true)
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
    --vim.lsp.inlay_hint.enable(false)
  end,
})


-- screen settings
vim.opt.scrolloff = 2
vim.opt.cursorline = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

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

-- Quit everything
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { noremap = true, silent = true });

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

-- buffer mappings
vim.keymap.set({ "n", "v" }, "<leader>e", ':e#<CR>', { noremap = true, silent = true })

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


-- Insert brackets
--vim.keymap.set("i", "<C-b>", "{<CR>}<ESC>O", { noremap = true })

-- Create a session
vim.keymap.set("n", "<leader>s", ":mksession! session.vim<CR>", { noremap = true })

-- Map for relative filepath expansion
vim.keymap.set("c", "%%", function ()
  return (vim.fn.getcmdtype() == ":")
  and (vim.fn.expand("%:h") .. "/")
  or "%%"
end, {expr = true})


-- rust specific binds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.keymap.set("n", "<leader>r", "<cmd>RustFmt<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "<leader>k", "<cmd>RustLsp hover actions<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true, desc = "Line diagnostics" })
    vim.keymap.set("n", "<leader>h", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle inlay hints" })
    vim.opt.formatoptions:remove('o') -- off by default
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
    vim.opt.formatoptions:remove('o') -- off by default
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "wgsl" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt.formatoptions:remove('o') -- off by default
  end,
})

-- close unclosed brackets, but inside strings anything goes.
local function close_unclosed()
  local row, col0 = unpack(vim.api.nvim_win_get_cursor(0)) -- 1-based row, 0-based col
  local line = vim.api.nvim_get_current_line()
  local col = col0 + 1                                     -- 1-based for Lua substrings
  local row_text = line:sub(1, col)                            -- scan only up to cursor
  local start_line = math.max(1, row - 50)  -- look 50 lines up
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, row - 1, false)

  local text = table.concat(lines, "\n") .. "\n" .. row_text
  --print(text)

  local open_to_close = { ['('] = ')', ['['] = ']', ['{'] = '}', ['<'] = '>' }
  local closers = { [')']=true, [']']=true, ['}']=true, ['>']=true}
  local sym = { --["'"]=true,
  ['"']=true, ['`']=true, ['|']=true } -- symmetric delimiters

  local function is_escaped(i)
    -- i is the index of the current char in 'text' (1-based)
    local j, cnt = i - 1, 0
    while j >= 1 and text:sub(j, j) == '\\' do
      cnt = cnt + 1
      j = j - 1
    end
    return (cnt % 2) == 1
  end

  local stack = {}          -- unified expected-closer stack (e.g. '"', ')', ']', '}')
  local quote_depth = 0     -- >0 means we're inside a (possibly nested) symmetric quote

  for i = 1, #text do
    local ch = text:sub(i, i)

    -- Symmetric delimiters (quotes, pipes)
    if sym[ch] and not is_escaped(i) then
      if quote_depth > 0 and stack[#stack] == ch then
        -- close current quote
        table.remove(stack)
        quote_depth = quote_depth - 1
      elseif quote_depth == 0 then
        -- open a new quote
        table.insert(stack, ch)  -- expected closer is the same char
        quote_depth = quote_depth + 1
      end

    -- Asymmetric brackets, but only when NOT inside a quote
    elseif quote_depth == 0 then
      local expected = open_to_close[ch]
      if expected then
        table.insert(stack, expected)  -- push the closer we expect later
      elseif closers[ch] and stack[#stack] == ch then
        table.remove(stack)            -- matched the expected closer
      end
    end
  end

  if #stack > 0 then
    -- Concatenate expected closers in order; this naturally closes innermost first.
    local to_insert = table.remove(stack)
    vim.api.nvim_put({ to_insert }, "c", true, true)
    -- move cursor to after the inserted closers
    vim.api.nvim_win_set_cursor(0, { row, col0 + #to_insert })
  end
end


vim.keymap.set("i", "<C-b>", close_unclosed, { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", function()
  close_unclosed()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>i", true, false, true), "n", false)
end, { noremap = true, silent = true })

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

-- autoread maybe overwritten somewhere.

vim.opt.autoread = true -- reload files automatically.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd("checktime")
    end
  end,
})

-- statusline colors
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#89b4fa", fg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#45475a", fg = "#6c7086" })

-- vim autocomplete
vim.opt.wildmenu = true
vim.opt.wildmode = { "list:longest", "full" }
