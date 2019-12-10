local path = package.searchpath((...) .. ".liblayout", package.cpath)
local open = assert(package.loadlib(path, "luaopen_layout"))
open() -- module is loaded as a global named "Layout"
local layout = Layout
Layout = nil
return layout
