def plus_one(digits)
  result = []
  carry = 1
  (digits.length - 1).downto(0) do |i|
    dd = digits[i]
    dd = dd + carry
    carry, dd = dd.divmod(10)
    result.unshift(dd)
  end
  result.unshift(carry) if carry > 0
  result
end

# e1 = [1,2,3]
# p plus_one(e1)

# e2 = [4,3,2,1]
# p plus_one(e2)

# e3 = [9]
# p plus_one(e3)

e4 = [9,9,9]
p plus_one(e4)