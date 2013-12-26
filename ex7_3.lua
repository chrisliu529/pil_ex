function uniquewords()
   local line = io.read()
   local pos = 1
   local tab = {}
   return function ()
      while line do
	 local s, e = string.find(line, "%w+", pos)
	 local str
	 if s then
	    pos = e + 1
	    str = string.sub(line, s, e)
	    if tab[str] then
	       goto continue
	    else
	       tab[str] = true
	       return str
	    end
	 else
	    line = io.read()
	    pos = 1
	 end
	    ::continue::
      end
      return nil
   end
end

for word in uniquewords() do
   print(word)
end
