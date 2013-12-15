local ex3_3 = require "ex3_3"
local ex3_4 = require "ex3_4"

local function test_poly (p)
   assert (ex3_3.polynomial({1}, 1) == 1)
   assert (ex3_3.polynomial({1}, 0) == 1)
   assert (ex3_3.polynomial({1, 1, 1}, 0) == 1)
   assert (ex3_3.polynomial({1, 1}, 2) == 3)
   assert (ex3_3.polynomial({1, 1}, 1) == 2)
   assert (ex3_3.polynomial({1, 1, 1}, 1) == 3)
   assert (ex3_3.polynomial({1, 1, 1}, 2) == 7)
end

test_poly(ex3_3.polynomial)
test_poly(ex3_4.polynomial)
