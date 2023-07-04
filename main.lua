#!/usr/bin/env lua
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

local pegasus = require 'pegasus'
local server = pegasus:new({port="9090", host="127.0.0.1", timeout="3000"})

local function handler(request, response)
	write("it is running...")
	write(request:path())
	write(dump(request:headers()))
	write(dump(request.querystring))
end

server:start(handler)

