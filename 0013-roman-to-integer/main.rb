# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer.

# @param {String} s
# @return {Integer}

class RomanNumeral
  NUMERALS = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }
end

def roman_to_int(s)
  r = 0
  chars = s.chars
  while ((i ||= 0) < s.length) do
    c_a = chars[i]
    c_b = chars[i + 1]
    if c_a == 'I' && (c_b == 'V' || c_b == 'X') ||
       c_a == 'X' && (c_b == 'L' || c_b == 'C') ||
       c_a == 'C' && (c_b == 'D' || c_b == 'M')
      v = RomanNumeral::NUMERALS[c_b] - RomanNumeral::NUMERALS[c_a]
      r += v
      i += 2
    else
      v = RomanNumeral::NUMERALS[c_a]
      r += v if v
      i += 1
    end
  end
  r
end

p roman_to_int('III') == 3
p roman_to_int('XIV') == 14
p roman_to_int('MCMXLIV') == 1944