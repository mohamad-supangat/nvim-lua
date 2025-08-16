local M = {}

local function create_window(width, direction)
  vim.api.nvim_command("vsp")
  vim.api.nvim_command("wincmd " .. direction)
  pcall(vim.cmd, "buffer " .. M.buf)
  vim.api.nvim_win_set_width(0, width)
  vim.wo.winfixwidth = true
  vim.wo.cursorline = false
  vim.wo.winfixbuf = true
  vim.o.numberwidth = 1
  vim.wo.rnu = false
  vim.wo.nu = false
end

function M.get_root(cwd)
  local status, job = pcall(require, "plenary.job")
  if not status then
    return fn.system("git rev-parse --show-toplevel")
  end

  local gitroot_job = job:new({
    "git",
    "rev-parse",
    "--show-toplevel",
    cwd = cwd,
  })

  local path, code = gitroot_job:sync()
  if code ~= 0 then
    return nil
  end

  return table.concat(path, "")
end

function M.currentFileRootPath()
  local current_dir = vim.fn.expand("%:p:h")
  local git_root = M.get_root(current_dir)
  return git_root
end

function M.zenmode()
  if M.buf == nil then
    M.buf = vim.api.nvim_create_buf(false, false)

    local width = 30

    local cur_win = vim.fn.win_getid()

    create_window(width, "H")
    create_window(width, "L")

    vim.api.nvim_set_current_win(cur_win)
  else
    vim.api.nvim_buf_delete(M.buf, { force = true })
    M.buf = nil
  end
end

function M.GitAutoCommit()
  local current_datetime = os.date("%Y-%m-%d %H:%M:%S")
  local commit_message = "auto commit from neovim: " .. current_datetime

  local original_cwd = vim.fn.getcwd()
  local root_path = M.currentFileRootPath()

  if root_path then
    vim.cmd("silent! cd " .. root_path)
    vim.cmd("silent !git add .")
    vim.cmd(string.format("silent !git commit -m %q", commit_message))
    vim.cmd("silent !git push")
    vim.cmd("silent! cd " .. original_cwd)

    vim.notify("Git auto commit dan push selesai.", vim.log.levels.INFO, { title = "Git Auto Commit" })
  else
    vim.notify("Tidak dapat menemukan root direktori Git.", vim.log.levels.ERROR, { title = "Git Auto Commit Error" })
  end
end

return M
