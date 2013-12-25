local function fromto_iter(m, n)
   if n >= m then
      return nil
   else
      return n+1
   end
end

local function fromto(n, m)
   return fromto_iter, m, n-1
end

for i in fromto(1, 5) do
   print(i)
end

