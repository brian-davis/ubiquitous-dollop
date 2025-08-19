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