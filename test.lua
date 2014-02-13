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
   -- test cases from Exercise 6.2
   assert (p({3, 0, 1}, 0) == 1)
   assert (p({3, 0, 1}, 5) == 76)
   assert (p({3, 0, 1}, 10) == 301)
end

test_poly(ex3_3.polynomial)
test_poly(ex3_4.polynomial)

local ex6_2 = require "ex6_2"
local function poly_f (coeffients, x)
   local f = ex6_2.polynomial_f(coeffients)
   return f(x)
end
test_poly(poly_f)

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

local ex8_1 = require "ex8_1"
local f = ex8_1.loadwithprefix("return ", "1")
assert (f() == 1)
local function reader()
   local i = 0
   function _reader()
      local content = {"tryme() ", "return 2 ", "end ", "return tryme()"}
      i = i + 1
      return content[i]
   end
   return _reader
end
f = ex8_1.loadwithprefix("local function ", reader())
assert (f() == 2)

local ex8_2 = require "ex8_2"
local f = ex8_2.multiload("local function foo()",
			     "local x = 10;",
			     "local y = 1;",
			     "return x+y end;",
			     "return foo()")
assert (f() == 11)

local ex8_3 = require "ex8_3"

local function t8_3(s, n)
   local f = ex8_3.stringrep1(s, n)
   return f()
end

local function test_stringrep(f)
   assert ("aaaaa" == f("a", 5))
   assert ("ab" == f("ab", 1))
   assert ("abab" == f("ab", 2))
end

test_stringrep(ex8_3.stringrep)
test_stringrep(t8_3)

local function bench_stringrep(f, s, n)
   local x = os.clock()
   f(s, n)
   return os.clock() - x
end
print(bench_stringrep(ex8_3.stringrep, "a", 10000000))
print(bench_stringrep(t8_3, "a", 10000000))
--[[
   The performance of our tailor-made function is faster than the generic function
   in Listing 8.2. However, it's probably not worthy doing so because the generic version
   is much easier to be understood. BTW, with a very low time complexity O(log_2(n)),
   the bottleneck lies in memory size instead of CPU time
--]]
