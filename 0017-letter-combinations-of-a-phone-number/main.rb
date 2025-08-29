# convenience, beats 100%
def letter_combinations(digits)
  return [] if digits == ""
  letters = {
    0 => [],
    1 => [],
    2 => %w[a b c],
    3 => %w[d e f],
    4 => %w[g h i],
    5 => %w[j k l],
    6 => %w[m n o],
    7 => %w[p q r s],
    8 => %w[t u v],
    9 => %w[w x y z]
  }

  a, *b = digits.split(//).map { |a| letters[a.to_i] }
  a.product(*b).map(&:join)
end

# r = letter_combinations("23")
# puts r.inspect
# puts r == ["ad","ae","af","bd","be","bf","cd","ce","cf"]

r = letter_combinations("234")
puts r.inspect
puts r == ["ad","ae","af","bd","be","bf","cd","ce","cf"]