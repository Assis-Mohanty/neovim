local map = vim.keymap.set

-- Clear search highlight on Esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- jk to exit insert mode
map("i", "kj", "<Esc>", { desc = "Exit insert mode" })
map("v", "[", "c[]<Esc>P", { desc = "Wrap selection with []" })
map("v", "{", "c{}<Esc>P", { desc = "Wrap selection with {}" })
map("v", "(", "c()<Esc>P", { desc = "Wrap selection with ()" })


--------------------------------------------------
-- CP Stopwatch (Top-Right Floating Window)
--------------------------------------------------
local uv = vim.uv or vim.loop
local sw_timer = nil
local sw_start_time = nil
local sw_buf = nil
local sw_win = nil

local function close_stopwatch()
  if sw_timer then
    sw_timer:stop()
    sw_timer:close()
    sw_timer = nil
  end
  if sw_win and vim.api.nvim_win_is_valid(sw_win) then
    vim.api.nvim_win_close(sw_win, true)
  end
  sw_win = nil
end

local function update_stopwatch()
  if not sw_win or not vim.api.nvim_win_is_valid(sw_win) then
    close_stopwatch()
    return
  end
  local elapsed = math.floor(uv.now() / 1000 - sw_start_time)
  local hours = math.floor(elapsed / 3600)
  local mins = math.floor((elapsed % 3600) / 60)
  local secs = elapsed % 60
  local text = string.format("⏱ %02d:%02d:%02d", hours, mins, secs)

  vim.api.nvim_buf_set_lines(sw_buf, 0, -1, false, { text })
end

local function toggle_stopwatch()
  if sw_timer then
    close_stopwatch()
    return
  end

  sw_buf = vim.api.nvim_create_buf(false, true)
  local width = 12
  local height = 1
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = vim.o.columns - width - 2,
    row = 1,
    style = "minimal",
    border = "rounded",
  }
  sw_win = vim.api.nvim_open_win(sw_buf, false, opts)

  sw_start_time = math.floor(uv.now() / 1000)
  update_stopwatch()

  sw_timer = uv.new_timer()
  sw_timer:start(1000, 1000, vim.schedule_wrap(update_stopwatch))
end

-- Changed to <leader>0 (Spacebar + 0)
map("n", "<leader>0", toggle_stopwatch, { desc = "Toggle CP Stopwatch" })
