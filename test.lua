local ex3_3 = require "ex3_3"
local ex3_4 = require "ex3_4"

local function test_poly (p)
   assert (p({1}, 1) == 1)
   assert (p({1}, 0) == 1)
   assert (p({1, 1, 1}, 0) == 1)
   assert (p({1, 1}, 2) == 3)
   assert (p({1, 1}, 1) == 2)
   assert (p({1, 1, 1}, 1) == 3)
   assert (p({1, 1, 1}, 2) == 7)
end

test_poly(ex3_3.polynomial)
test_poly(ex3_4.polynomial)

local ex5_1 = require "ex5_1"
local function test_concat (c)
   assert ("a" == c("a"))
   assert ("ab" == c("a", "b"))
   assert ("abc" == c("a", "b", "c"))
end
test_concat(ex5_1.concat)

local ex5_3 = require "ex5_3"
local function test_remove_first_arg (r)
   assert (nil == r(1))
   local a, b = r(1, 2)
   assert (a == 2 and b == nil)
   local a, b = r(1, 2, 3)
   assert (a == 2 and b == 3)
end
test_remove_first_arg(ex5_3.remove_first_arg)
