local undump = require "undump"
local json = require "json-beautify"

local function readall(path)
    local f <close> = assert(io.open(path, "rb"))
    return f:read "a"
end

local function writeall(path, content)
    local f <close> = assert(io.open(path, "wb"))
    f:write(content)
end

local input = arg[1]
local output = arg[2]

local f, err = load(readall(input), "@"..input)
if not f then
    io.stderr:write(err)
    return
end
local bin = string.dump(f)
local cl = undump(bin)
writeall(output, json.beautify(cl))
