# @param {String} s
# @return {Boolean}
def is_valid(s)
  return false if s.length <= 1
  left_parens  = ["{", "[", "("]
  right_parens = ["}", "]", ")"]
  # valid_parens = left_parens + right_parens
  # all_parens   = s.chars.select { |c| valid_parens.include?(c) }
  all_parens = s.chars
  stack = []
  while all_parens.length > 0 do
    e = all_parens.shift
    rindex = right_parens.index(e)
    if rindex && stack.last == left_parens[rindex]
      stack.pop
    else
      stack << e
    end
  end
  stack.empty?
end

# e1 = "()"
# p is_valid(e1) == true

# e2 = "()[]{}"
# p is_valid(e2) == true

# e3 = "(]"
# p is_valid(e3) == false

# e4 = "([])"
# p is_valid(e4) == true

# e5 = "([]){[()[]]}"
# p is_valid(e5) == true

# e6 = "}"
# p is_valid(e6) == false

# # e6 = ""
# # p is_valid(e6)

# e7 = "(){}}{"
# p is_valid(e7) == false

# e8 = "([)]"
# p is_valid(e8) == false

# e9 = ")(){}"
# p is_valid(e9) == false

# e10 = "(])"
# p is_valid(e9) == false