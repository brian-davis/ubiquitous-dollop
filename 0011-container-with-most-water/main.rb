require "benchmark"

# brute force, time limit exceeded
def max_area(height)
  max_volume = 0
  for i in (0...height.length)
    left = height[i]
    for j in (i+1...height.length)
      right = height[j]

      lr_height = [left, right].min
      lr_width = j - i
      lr_volume = lr_height * lr_width
      max_volume = [max_volume, lr_volume].max
    end
  end
  return max_volume
end

# improved, time limit exceeded
def max_area2(height)
  max_volume = 0
  0.upto(height.length - 1) do |i|
    left = height[i]
    highest_lr = 0

    (height.length - 1).downto(i + 1) do |j|
      right = height[j]

      next if right < highest_lr
      highest_lr = right

      lr_height = [left, right].min
      lr_width = j - i
      lr_volume = lr_height * lr_width
      max_volume = [max_volume, lr_volume].max
    end
  end
  return max_volume
end

# improved, time limit exceeded
def max_area3(height)
  max_volume = 0
  highest_l = 0
  0.upto(height.length - 1) do |i|
    left = height[i]
    next if left < highest_l
    highest_l = left
    highest_lr = 0

    (height.length - 1).downto(i + 1) do |j|
      right = height[j]

      next if right < highest_lr
      highest_lr = right

      lr_height = [left, right].min
      lr_width = j - i
      lr_volume = lr_height * lr_width
      max_volume = [max_volume, lr_volume].max
    end
  end
  return max_volume
end

# top-down, beats 5%
def max_area4(heights)
  height_indexes = {}
  heights.each.with_index do |height, i|
    height_indexes[height] ||= []
    height_indexes[height] << i
  end
  puts "height_indexes: #{height_indexes.inspect}"
  max_height = heights.max
  puts "max_height: #{max_height.inspect}"
  max_vol = 0
  left_bound = nil
  right_bound = nil

  max_height.downto(0).each do |height|
    puts "height: #{height.inspect}"
    height_val = height_indexes[height]
    puts "height_val: #{height_val.inspect}"
    next unless height_val

    level_left_bound, level_right_bound = height_val.minmax
    puts "level_left_bound: #{level_left_bound.inspect}"
    puts "level_right_bound: #{level_right_bound.inspect}"

    left_bound ||= level_left_bound
    right_bound ||= level_right_bound
    right_bound = [level_right_bound, right_bound].max
    left_bound = [level_left_bound, left_bound].min

    puts "left_bound: #{left_bound.inspect}"
    puts "right_bound: #{right_bound.inspect}"

    width = right_bound - left_bound

    puts "width: #{width.inspect}"

    vol = width * height

    puts "vol: #{vol.inspect}"

    max_vol = [max_vol, vol].max

    puts "max_vol: #{max_vol.inspect}"
  end
  return max_vol
end

a = [1,8,6,2,5,4,8,3,7]
r = max_area4(a)
e = 49
puts r
puts r == e

# a = [1,1]
# r = max_area4(a)
# e = 1
# # puts r
# puts r == e

# a = [2,1]
# r = max_area4(a)
# e = 1
# # puts r
# puts r == e


# Benchmark.bm do |x|
#   a = [1,8,6,2,5,4,8,3,7]
#   x.report("v1") {
#     10.times { max_area(a) }
#   }

#   x.report("v2") {
#     10.times { max_area2(a) }
#   }

#   x.report("v3") {
#     10.times { max_area3(a) }
#   }

#   x.report("v4") {
#     10.times { max_area4(a) }
#   }
# end


# height_indexes: {1=>[0], 8=>[1, 6], 6=>[2], 2=>[3], 5=>[4], 4=>[5], 3=>[7], 7=>[8]}
# max_height: 8
# height: 8
# height_val: [1, 6]
# level_left_bound: 1
# level_right_bound: 6
# left_bound: 1
# right_bound: 6
# width: 5
# vol: 40
# max_vol: 40
# height: 7
# height_val: [8]
# level_left_bound: 8
# level_right_bound: 8
# left_bound: 1
# right_bound: 8
# width: 7
# vol: 49
# max_vol: 49
# height: 6
# height_val: [2]
# level_left_bound: 2
# level_right_bound: 2
# left_bound: 1
# right_bound: 8
# width: 7
# vol: 42
# max_vol: 49
# height: 5
# height_val: [4]
# level_left_bound: 4
# level_right_bound: 4
# left_bound: 1
# right_bound: 8
# width: 7
# vol: 35
# max_vol: 49
# height: 4
# height_val: [5]
# level_left_bound: 5
# level_right_bound: 5
# left_bound: 1
# right_bound: 8
# width: 7
# vol: 28
# max_vol: 49
# height: 3
# height_val: [7]
# level_left_bound: 7
# level_right_bound: 7
# left_bound: 1
# right_bound: 8
# width: 7
# vol: 21
# max_vol: 49
# height: 2
# height_val: [3]
# level_left_bound: 3
# level_right_bound: 3
# left_bound: 1
# right_bound: 8
# width: 7
# vol: 14
# max_vol: 49
# height: 1
# height_val: [0]
# level_left_bound: 0
# level_right_bound: 0
# left_bound: 0
# right_bound: 8
# width: 8
# vol: 8
# max_vol: 49
# height: 0
# height_val: nil
# 49
# true