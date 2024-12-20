local function get_root(cwd)
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

local function currentFileRootPath()
    local current_dir = vim.fn.expand("%:p:h")
    local git_root = get_root(current_dir)
    return git_root
end

return {
    get_root = get_root,
    currentFileRootPath = currentFileRootPath,
}
