vim.opt.encoding = 'UTF-8'
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.updatetime = 100
vim.opt.mouse = ''
vim.opt.colorcolumn = '120'
vim.opt.pumheight = 10
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.cmdheight = 1

vim.cmd [[
    autocmd BufNewFile,BufRead *.log setfiletype log
    autocmd BufNewFile,BufRead *.LOG setfiletype log
    autocmd BufNewFile,BufRead *.out setfiletype log
]]
