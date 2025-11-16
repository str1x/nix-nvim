-- [[ Basic Keymaps ]]
local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Moves Line Down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Moves Line Up' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll Down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll Up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next Search Result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous Search Result' })

vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = 'Previous buffer' })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = 'Next buffer' })
vim.keymap.set("n", "<leader><leader>l", "<cmd>b#<CR>", { desc = 'Last buffer' })
vim.keymap.set("n", "<leader><leader>d", "<cmd>bdelete<CR>", { desc = 'delete buffer' })

-- see help sticky keys on windows
vim.cmd([[command! W w]])
vim.cmd([[command! Wq wq]])
vim.cmd([[command! WQ wq]])
vim.cmd([[command! Q q]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- You should instead use these keybindings so that they are still easy to use, but dont conflict
vim.keymap.set({"v", "x", "n"}, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({"n", "v", "x"}, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })

--- input navigation
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
-- switch window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
-- general
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("i", "jk", "<ESC>", { nowait = true })
map("n", ";", ":", { desc = "CMD enter command mode" })
-- togglers
map("n", "<leader>tN", "<cmd>set nu!<CR>", { desc = "[t]oggle line [N]umber" })
map("n", "<leader>tn", "<cmd>set rnu!<CR>", { desc = "[t]toggle relative [n]umber" })
-- map("n", "<leader>zm", utils.toggleZenMode, { desc = "Toggle zen mode" })
-- format
-- map("n", "<leader>fm", function() conform.format({ lsp_fallback = true }) end, { desc = "general format file" })
-- dap
-- map("n", "<leader>rd", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
-- map("n", "<leader>rD", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })
-- lsp go to
-- map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP Go to declaration" })
-- code actions
map("n", "<leader>cr", function ()
  vim.lsp.buf.rename()
end, { desc = "LSP [c]ode [r]ename" })
map({ "n", "v" }, "<leader>ca", function ()
  vim.lsp.buf.code_action()
end, { desc = "LSP [c]ode [a]ction" })
map("n", "<leader>cs", vim.lsp.buf.signature_help, { desc = "LSP Show [c]ode [s]ignature help" })
