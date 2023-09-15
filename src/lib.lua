--[[
	local css = libluacss.new()
	css.Bind.PropertyParsed:connect(function(Property, Value)
	css.Bind.Parsed:connect(function(TableResult)
]]

local libluacss={}
local libbind={
	events = {}
}
libluacss.__index=libluacss
libbind.__index=libbind

local insert=table.insert
local lower=string.lower
local gmatch=string.gmatch
local split=string.split or function(String, Delimiter)
	Delimiter = Delimiter or ','
	local Split_String = {}
	for reg in gmatch(String, "[^"..Delimiter.."]+") do
		insert(Split_String, reg)
	end
	return Split_String
end

local function new_bind_collection(Events)
	return setmetatable(Events, {
		__index = function(self,i)
			return rawget(self,i)
		end,
		__newindex = function()
			return nil
		end,
		__metatable = nil
	})
end

function libbind.new(Type)
	return setmetatable({}, libbind)
end

function libbind:connect(callback)
	
end

--[[
Create a new CSS instance.

libluacss.new(StyleSheet_Lang?: `string | "css" | "sass" | source`, StyleSheet_Source: `string | source`)
```lua
print("Hi")
```
]]
function libluacss.new(StyleSheet_Lang, StyleSheet_Source)
	StyleSheet_Lang=(
		StyleSheet_Lang and not #StyleSheet_Lang>4 and lower(StyleSheet_Lang)
	) or "css"
	local self={}
	self.Source=tostring(StyleSheet_Source)
	self.Bind=new_bind_collection({
		PropertyParsed=libbind.new("PropertyParsed"),
		Parsed=libbind.new("Parsed")
	})
	return setmetatable(libluacss, self)
end

--[[
class {}
.multiple-names {}
#single-name {}
class[prop="value"] {}
]]
function libluacss:process()
	local Lines = split(self.Source, ";\n")
	for i = 1, #Lines do
		local Line = Lines[i]

	end
end

return libluacss