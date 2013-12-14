local ex3_3 = require "ex3_3"

assert (ex3_3.polynomial({1}, 1) == 1)
assert (ex3_3.polynomial({1}, 0) == 1)
assert (ex3_3.polynomial({1, 1, 1}, 0) == 1)
assert (ex3_3.polynomial({1, 1}, 2) == 3)
assert (ex3_3.polynomial({1, 1}, 1) == 2)
assert (ex3_3.polynomial({1, 1, 1}, 1) == 3)
assert (ex3_3.polynomial({1, 1, 1}, 2) == 7)
