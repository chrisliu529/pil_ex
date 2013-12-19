local function remove_first_arg(...)
   local t = {}
   local j = 1
   local args = {...}
   for i = 2, #args do
      t[j] = args[i]
      j = j + 1
   end
   return table.unpack(t)
end

return {remove_first_arg = remove_first_arg}
