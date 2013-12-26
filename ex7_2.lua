--[[
It seems impossible to be done with a stateless iterator because step cannot be
passed with current val without creating a table.
Closure is chosen in the implementation below.
--]]
local function fromto(n, m, s)
   local function fromto_iter(m, n)
      if n == m then
	 return nil
      else
	 return n+s
      end
   end
   return fromto_iter, m, n-s
end

for i in fromto(10, 1, -1) do
   print(i)
end
