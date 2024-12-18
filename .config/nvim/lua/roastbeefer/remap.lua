vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set({ "n", "v" }, "m", "h")
-- vim.keymap.set({ "n", "v" }, "n", "j")
-- vim.keymap.set({ "n", "v" }, "e", "k")
-- vim.keymap.set({ "n", "v" }, "i", "l")
-- vim.keymap.set("n", "k", "i")
-- vim.keymap.set("n", "K", "I", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "N", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<CR><C-w><down>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR><C-w><right>")
vim.keymap.set("n", "<leader>wh", "<C-w><left>")
vim.keymap.set("n", "<leader>wj", "<C-w><down>")
vim.keymap.set("n", "<leader>wk", "<C-w><up>")
vim.keymap.set("n", "<leader>wl", "<C-w><right>")

-- undo like helix
vim.keymap.set("n", "U", "<C-r>")

-- vim.keymap.set("n", "gs", "^")
-- vim.keymap.set("n", "gl", "$")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "fw", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !wez-sess<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-e>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-n>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>e", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Add spaces without leaving normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

-- Fugitive
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>")

vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
