t = {
   ["\a"] = "bell",
   ["\b"] = "back space",
   ["\f"] = "form feed",
   ["\n"] = "newline",
   ["\r"] = "carriage return",
   ["\t"] = "horizontal tab",
   ["\v"] = "vertical tab",
   ["\\"] = "backslash",
   ["\""] = "double quote",
   ["\'"] = "single quote"
}

local utils = require "utils"
utils.print_table(t)
