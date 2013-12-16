local function concat (...)
   local s = ""
   for i, v in ipairs{...} do
      s = s .. v
   end
   return s
end

return {concat = concat}
