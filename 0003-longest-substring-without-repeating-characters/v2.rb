require "benchmark"
# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  max_length = 0
  schars = s.chars
  catch :longest do
    max_slice = [s.length, 95].min # 128? 95?
    (max_slice).downto(1) do |slice_length|
      schars.each_cons(slice_length) do |slice|
        if slice.length == slice.uniq.length
          max_length = slice.length
          throw :longest
        end
      end
    end
  end
  return max_length
end

# slower!
def length_of_longest_substring2(s)
  max_length = 0
  catch :longest do
    max_slice = [s.length, 95].min # 128? 95?
    (max_slice).downto(0) do |slice_length|
      diff = s.length - slice_length
      diff.times do |offset|
        slice = s[offset..offset+slice_length]
        if slice.length == slice.chars.uniq.length
          max_length = slice.length
          throw :longest
        end
      end
    end
  end
  return max_length
end

# passes
def length_of_longest_substring3(s)
  # puts "s: #{s}"
  char_count = {}
  current_chars = []
  max_length = 0

  sc = s.chars
  sc.each do |c|
    # puts
    # puts "c: #{c}"
    if char_count[c]
      # puts "dup!"
      # c_i = char_count[c]
      c_i = current_chars.index(c)
      # puts "c_i: #{c_i}"
      # binding.irb if i == 4
      _current_chars = current_chars[(c_i + 1)..-1]
      # puts "_current_chars: #{_current_chars}"
      _prev_chars = current_chars[0..c_i]
      # puts "_prev_chars: #{_prev_chars}"
      _prev_l = _prev_chars.length
      # puts "_prev_l: #{_prev_l}"
      max_length = [max_length, _prev_l, current_chars.length].max
      current_chars = (_current_chars || [])
      _prev_chars.each { |c| char_count.delete(c) }
    end
    char_count[c] = 1
    current_chars.push(c)
    # puts "current_chars: #{current_chars}"
  end
  max_length = [max_length, current_chars.length].max
  return s.length if max_length == 0
  max_length
end

e489 = "bbtablud"
#       ..++++++
r489 = length_of_longest_substring3(e489)
puts r489
puts r489 == 6

e357 = "abcb"
r357 = length_of_longest_substring3(e357)
puts r357
puts r357 ==3

e408 = "dvdf"
r408 = length_of_longest_substring3(e408)
puts r408
puts r408 == 3

e1b = "zbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwltwjwnnvbwjckdmeouuzhyvhg"
r1b = length_of_longest_substring3(e1b)
puts r1b
puts r1b == 13

e0 = "abcde"
r0 = length_of_longest_substring3(e0)
puts r0
puts r0 == 5

e1 = "abcabcbb"
r1 = length_of_longest_substring3(e1)
# Explanation: The answer is "abc", with the length of 3.
puts r1
puts r1 == 3

e3 = "pwwkew"
r3 = length_of_longest_substring3(e3)
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
puts r3
puts r3 == 3 # 2

e4 = "aab"
r4 = length_of_longest_substring3(e4)
puts r4
puts r4 == 2 # 1

e2 = "bbbbb"
r2 = length_of_longest_substring3(e2)
# Explanation: The answer is "b", with the length of 1.
puts r2
puts r2 == 1

e1 = "abcabcbb"
Benchmark.bm do |x|
  x.report("v1") {
    100.times { length_of_longest_substring(e1) }
  }

  x.report("v2") {
    100.times { length_of_longest_substring2(e1) }
  }

  x.report("v3") {
    100.times { length_of_longest_substring3(e1) }
  }
end