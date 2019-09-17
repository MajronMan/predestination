local path = package.searchpath((...) .. ".nuklear", package.cpath)
local open = assert(package.loadlib(path, "luaopen_nuklear"))
return open()
