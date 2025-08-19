require "benchmark"

# 19%
def is_palindrome1(x)
  x.to_s == x.to_s.reverse
end

# 28%
def is_palindrome2(x)
  cc = x.to_s.chars
  # p cc
  0.upto(cc.length) do |i|
    return false if cc[i] != cc[(i + 1) * -1]
  end
  return true
end

# from winning submission
def is_palindrome3(x)
  reverse_x = 0
  num = x
  while num > 0 do
    rem = num % 10
    reverse_x = reverse_x * 10 + rem
    num = num / 10
  end
  return false if x != reverse_x
  return true
end

# Example 1:

# Input: x = 121
# Output: true
# Explanation: 121 reads as 121 from left to right and from right to left.
# Example 2:

# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: x = 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

x = 121
p is_palindrome3(x)

# x = 1234321
# p is_palindrome3(x)

# x = -121
# p is_palindrome3(x)

# x = 10
# p is_palindrome3(x)

# x = 12345
# p is_palindrome3(x)

# Benchmark.bm do |x|
#   x.report("is_palindrome1") {
#     r1 = is_palindrome1(1234321)
#     puts r1.inspect
#   }

#   x.report("is_palindrome2") {
#     r2 = is_palindrome2(1234321)
#     puts r2.inspect
#   }

#   x.report("is_palindrome3") {
#     r2 = is_palindrome3(1234321)
#     puts r2.inspect
#   }
# end