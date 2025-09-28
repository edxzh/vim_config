-- Basic settings
vim.opt.syntax = "on"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamed"
vim.opt.background = "dark"
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = ".", extends = "#", nbsp = "." }
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.isfname:append("-")
vim.opt.mouse = "nv"
vim.opt.expandtab = true
vim.opt.ignorecase = true

-- Additional settings from readme
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")

-- Plugin management with lazy.nvim (modern replacement for vim-plug)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- File explorer
  "scrooloose/nerdtree",
  "Xuyuanp/nerdtree-git-plugin",
  "tiagofumo/vim-nerdtree-syntax-highlight",
  "ryanoasis/vim-devicons",
  
  -- Git integration
  "airblade/vim-gitgutter",
  "tpope/vim-fugitive",
  
  -- Text manipulation
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "godlygeek/tabular",
  "preservim/nerdcommenter",
  
  -- UI
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  
  -- Navigation
  "christoomey/vim-tmux-navigator",
  "majutsushi/tagbar",
  
  "terryma/vim-multiple-cursors",
  
  -- Telescope (fuzzy finder)
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  
  "preservim/vim-markdown"
})

-- File type autocmds
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.json",
  command = "setlocal ft=json",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal shiftwidth=4 expandtab",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.mk",
  command = "setlocal filetype=markdown",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ex,*.exs",
  command = "set filetype=elixir",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.eex,*.heex,*.leex,*.sface,*.lexs",
  command = "set filetype=eelixir",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "mix.lock",
  command = "set filetype=elixir",
})

-- Key mappings
vim.keymap.set("i", "jk", "<ESC>")

-- macOS Command key mappings for clipboard
vim.keymap.set("i", "<D-v>", "<C-r>+", { silent = true })
vim.keymap.set("n", "<D-v>", "+p", { silent = true })
vim.keymap.set("v", "<D-v>", "+p", { silent = true })
vim.keymap.set("i", "<D-c>", "<C-o>\"+y", { silent = true })
vim.keymap.set("n", "<D-c>", "\"+y", { silent = true })
vim.keymap.set("v", "<D-c>", "\"+y", { silent = true })
vim.keymap.set("i", "<D-x>", "<C-o>\"+d", { silent = true })
vim.keymap.set("n", "<D-x>", "\"+d", { silent = true })
vim.keymap.set("v", "<D-x>", "\"+d", { silent = true })

-- NERDTree mappings
vim.keymap.set("n", "<Leader>/", "<plug>NERDCommenterToggle<cr>")
vim.keymap.set("v", "++", "<plug>NERDCommenterToggle")
vim.keymap.set("n", "++", "<plug>NERDCommenterToggle")
vim.keymap.set("n", "<Leader>N", ":NERDTreeToggle<cr>")
vim.keymap.set("n", "<Leader>R", ":NERDTreeFind<cr>")

-- Auto-open NERDTree if no file specified
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("NERDTree")
    end
  end,
})

-- NERDCommenter configuration
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = "left"
vim.g.NERDAltDelims_java = 1
vim.g.NERDCustomDelimiters = {
  c = { left = "/**", right = "*/" }
}
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1

vim.g.vim_markdown_folding_disabled = 1

-- Airline configuration
vim.g.airline_theme = "solarized"

-- NERDTree ignore patterns
vim.g.NERDTreeIgnore = { "^node_modules$" }

-- Leader key
vim.g.mapleader = ","

-- Custom mappings
vim.keymap.set("n", "<Leader>d", "o|> IO.inspect()<esc>")

-- Virtual line movement
vim.keymap.set("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true })

vim.keymap.set("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true })

vim.keymap.set("n", "<esc>", ":noh<return><esc>")

-- NERDTree sync functions
function IsNERDTreeOpen()
  return vim.fn.exists("t:NERDTreeBufName") == 1 and vim.fn.bufwinnr(vim.fn.bufname("t:NERDTreeBufName")) ~= -1
end

function SyncTree()
  if vim.bo.modifiable and IsNERDTreeOpen() and vim.fn.strlen(vim.fn.expand("%")) > 0 and not vim.wo.diff then
    vim.cmd("NERDTreeFind")
    vim.cmd("wincmd p")
  end
end

-- Highlight currently open buffer in NERDTree
vim.api.nvim_create_autocmd("BufRead", {
  callback = SyncTree,
})

vim.keymap.set("i", "<S-TAB>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-h>"
end, { expr = true })

function check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

vim.keymap.set("i", "<c-space>", function()
  return vim.fn["coc#refresh"]()
end, { expr = true, silent = true })

vim.keymap.set("i", "<cr>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<C-g>u<CR>"
end, { expr = true })


-- Tabularize mappings
vim.keymap.set("n", "<Leader>a=", ":Tabularize /=<CR>")
vim.keymap.set("v", "<Leader>a=", ":Tabularize /=<CR>")
vim.keymap.set("n", "<Leader>a:", ":Tabularize /:%zs<CR>")
vim.keymap.set("v", "<Leader>a:", ":Tabularize /:%zs<CR>")

-- Copy file path
vim.keymap.set("n", "<Leader>c", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { silent = true })

-- Clipboard operations
vim.keymap.set("v", "<leader>yo", '"+y')
vim.keymap.set("n", "<leader>po", '"+p')

-- Window operations
vim.keymap.set("n", "<leader>+", "<c-w>+")
vim.keymap.set("n", "<leader>-", "<c-w>-")
vim.keymap.set("n", "<leader>=", "<c-w>=")
vim.keymap.set("n", "<leader>_", "<c-w>_")

-- Git mappings
if vim.fn.executable("git") == 1 then
  vim.keymap.set("n", "<leader>gs", ":Git status<CR>", { silent = true })
  vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { silent = true })
  vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { silent = true })
  vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { silent = true })
  vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { silent = true })
  vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { silent = true })
end

-- Indent operations
vim.keymap.set("n", "<", "v<")
vim.keymap.set("n", ">", "v>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines up and down
vim.keymap.set("n", "<S-Up>", ":<C-u>silent! move-2<CR>==")
vim.keymap.set("n", "<S-Down>", ":<C-u>silent! move+<CR>==")
vim.keymap.set("x", "<S-Up>", ":<C-u>silent! '<,'>move-2<CR>gv=gv")
vim.keymap.set("x", "<S-Down>", ":<C-u>silent! '<,'>move'>+<CR>gv=gv")

-- Search and replace
vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>")

-- Telescope mappings
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files prompt_prefix=🔍<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep prompt_prefix=🔍<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers prompt_prefix=🔍<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags prompt_prefix=🔍<cr>")
