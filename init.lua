require("config");

local function executeBashScript(scriptPath)
    local command = string.format("bash %s", scriptPath)
    local handle = io.popen(command)
    local output = handle:read("*a")
    handle:close()
    return output
end

-- Get the directory path of the current Lua script
local scriptPath = debug.getinfo(1).source:match("@?(.*/)")
local bashScriptPath = scriptPath .. "init.sh"

-- Execute the bash script
local bashScriptOutput = executeBashScript(bashScriptPath)

-- Print the output of the bash script
print(bashScriptOutput)
