-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- オプション: カラースキームを設定
vim.cmd.colorscheme("cyberdream")
if vim.fn.has('win32') == 1 then
  vim.opt.shell = "bash"
  vim.opt.shellcmdflag = "-c"
  vim.opt.shellquote = "\""
  vim.opt.shellxquote = ""
end