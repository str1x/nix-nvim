local opt = vim.opt
local o = vim.o
local g = vim.g

o.laststatus = 3
o.showmode = true

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number,line"

-- Indent
o.smarttab = true
opt.cpoptions:append('I')
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

--max height completion menu
o.pumheight = 10
o.pumblend = 15

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 500
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- spell
opt.spell = false
opt.spelllang = { "en_us", 'ru_ru' }

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
opt.foldenable = false
opt.relativenumber = true
-- opt.termguicolors = true -- True color support
o.termguicolors = true
-- opt.autoindent = true    --- Good auto indent
opt.colorcolumn = { 120 }

-- NOTE: These 2 need to be set up before any plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set highlight on search
vim.opt.hlsearch = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- stops line wrapping from being confusing
vim.o.breakindent = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,preview,noselect'

-- [[ Disable auto comment on enter ]]
-- See :help formatoptions
vim.api.nvim_create_autocmd("FileType", {
  desc = "remove formatoptions",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- WTF?
vim.g.netrw_liststyle=0
vim.g.netrw_banner=0

