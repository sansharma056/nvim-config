require("bufferline").setup{
  options = {
    numbers = "ordinal",
    max_name_length = 18,
    tab_size = 20,
    diagnostics = "nvim_lsp",
    separator_style = "thin",
    show_close_icon = false,
    show_buffer_icons = false,
    show_buffer_close_icons = false
  }
}

vim.keymap.set('', '<A-1>', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>')
vim.keymap.set('', '<A-2>', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>')
vim.keymap.set('', '<A-3>', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>')
vim.keymap.set('', '<A-4>', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>')
vim.keymap.set('', '<A-5>', '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>')
vim.keymap.set('', '<A-6>', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>')
vim.keymap.set('', '<A-7>', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>')
vim.keymap.set('', '<A-8>', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>')
vim.keymap.set('', '<A-9>', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>')
vim.keymap.set('', '<A-0>', '<cmd>lua require("bufferline").go_to_buffer(10, true)<cr>')
vim.keymap.set('', '<A-h>', ':BufferLineMovePrev<CR>')
vim.keymap.set('', '<A-l>', ':BufferLineMoveNext<CR>')
vim.keymap.set('', '<leader>fr', ':BufferLineCloseRight<CR>')
vim.keymap.set('', '<leader>fl', ':BufferLineCloseLeft<CR>')

