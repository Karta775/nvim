return {
  'kaarmu/typst.vim',
  ft = 'typst',
  lazy = true,
  config = function()
    vim.g.typst_conceal = 1
    vim.g.typst_auto_close_toc = 1
  end
}
