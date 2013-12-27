local function integral(f)
   return function (a, b)
      local steps = 1e+4
      local d = (b-a)/steps
      local s = 0
      local x = a
      while x <= b do
	 s = s + d*f(x)
	 x = x + d
      end
      return s
   end
end

local f = integral(function (x) return x end)
print(f(0, 1))
--[[
output: 0.50004999999996
   F(x) = (1/2)*x^2, very close to F(1) - F(0) = 0.5 
--]]
