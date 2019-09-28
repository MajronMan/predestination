local sys = {}

local sysMap = {
    ["Windows"] = "windows",
    ["OS X"] = "mac",
    ["Linux"] = "linux"
}

sys.dep = function(osOpts)
    local os = sysMap[love.system.getOS()]

    if type(osOpts[os]) == "function" then
        return osOpts[os]()
    else
        return osOpts[os]
    end
end

sys.libExt = sys.dep({windows = ".dll", mac = ".dylib", linux = ".so"})

return sys
