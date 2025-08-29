require "benchmark"

# worst-case times out
def three_sum1(nums)
  sums = nums.combination(3).each.with_object([]) do |perm, acc|
    perm_sort = perm.sort
    if perm_sort.sum == 0 && !acc.include?(perm_sort)
      acc.unshift(perm_sort)
    end
  end
  sums
end

def three_sum2(nums)
  tracker = Hash.new { 0 }
  sums = []
  for _a in (0...nums.length - 2) do
    a = nums[_a]
    for _b in ((_a + 1)...nums.length - 1) do
      b = nums[_b]
      for _c in ((_b + 1)...nums.length) do
        c = nums[_c]
        if (a + b + c) == 0
          # puts "a: #{a}; b: #{b}; c: #{c}"
          sorted = [a,b,c].sort
          sums.unshift(sorted) if tracker[sorted] < 1
          tracker[sorted] += 1
        end
      end
    end
  end
  sums
end

def three_sum3(nums)
  tracker = Hash.new { 0 }
  for _a in (0...nums.length - 2) do
    a = nums[_a]
    for _b in ((_a + 1)...nums.length - 1) do
      b = nums[_b]
      for _c in ((_b + 1)...nums.length) do
        c = nums[_c]
        if (a + b + c) == 0
          sorted = [a,b,c].sort
          tracker[sorted] += 1
        end
      end
    end
  end
  tracker.keys
end

def three_sum4(nums)
  tracker = Hash.new { 0 }
  _nums = nums.sort
  for _a in (0..._nums.length - 2) do
    a = _nums[_a]
    for _b in ((_a + 1)..._nums.length - 1) do
      b = _nums[_b]
      for _c in ((_b + 1)..._nums.length) do
        c = _nums[_c]
        if (a + b + c) == 0
          tracker[[a,b,c]] += 1
        end
      end
    end
  end
  tracker.keys
end

# time out
def three_sum5(nums)
  tracker = Hash.new { 0 }
  _nums = nums.sort
  for _a in (0..._nums.length - 2) do
    a = _nums[_a]
    b_tracker = Hash.new
    for _b in ((_a + 1)..._nums.length - 1) do
      b = _nums[_b]
      next if b_tracker[b]
      b_tracker[b] = 1
      skip_c = false
      for _c in ((_b + 1)..._nums.length) do
        next if skip_c
        c = _nums[_c]
        if (a + b + c) == 0
          tracker[[a,b,c]] += 1

          skip_c = true
        end
      end
    end
  end
  tracker.keys
end

# # TODO
# def three_sum6(nums)
#   r = []
#   _nums = nums.sort

#   # [-4, -1, -1, 0, 1, 2]
#   puts _nums.inspect
#   return r
# end

a1 = [-1,0,1,2,-1,-4]
a2 = [0,1,1]
a3 = [0,0,0]

r = three_sum6(a1)
e = [[-1,-1,2],[-1,0,1]]
puts r.inspect
puts r == e

# r = three_sum5(a2)
# e = []
# # puts r.inspect
# puts r == e

# r = three_sum5(a3)
# e = [[0,0,0]]
# # puts r.inspect
# puts r == e

# Benchmark.bm do |x|
#   x.report("v1") {
#     [a1, a2, a3].each do |a|
#       three_sum1(a)
#     end
#   }

#   x.report("v2") {
#     [a1, a2, a3].each do |a|
#       three_sum2(a)
#     end
#   }

#   x.report("v3") {
#     [a1, a2, a3].each do |a|
#       three_sum3(a)
#     end
#   }

#   x.report("v4") {
#     [a1, a2, a3].each do |a|
#       three_sum4(a)
#     end
#   }

#   x.report("v5") {
#     [a1, a2, a3].each do |a|
#       three_sum5(a)
#     end
#   }
# end