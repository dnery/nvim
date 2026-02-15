local M = {}

function M.get_os_name() 
    if os.getenv("OS") == "Windows_NT" then
        return "windows"
    elseif os.getenv("HOME") and os.getenv("SHELL") then
        return "macos"
    else
        return "linux"
    end
end


function M.ensure_dir(path)
    if vim.fn.isdirectory(path) == 0 then
        vim.fn.mkdir(path, "p")
    end
    return path
end

return M
