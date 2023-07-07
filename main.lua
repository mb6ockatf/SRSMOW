#!/usr/bin/env lua
--- some information about solar system

--- print array to stdout.
-- @function write
-- @param ... array-like object
-- @treturn string array
local function write(...)
	local text = ""
	for _, value in ipairs({...}) do
		text = text .. " " .. tostring(value)
	end
	io.write(text .. "\n")
end

function dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end

local function split_request_path(request_path)
    local result = {}
    for i = 2, #request_path, 1 do
        local element = request_path[i]
        if element == "/" then
            result:insert("")
        else
            result[-1] = result[-1] .. element 
        end
    return result
end

local pegasus = require 'pegasus'
local server = pegasus:new({port="9090", host="127.0.0.1", timeout="3000"})

local function handler(request, response)
	write("it is running...")
    file = io.open("shitty_shit", "a")
    io.output(file)
	write(request:path())
    io.close(file)
end

server:start(handler)