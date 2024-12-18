return {
    "Slotos/telescope-lsp-handlers.nvim",
    config = function()
       require'telescope-lsp-handlers'.setup()
       vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })
    end
}
