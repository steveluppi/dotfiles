
---- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  desc = "Highlight on yank",
  group = config_augroup,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      -- higroup = "HighlightedYankRegion",
      timeout = 75,
    })
  end,
})

---- Setup things for vim-presenting
vim.api.nvim_create_autocmd("FileType", {
    pattern = "vimwiki",  -- Specify the file type
    callback = function()  -- Define the callback function
        vim.b.presenting_slide_separator = '----'  -- Set the buffer variable
    end,
})
