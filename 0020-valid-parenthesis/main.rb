# 20. Valid Parentheses
# Easy
# Topics
# Companies
# Hint
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Every close bracket has a corresponding open bracket of the same type.


# Example 1:
# Input: s = "()"
# Output: true

# Example 2:
# Input: s = "()[]{}"
# Output: true

# Example 3:
# Input: s = "(]"
# Output: false

# Example 4:
# Input: s = "([])"
# Output: true



# Constraints:

# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'.


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

e1 = "()"
p is_valid(e1) == true

e2 = "()[]{}"
p is_valid(e2) == true

e3 = "(]"
p is_valid(e3) == false

e4 = "([])"
p is_valid(e4) == true

e5 = "([]){[()[]]}"
p is_valid(e5) == true

e6 = "}"
p is_valid(e6) == false

# e6 = ""
# p is_valid(e6)

e7 = "(){}}{"
p is_valid(e7) == false

e8 = "([)]"
p is_valid(e8) == false

e9 = ")(){}"
p is_valid(e9) == false

e10 = "(])"
p is_valid(e9) == false