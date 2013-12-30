local function loadwithprefix(prefix, chunk)
   local state = 0
   local function _load()
      if state == 0 then
	 state = 1
	 return prefix
      else
	 if type(chunk) == "string" then
	    if state == 2 then
	       return nil
	    else
	       state = 2
	       return chunk
	    end
	 elseif type(chunk) == "function" then
	    return chunk()
	 end
      end
   end
   return load(_load)
end

return {loadwithprefix = loadwithprefix}
