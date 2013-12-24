local i_polynomial
function i_polynomial(coefficients, x, i)
   if i == 1 then
      return coefficients[i]
   else
      return coefficients[i] + x*i_polynomial(coefficients, x, i-1)
   end
end

local function polynomial_f (coefficients)
   return function (x)
      return i_polynomial(coefficients, x, #coefficients)
   end
end

return {polynomial_f = polynomial_f}
