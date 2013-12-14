local function polynomial (coefficients, x)
   local p = 0
   local a = 1
   for i = 1, #coefficients do
      p = p + coefficients[i] * a
      a = a * x
   end
   return p
end

return {polynomial = polynomial}