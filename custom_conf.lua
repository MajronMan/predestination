-- Config for custom stuff not directly related to love engine.
-- It's separated from `conf.lua` and sourced after love modules
-- are initialized. This way makes it possible to use love functions
-- like os detection.

-- set library search dir to `lib`, instead of the project root
package.path = string.gsub(package.path, "?", "lib/?", 1)
package.cpath = string.gsub(package.cpath, "?", "lib/?", 1)

-- fix library extension on OS X
if ("OS X" == love.system.getOS()) then
    package.cpath = string.gsub(package.cpath, "%.so(;?)", ".dylib%1")
end
