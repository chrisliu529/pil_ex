local function multiload(...)
   local args = {...}
   local n = #args
   local i = 0
   local function _load()
      i = i + 1
      if (i > n) then return nil end
      local chunk = args[i]
      if type(chunk) == "string" then
	 return chunk
      elseif type(chunk) == "function" then
	 return chunk()
      end
   end
   return load(_load)
end

return {multiload = multiload}
