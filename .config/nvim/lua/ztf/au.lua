-- TODO: finish attempt at open-at-last-line autocommand
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = vim.api.nvim_create_augroup("open-at-last-pos", { clear = true }),
--   callback = function()
--     nvim
--   end,
-- })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("ft-gitcommit-settings", { clear = true }),
  pattern = 'gitcommit',
  callback = function()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("ft-floaterm-settings", { clear = true }),
  pattern = 'floaterm',
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- Open files at last position
-- (the mark " is the position last closed at)
vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup("open-last-pos", { clear = true }),
  callback = function()
    vim.fn.setpos(".", vim.fn.getpos("'\""))
    vim.cmd('execute "normal zz"')
  end,
})

-- Automatically enter insert mode in a terminal (:terminal)
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup("term-auto-insert", { clear = true }),
  pattern = "term://*",
  callback = function()
    vim.cmd('startinsert')
  end,
})

local ft_customize_grp = vim.api.nvim_create_augroup("ft-customize", { clear = true })
local create_ft_au = function(pat, fn)
  vim.api.nvim_create_autocmd('FileType', {
    group = ft_customize_grp,
    pattern = pat,
    callback = fn,
  })
end

local wrapped_writing_settings = function()
  vim.bo.textwidth = 0
  vim.wo.colorcolumn = '0'
  vim.wo.wrap = true
end

create_ft_au('gitcommit', function()
  vim.bo.textwidth = 68
  vim.wo.colorcolumn = '69'
end)
create_ft_au('rust', function()
  vim.bo.textwidth = 100
  vim.o.colorcolumn = '101'
end)
create_ft_au('markdown.pandoc', wrapped_writing_settings)
create_ft_au('tex', wrapped_writing_settings)
create_ft_au('tex', function()
  vim.cmd('set foldmethod=expr')
  vim.cmd('set foldexpr=vimtex#fold#level(v:lnum)')
  vim.cmd('set foldtext=vimtex#fold#text()')
end)

-- TODO(maybe):
--   autocmd FileType floaterm set nonumber norelativenumber
--   autocmd FileType PKGBUILD nnoremap <leader>ma :!(updpkgsums ; makepkg --printsrcinfo > .SRCINFO)<CR>
--   augroup spdx_ft_setting
--       au! BufNewFile,BufFilePre,BufRead *.spdx set filetype=spdx
--   augroup END

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufFilePre', 'BufRead' }, {
  group = vim.api.nvim_create_augroup("set-pandoc-ft-for-md-files", { clear = true }),
  pattern = "*.md",
  callback = function()
    vim.bo.filetype = 'markdown.pandoc'
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup("highlight-yanks", { clear = true }),
  callback = function() vim.highlight.on_yank { higroup = 'DiffAdd', timeout = 200 } end,
})

vim.api.nvim_create_autocmd('CmdwinEnter', {
  group = vim.api.nvim_create_augroup("cmdwin-settings", { clear = true }),
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("java-settings", { clear = true }),
  pattern = {'java'},
  callback = function()
    print("[😇] loading jdtls...")
    local config = {
        cmd = {'jdtls'},
        root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    }
    require('jdtls').start_or_attach(config)
    print("[😇] jdtls is loaded.")

    -- tabs and spaces
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("quickfix-settings", { clear = true }),
  pattern = {'qf'},
  callback = function()
    vim.opt.wrap = false
  end,
})
