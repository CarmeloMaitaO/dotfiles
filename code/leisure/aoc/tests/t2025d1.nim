# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import aoc
test "check":
  let testData: string = """
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82"""
  check day1(testData) == 3
