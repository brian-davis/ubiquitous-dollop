require "benchmark"

# convenient, brute force
# time out
def three_sum_closest1(nums, target)
  nums.combination(3).min_by do |combo|
    (target - combo.sum).abs
  end.sum
end

# convenient, brute force, improved
# time out
def three_sum_closest2(nums, target)
  closest_distance = nil
  closest_sum = nil
  nums.combination(3).each do |combo|
    sum = combo.sum
    distance = (target - sum).abs
    return sum if distance == 0
    # puts "combo: #{combo.inspect}; sum: #{sum}; distance: #{distance}"
    closest_distance ||= distance
    if distance <= closest_distance
      closest_distance = distance
      closest_sum = sum
    end
  end
  closest_sum
end

# brute force, improved, no convenience (slower!)
# time out
def three_sum_closest3(nums, target)
  closest_distance = nil
  closest_sum = nil
  for i in (0...(nums.length - 2)) do
    for j in ((i + 1)...(nums.length - 1)) do
      for k in ((j + 1)...nums.length) do
        combo = [nums[i], nums[j], nums[k]]
        sum = combo.sum
        distance = (target - sum).abs
        closest_distance ||= distance

        if distance == 0
          return sum
        elsif distance <= closest_distance
          closest_distance = distance
          closest_sum = sum
        end
      end
    end
  end
  closest_sum
end

# TODO

r = three_sum_closest1([-1, 2, 1, -4], 1)
# puts r
puts r == 2

r = three_sum_closest1([0, 0, 0], 1)
puts r == 0

r = three_sum_closest1([10,20,30,40,50,60,70,80,90], 1)
puts r == 60

r = three_sum_closest1([0,3,97,102,200], 300)
puts r == 300

Benchmark.bm do |x|
  x.report("v1") {
    three_sum_closest1([10,20,30,40,50,60,70,80,90], 1)
  }

  x.report("v2") {
    three_sum_closest2([10,20,30,40,50,60,70,80,90], 1)
  }

  x.report("v3") {
    three_sum_closest3([10,20,30,40,50,60,70,80,90], 1)
  }
end