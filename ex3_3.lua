local function polynomial (coefficients, x)
   local p = 0
   local a = 1
   local n = #coefficients
   for i = 1, n do
      local j = n - i + 1
      p = p + coefficients[j] * a
      a = a * x
   end
   return p
end

return {polynomial = polynomial}