return {
  'f-person/git-blame.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    -- This disables showing of the blame text next to the cursor
    vim.g.gitblame_display_virtual_text = 0
    return {
      message_template = '<author> • <date> • <summary>',
      date_format = '%r',
    }
  end
}
