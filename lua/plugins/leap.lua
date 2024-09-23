return {
  'ggandor/leap.nvim',
  event = "VeryLazy",
  config = function()
    vim.keymap.set('n', '<tab>', '<Plug>(leap)')
    vim.keymap.set('n', '<s-tab>', '<Plug>(leap-from-window)')
    vim.keymap.set({ 'x', 'o' }, '<tab>', '<Plug>(leap-forward)')
    vim.keymap.set({ 'x', 'o' }, '<s-tab>', '<Plug>(leap-backward)')

    local leap = require('leap')
    leap.opts.special_keys.next_target = '<enter>'
    leap.opts.special_keys.prev_target = { '<backspace>', '<tab>' }
    leap.opts.special_keys.next_group = '<space>'
    leap.opts.special_keys.prev_group = { '<backspace>', '<tab>' }

    require('leap.user').set_repeat_keys('<enter>', '<backspace>', {
      relative_directions = true,
      modes = { 'n', 'x', 'o' },
    })
  end
}
