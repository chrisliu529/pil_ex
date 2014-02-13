local function stringrep (s, n)
   local r = ""
   if n > 0 then
      while n > 1 do
	 if n % 2 ~= 0 then r = r .. s end
	 s = s .. s
	 n = math.floor(n / 2)
      end
      r = r .. s
   end
   return r
end

local function stringrep1 (s, n)
   local r = "local function srep(s) local r = '';"
   if n > 0 then
      while n > 1 do
	 if n % 2 ~= 0 then r = r .. "r = r .. s;" end
	 r = r .. "s = s .. s;"
	 n = math.floor(n / 2)
      end
      r = r .. "r = r .. s; return r; end; return srep('" .. s .. "')"
   end
   return load (r)
end

return {stringrep = stringrep,
	stringrep1 = stringrep1
}
