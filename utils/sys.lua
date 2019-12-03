local sys = {}

local sysMap = {
    ["Windows"] = "windows",
    ["OS X"] = "mac",
    ["Linux"] = "linux"
}

sys.dep = function(osOpts)
    local os = sysMap[love.system.getOS()]
    return osOpts[os]
end

sys.libExt = sys.dep({windows = ".dll", mac = ".dylib", linux = ".so"})

return sys
