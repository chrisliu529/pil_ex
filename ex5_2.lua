local write = io.write

local function test(p)
   p({1, 2, 3})
   p({1, 2, nil, 3})
end

--[[
using table.unpack
pros: simple and short
cons: not flexible to control print format
--]]
local function print_array1 (array)
   print(table.unpack(array))
end

test(print_array1)
--[[
output:
1	2	3
1	2	nil	3
--]]

--using # operator
local function print_array2 (array)
   for i = 1, #array do
      write(tostring(array[i]) .. "\t")
   end
   print()
end

test(print_array2)
--[[
output:
1	2	3
1	2	nil	3
--]]

--using paris(t) iterator
local function print_array3 (array)
   for _, v in pairs(array) do
      write(tostring(v) .. "\t")
   end
   print()
end

test(print_array3)
--[[
output:
1	2	3	
1	2	3
--]]
