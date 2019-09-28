-- Config for custom stuff not directly related to love engine.
-- It's separated from `conf.lua` and sourced after love modules
-- are initialized. This way makes it possible to use love functions
-- like os detection.

local sys = require("utils.sys")

-- Set library search dir to `lib` exclusively
package.path = "./lib/?.lua"
package.cpath = "./lib/?" .. sys.libExt
