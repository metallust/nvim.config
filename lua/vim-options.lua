vim.cmd("set tabstop=4")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.opt.showmode = false

--vim.opt.clipboard = 'unnamedplus'
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

--open vim defalut explorer
vim.keymap.set('n',"<leader>pv", vim.cmd.Ex)

-- Remap Alt+k and Alt+j to move the visually selected lines up
vim.api.nvim_set_keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Remap Alt+k and Alt+j to move the current line up in normal mode
vim.api.nvim_set_keymap('n', '<M-j>', ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ":m .-2<CR>==", { noremap = true, silent = true })

-- Copy selected lines up and down
vim.api.nvim_set_keymap('v', '<A-S-k>', ":t '<-2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-S-j>', ":t '>+1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-k>', ":t .-1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-j>', ":t .+1<CR>", { noremap = true, silent = true })

-- ctrl-d and ctrl-u
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })


--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

