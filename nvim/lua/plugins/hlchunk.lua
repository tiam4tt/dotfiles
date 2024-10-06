return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      line_num = {
        enable = true
      },
      chunk = {
        enable = true,
        style = "#98ddff"
      },
      indent = {
        enable = true
      }
    })
  end
}
