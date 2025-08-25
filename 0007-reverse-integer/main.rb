# # beats 70%
# def reverse(x)
#   is_positive = x.positive?
#   i = x.abs.to_s.reverse.to_i
#   return 0 unless (-(2**31)..(2**31 -1)).cover?(i)
#   is_positive ? i : -i
# end

# From python algorithm [editorial](https://leetcode.com/problems/reverse-integer/editorial/?page=3)
# beats 19%
def reverse(x)
  sign = x < 0 ? -1 : 1
  rev, x = 0, x.abs
  while x != 0
    x, mod = x.divmod(10)
    rev = rev * 10 + mod
    if (rev > ((2**31) - 1))
      return 0
    end
  end
  return sign * rev
end

a = 123
r = reverse(a)
e = 321
puts r
puts r == e

a = -123
r = reverse(a)
e = -321
puts r
puts r == e

a = 120
r = reverse(a)
e = 21
puts r
puts r == e

a = 1534236469
r = reverse(a)
e = 0
puts r
puts r == e