require "benchmark"

# beats 5%
def convert1(s, num_rows)
  return s if num_rows <= 1
  zig_zag = num_rows > 2 ? [:zig, :zag].cycle : [:zig].cycle
  chars = s.chars
  until chars.length % num_rows == 0
    chars.push("")
  end
  cols = []
  current_column = Array.new(num_rows) { "" }
  direction = zig_zag.next # start zig (down)
  row_index = 0
  until chars.empty?
    if direction == :zig
      # zig, stack chars on column
      current_column[row_index] = chars.shift
      if row_index == (num_rows - 1)
        cols.push(current_column)
        current_column = Array.new(num_rows) { "" }
        direction = zig_zag.next
        row_index -= 1
      else
        row_index += 1
      end
    else
      if row_index == 0
        # bounce down
        direction = zig_zag.next
        # next
      else
        # zag, every char gets its own column
        current_column[row_index] = chars.shift
        cols.push(current_column)
        current_column = Array.new(num_rows) { "" }
        row_index -= 1
      end
    end
  end
  cols.push(current_column)
  return cols.transpose.map(&:join).join
end

# faster, beats 57%
def convert2(s, num_rows)
  return s if num_rows <= 1
  grid_length = s.length + (num_rows - (s.length % num_rows))
  str = s.ljust(grid_length)
  rows = Array.new(num_rows) { "" }
  row_index = 0
  increment = 1 # down
  str.each_char do |c|
    rows[row_index] << c
    row_index += increment
    if row_index == (num_rows - 1) || row_index == 0
      increment *= -1 # toggle
    end
  end
  rows.map(&:strip).join
end

TESTS = [
  ["PAYPALISHIRING", 3, "PAHNAPLSIIGYIR"],
  ["PAYPALISHIRING", 4, "PINALSIGYAHRPI"], # PAYP .AL. ISHI .RI. NG..
  ["AB", 1, "AB"],
  ["ABC", 1, "ABC"],
  ["ABC", 2, "ACB"],
  ["ABCD", 2, "ACBD"],
  ["ABCDE",2,"ACEBD"],
  ["ABCDE",3,"AEBDC"]
]

# puts convert2(TESTS[1][0], TESTS[1][1]) == TESTS[1][2]

TESTS.each do |a, b, c|
  r = convert2(a, b)
  # puts r
  puts r == c
end

Benchmark.bm do |x|
  x.report("v1") {
    10.times {
      TESTS.each { |t|
        a,b,_ = t
        convert1(a, b)
      }
    }
  }

  x.report("v2") {
    10.times {
      TESTS.each { |t|
        a,b,_ = t
        convert2(a, b)
      }
    }
  }
end