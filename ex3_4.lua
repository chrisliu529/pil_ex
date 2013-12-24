local i_polynomial
function i_polynomial(coefficients, x, i)
   if i == 1 then
      return coefficients[i]
   else
      return coefficients[i] + x*i_polynomial(coefficients, x, i-1)
   end
end

local function polynomial (coefficients, x)
   return i_polynomial(coefficients, x, #coefficients)
end

return {polynomial = polynomial}
