# beats 6%
def int_to_roman(num)
  result = []
  romans = {
    1000 => "M",
    500  => "D",
    100  => "C",
    50   => "L",
    10   => "X",
    5    => "V",
    1    => "I"
  }
  rkeys = [1, 5, 10, 50, 100, 500, 1000]
  next_kv = -> (k) {
    i = rkeys.index(k)
    _k = rkeys[i + 1]
    v = romans[_k]
    return [_k, v]
  }

  # [1000, 100 , 10, 1]
  decimal_places = []
  i = 0
  until decimal_places[0] && decimal_places[0] >= num
    decimal_places.unshift(10 ** i)
    i += 1
  end

  # => [3, 7, 4, 9]
  num_by_place = []
  while num > 0
    d = decimal_places.detect { |dp| num >= dp }
    a, num = num.divmod(d)
    num_by_place.push [a, d]
  end

  num_by_place.each do |n, decimal_place|
    rv = romans[rkeys.detect { |rk| rk == decimal_place }]
    a, b = next_kv.(decimal_place)

    c = romans[decimal_place]
    if n <= 3
      result.push(rv * n)
    elsif n == 4
      result.push("#{c}#{b}")
    elsif n == 5
      result.push("#{b}")
    elsif n == 9
      a, b = next_kv.(a) # skip over the 5/50/500
      result.push("#{c}#{b}")
    else
      # 6,7,8
      diff = n - 5
      result.push("#{b}#{c * diff }")
    end
  end

  return result.join
end

a = 3749
r = int_to_roman(a)
puts r
e = "MMMDCCXLIX"
puts r == e

a = 58
r = int_to_roman(a)
puts r
e = "LVIII"
puts r == e

a = 100
r = int_to_roman(a)
puts r
e = "C"
puts r == e


a = 10
r = int_to_roman(a)
puts r
e = "X"
puts r == e