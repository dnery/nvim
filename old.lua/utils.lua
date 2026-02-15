local M = {}

-- Figure out where we're running
function M.get_os_name() 
	if os.getenv("OS") == "Windows_NT" then
		return "windows"
	elseif os.getenv("HOME") and os.getenv("SHELL") then
		return "macos"
	else
		return "linux"
	end
end

return M
