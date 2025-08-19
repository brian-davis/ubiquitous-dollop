require "benchmark"

def climb_stairs(n)
  count = 0
  return 1 if n == 1
  return 2 if n == 2

  a, _b = n.divmod(2)
  0.upto(a) do |i|
    arr = Array.new(n, 1)
    i.times {
      arr.pop
      arr.pop
    }
    i.times {
      arr << 2
    }
    # p arr

    count += arr.permutation.to_a.uniq.count
  end

  count
end

def climb_stairs_fib(n)
  return 1 if n <= 1
  return 2 if n == 2
  climb_stairs_fib(n - 1) + climb_stairs_fib(n - 2)
end

def climb_stairs_fast_fib(n)
  fibs = {
    0 => 1,
    1 => 1
  }

  0.upto(n) do |i|
    fibs[i] ||= fibs[i - 1] + fibs[i - 2]
  end

  fibs[n]
end

def climb_stairs_fast_fib2(n)
  fibs = [1, 1]

  0.upto(n) do |i|
    fibs[i] ||= fibs[i - 1] + fibs[i - 2]
  end

  fibs[n]
end

# 0.upto(7) do |i|
#   # puts "i: #{i}"
#   # puts "v1: #{climb_stairs(i)}"
#   # puts "v2: #{climb_stairs_fib(i)}"
#   puts "v3: #{climb_stairs_fast_fib(i)}"
#   puts "v4: #{climb_stairs_fast_fib2(i)}"
# end


Benchmark.bm do |x|
  # x.report("climb_stairs") {
  #   r1 = climb_stairs(38)
  #   puts r1.inspect
  # }
  # x.report("climb_stairs_fib") {
  #   r2 = climb_stairs_fib(38)
  #   puts r2.inspect
  # }
  x.report("climb_stairs_fast_fib") {
    r2 = climb_stairs_fast_fib(38)
    puts r2.inspect
  }
  x.report("climb_stairs_fast_fib2") {
    r2 = climb_stairs_fast_fib2(38)
    puts r2.inspect
  }
end



# 1 => 1
# 2 => 2
# 3 => 3
# 4 => 5
# 5 => 8
# 6 => 13
# 7 => 21




# [1, 1, 1, 1, 1, 1]
# [1, 1, 1, 1, 2]
# [1, 1, 2, 2]
# [2, 2, 2]
# 0

p climb_stairs(7)

# [1, 1, 1, 1, 1, 1, 1]
# [1, 1, 1, 1, 1, 2]
# [1, 1, 1, 2, 2]
# [1, 2, 2, 2]
# 0



# ----- (2)

# >> 2.divmod(2)
# => [1, 0]

# 1 1 # 0 x 2
# 2 # 1 x 2

# p climb_stairs(2) # 2

# ---- (3)

# >> 3.divmod(2)
# => [1, 1]

# 1 1 1 # 0 x 2
# 1 2 # 1 x 2
# 2 1

# p climb_stairs(3) # 3

# ----

# >> 4.divmod(2)
# => [2, 0]

# 1 1 1 1 # 0 x 2

# 1 1 2 # 1 x 2
# 1 2 1
# 2 1 1

# 2 2 # 2 x 2

p climb_stairs(4) == 5

#  ----

# >> 5.divmod(2)
# => [2, 1]

# 1 1 1 1 1 # 0 x 2

# 1 1 1 2 # 1 x 2
# 1 1 2 1
# 1 2 1 1
# 2 1 1 1

# 1 2 2 # 2 x 2
# 2 1 2
# 2 2 1

# p climb_stairs(5) == 8

# 1 1 1 1 1 1

# 1 1 1 1 2
# 1 1 1 2 1
# 1 1 2 1 1
# 1 2 1 1 1
# 2 1 1 1 1

# 1 1 2 2
# 1 2 1 2
# 2 1 1 2
# 1 2 2 1
# 2 1 2 1
# 2 2 1 1

# >> [1, 1, 1, 1, 1, 1].permutation.to_a.uniq
# => [[1, 1, 1, 1, 1, 1]]

# >> [1, 1, 1, 1, 2].permutation.to_a.uniq
# => [[1, 1, 1, 1, 2], [1, 1, 1, 2, 1], [1, 1, 2, 1, 1], [1, 2, 1, 1, 1], [2, 1, 1, 1, 1]]

# >> [1, 1, 2, 2].permutation.to_a.uniq
# => [[1, 1, 2, 2], [1, 2, 1, 2], [1, 2, 2, 1], [2, 1, 1, 2], [2, 1, 2, 1], [2, 2, 1, 1]]

# >> [2, 2, 2].permutation.to_a.uniq
# => [[2, 2, 2]]
