local map = vim.keymap.set

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<C-h>", "<C-w>h", { remap = true })
map("n", "<C-j>", "<C-w>j", { remap = true })
map("n", "<C-k>", "<C-w>k", { remap = true })
map("n", "<C-l>", "<C-w>l", { remap = true })

map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==")
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv")

map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "[b", "<cmd>bprevious<cr>")
map("n", "]b", "<cmd>bnext<cr>")
map("n", "<leader>bb", "<cmd>e #<cr>")
map("n", "<leader>`", "<cmd>e #<cr>")
map("n", "<leader>bD", "<cmd>bd<cr>")

map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true })

map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>")

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true })
map("x", "n", "'Nn'[v:searchforward]", { expr = true })
map("o", "n", "'Nn'[v:searchforward]", { expr = true })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true })
map("x", "N", "'nN'[v:searchforward]", { expr = true })
map("o", "N", "'nN'[v:searchforward]", { expr = true })

map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")
map("n", "<leader>K", "<cmd>norm! K<cr>")

map("x", "<", "<gv")
map("x", ">", ">gv")

map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>")
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>")

map("n", "<leader>l", "<cmd>Lazy<cr>")
map("n", "<leader>fn", "<cmd>enew<cr>")

map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end)

map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end)

map("n", "[q", vim.cmd.cprev)
map("n", "]q", vim.cmd.cnext)

map({ "n", "x" }, "<leader>cf", function()
  require("conform").format({ force = true })
end)

local function diagnostic_goto(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end

map("n", "<leader>cd", vim.diagnostic.open_float)
map("n", "]d", diagnostic_goto(true))
map("n", "[d", diagnostic_goto(false))
map("n", "]e", diagnostic_goto(true, "ERROR"))
map("n", "[e", diagnostic_goto(false, "ERROR"))
map("n", "]w", diagnostic_goto(true, "WARN"))
map("n", "[w", diagnostic_goto(false, "WARN"))

map("n", "<leader>ui", vim.show_pos)
map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input("I")
end)

map("n", "<leader>qq", "<cmd>qa<cr>")

map("n", "<leader>-", "<C-W>s", { remap = true })
map("n", "|", "<C-W>v", { remap = true })
map("n", "-", "<C-W>s", { remap = true })
map("n", "<leader>wd", "<C-W>c", { remap = true })

map("n", "<leader><tab>l", "<cmd>tablast<cr>")
map("n", "<leader><tab>o", "<cmd>tabonly<cr>")
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "<leader><tab>]", "<cmd>tabnext<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>")

if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>gg", "<cmd>terminal lazygit<cr>")
end
vim.g.mapleader = " "

vim.keymap.set("n", "|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "-", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>x", "<cmd>close<cr>")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { nowait = true })
vim.keymap.set("n", "<C-u", "<C-u>zz", { nowait = true })
vim.keymap.set("n", "{", "{zz", { nowait = true })
vim.keymap.set("n", "}", "}zz", { nowait = true })
vim.keymap.set("n", "<TAB>", ":lua GoToNextOrFirstBuffer()<CR>", { desc = "Next Buffer", nowait = true, silent = true })

vim.keymap.set(
  "n",
  "<S-TAB>",
  ":lua GoToPrevOrLastBuffer()<CR>",
  { desc = "Prev Buffer", nowait = true, silent = true }
)

function GoToNextOrFirstBuffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local last_buffer = vim.api.nvim_buf_get_number(vim.api.nvim_list_bufs()[#vim.api.nvim_list_bufs()])
  if current_buffer == last_buffer then
    vim.cmd("bfirst")
  else
    vim.cmd("bnext")
  end
end

function GoToPrevOrLastBuffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local first_buffer = vim.api.nvim_buf_get_number(vim.api.nvim_list_bufs()[1])
  if current_buffer == first_buffer then
    vim.cmd("blast")
  else
    vim.cmd("bprev")
  end
end

