require "benchmark"

def generate(num_rows)
  result = []
  (0..num_rows-1).each do |row_i|
    row_length = row_i
    row = [1]
    if row_i > 0
      row << row_i
    end
    (0..row_length).each do |i|
      if row[i]
        # next
      elsif i > row_length / 2
        row << row[(i - row_length).abs]
      else
        row << result[row_i -1][i-1] + result[row_i -1][i]
      end
    end
    result << row
  end
  result
end

# # arg1 = 1
# # expect1 = [[1]]
# # result1 = generate(arg1)
# # p result1
# # p result1 == expect1

# # arg3 = 3
# # expect3 = [[1],[1,1],[1,2,1]]
# # result3 = generate(arg3)
# # p result3
# # p result3 == expect3

# arg2 = 6
# # expect2 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
# result2 = generate(arg2)
# p result2
# # p result2 == expect2


# [
#   [1],        # i.1; l.1; l/2 = 0
#   [1,1],      # i.2; l.2; l/2 = 1
#   [1,2,1],    # i.3; l.3; l/2 = 1
#   [1,3,3,1],  # i.4; l.4; l/2 = 2
#   [1,4,6,4,1] # i.5; l.5; l/2 = 2
# ]

# #      1
# #     1 1
# #    1 2 1
# #   1 3 3 1
# #  1 4 6 4 1
# # 1 5 10 10 5 1



# # [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]

# slower
def generate2(num_rows)
  result = []
  (0..num_rows-1).each do |i|
    if i == 0
      new_row = [1]
      result << new_row
    elsif i == 1
      new_row = [1, 1]
      result << new_row
    else
      prev_row = result[i - 1]
      new_row = Array.new(i+1) # row length == row 1-index
      new_row[0] = 1
      new_row[-1] = 1
      prev_row.each_cons(2) do |a,b|
        new_row[new_row.index(nil)] = a + b
      end
      result << new_row
    end
  end
  result
end

# best
def generate3(num_rows)
  result = []
  (0..num_rows-1).each do |i|
    new_row = []
    prev_row = result[i - 1]
    (0..i).each do |j|
      if j == 0 || j == i
        new_row << 1
      elsif prev_row
        new_row << prev_row[j - 1] + prev_row[j]
      end
    end
    result << new_row
  end
  result
end

# p generate3(6)

Benchmark.bm do |x|
  x.report("v1") {
    r1 = generate(10)
  }

  x.report("v2") {
    r2 = generate2(10)
  }

  x.report("v3") {
    r2 = generate3(10)
  }
end