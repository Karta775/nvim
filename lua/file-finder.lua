
require('telescope').load_extension('projects')

-- project_nvim integration
-- require'telescope'.extensions.projects.projects{}

-- search files, even hidden ones
vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})

-- search files in .config/nvim
vim.keymap.set('n', '<leader>fn', ':Telescope find_files search_dirs={"~/.config/nvim"}<CR>', {})

-- search files in .config
vim.keymap.set('n', '<leader>fc', ':Telescope find_files search_dirs={"~/.config"}<CR>', {})

-- ripgrep files, respects gitignore
vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})

-- search projects (requires project_nvim)
vim.keymap.set('n', '<leader>fp', ':lua require"telescope".extensions.projects.projects{}<CR>', {})

