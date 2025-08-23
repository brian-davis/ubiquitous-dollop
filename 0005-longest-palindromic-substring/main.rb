require "benchmark"

# Brute-force, convenient, slowest
def longest_palindrome(s)
  s.length.downto(1) do |i|
    s.chars.each_cons(i) do |cc|
      if cc.reverse == cc
        return cc.join
      end
    end
  end
end

# optimized version of above brute-force algorithm, times out.
def longest_palindrome2(s)
  sl = s.length
  sl.downto(2) do |cons_length|
    (0).upto(sl - cons_length) do |j|
      cons = s[j..(j + cons_length - 1)]
      if cons.reverse == cons
        return cons
      end
    end
  end
  return s[0]
end

# algo from Leetcode (editorial)[https://leetcode.com/problems/longest-palindromic-substring/solutions/3598120/longest-palindromic-substring/?page=3], ported from JS
# brute-force, as above, with better palindrome-check function, actually slower by benchmarks (ruby string.reverse function very fast, probably optimized C implementation).
def longest_palindrome4(s)
  is_palindrome = lambda { |i, j|
    left = i
    right = j - 1
    while left < right do
      return false if s[left] != s[right]
      left += 1
      right -= 1
    end
    return true
  }

  sl = s.length
  sl.downto(1).each do |length|
    0.upto(sl - length) do |start|
      spl = start + length
      if is_palindrome.(start, spl)
        return s[start...spl]
      end
    end
  end
end

# "DP" algorithm, based off of [this](https://leetcode.com/problems/longest-palindromic-substring/solutions/474664/commented-clean-python-dp-solution/?page=3) Python solution. Best-case example only marginally faster, worst-cast much slower
# TODO: still times out in worst case scenario (all same chars). Find _better_ DP algo.
def longest_palindrome3(s)
  s_len = s.length

  # Form a bottom-up dp 2d array
  # dp[i][j] will be 'true' if the string from index i to j is a palindrome.
  dp = Array.new(s_len) {
    Array.new(s_len) {
      false
    }
  }
  longest = ''

  # every string with one character is a palindrome
  0.upto(s_len - 1) do |i|
    dp[i][i] = true # diagonal
    longest = s[i] # each char
  end

  max_len = 1
  (s_len - 2).downto(0) do |_start|
    (_start + 1).upto(s_len - 1) do |_end|
      # puts "_start: #{_start}; _end: #{_end}"
      if (s[_start] == s[_end]) &&
         (_end - _start == 1 || dp[_start + 1][_end - 1])

        dp[_start][_end] = true
        if max_len < _end - _start + 1
          max_len = _end - _start + 1
          longest = s[_start.._end]
        end
      end
    end
  end

  longest
end

# DP algorithm, based off of Leetcode (editorial)[https://leetcode.com/problems/longest-palindromic-substring/solutions/3598120/longest-palindromic-substring/?page=3], ported from JS
# Actually slower than brute force in worst-case scenario (in Ruby, using String#reverse method)
def longest_palindrome5(s)
  n = s.length
  dp = Array.new(n) {
    Array.new(n) {
      false
    }
  }
  ans = [0,0]

  for i in (0...n) do
    dp[i][i] = true
  end

  for i in (0...(n - 1)) do
    if s[i] == s[i + 1]
      dp[i][i + 1] = true
      ans = [i, i + 1]
    end
  end

  for diff in (2...n) do
    for i in (0...(n - diff)) do
      j = i + diff
      if s[i] === s[j] && dp[i + 1][j - 1]
        dp[i][j] = true
        ans = [i, j]
      end
    end
  end

  i, j  = ans

  # s.slice(i, (j + 1 - i))
  s[i..j]
end

# Algorithm 3, based off of Leetcode (editorial)[https://leetcode.com/problems/longest-palindromic-substring/solutions/3598120/longest-palindromic-substring/?page=3], ported from JS
# fastest, passes
def longest_palindrome6(s)
  expand = -> (left, right) {
    while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
    end

    # left, right are 1 over limit
    s[left+1...right]
  }

  ans = ""

  for i in (0...s.length) do
    odd = expand.call(i, i)
    even = expand.call(i, i + 1)

    # ans = [ans, odd, even].max_by(&:length)
    ans = odd if odd.length > ans.length
    ans = even if even.length > ans.length
  end

  ans
end


# Benchmark.bm do |x|
#   str = ["cstgvkbrxacmpxdxxktktvpdzcuxmnhvuxdgsmskgeeawzeikhtmhdvnccbrgifpzmiuytfmeyfoxsntrdtxeuxcqsndexbgfxnthqwveujqzemloooyddparbjcuiwpopjwvvmwblsamkhjhlnoxinkpsempexmipifsfwzxbetgvfnkngzxcpizwctpdlpngjpyovmjllxfiwktghkxvyelwjwdztujmunijfsfdvmhgqhlpouewgyznphlmccjmqaqncwbeqheohibafqfunfywmrvqvjygjwqoclijwkcfiuaiymeagdbwyejnvtosxylptbtyoahfzfmwzrkhzdamknleroffmsqcaryibamgdpcumlhrblypddzhaxfeztokgogzgvpfvlmetiwsamhdidmvxavleryfyakendwrbslcavlqkerrnvpuzhdgwzuyorxzbkzhxhpbvkflgxouvaavxrdzsjlgrmogzvlhhdidldsxqhrqlryaanffhxnutcycnczuedtrwcnfiqrtoafvdfnfhxhyjivzalozrbrajboecfyalisxxanduzraqdrbzsbkobaieqpzcawrunxucypqyjnmrlrlivrrwwhdpekeelsphhunzbhkkejvqfopjsuholutgmtnleqdrntbqgrobnuhqpdkbjtikijkdiwqvnxgajaaqgswrdamzv", "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"]

#   # x.report("v2") {
#   #   1.times { longest_palindrome2(str[0]); longest_palindrome2(str[1]); longest_palindrome2(str[2]) }
#   # }

#   # x.report("v3") {
#   #   1.times { longest_palindrome3(str[0]); longest_palindrome3(str[1]); longest_palindrome3(str[2]) }
#   # }

#   # x.report("v4") {
#   #   1.times { longest_palindrome4(str[0]); longest_palindrome4(str[1]); longest_palindrome4(str[2]) }
#   # }

#   # x.report("v5") {
#   #   1.times { longest_palindrome5(str[0]); longest_palindrome5(str[1]); longest_palindrome5(str[2]) }
#   # }

#   x.report("v6") {
#     1.times { longest_palindrome6(str[0]); longest_palindrome6(str[1]); longest_palindrome6(str[2]) }
#   }
# end

s = "babad"
r = longest_palindrome6(s)
e = "bab"
# puts r.inspect
puts r == e || r == "aba"

# s = "cbbd"
# r = longest_palindrome6(s)
# e = "bb"
# # puts r.inspect
# puts r == e

# s = "abc"
# r = longest_palindrome6(s)
# # puts r.inspect
# puts r == "a" || r == "b" || r == "c"

# s = "abbcdef"
# r = longest_palindrome6(s)
# e = "bb"
# # puts r.inspect
# puts r == e


# s = "racecar"
# r = longest_palindrome6(s)
# e = s
# # puts r.inspect
# puts r == e

# s =
# "cstgvkbrxacmpxdxxktktvpdzcuxmnhvuxdgsmskgeeawzeikhtmhdvnccbrgifpzmiuytfmeyfoxsntrdtxeuxcqsndexbgfxnthqwveujqzemloooyddparbjcuiwpopjwvvmwblsamkhjhlnoxinkpsempexmipifsfwzxbetgvfnkngzxcpizwctpdlpngjpyovmjllxfiwktghkxvyelwjwdztujmunijfsfdvmhgqhlpouewgyznphlmccjmqaqncwbeqheohibafqfunfywmrvqvjygjwqoclijwkcfiuaiymeagdbwyejnvtosxylptbtyoahfzfmwzrkhzdamknleroffmsqcaryibamgdpcumlhrblypddzhaxfeztokgogzgvpfvlmetiwsamhdidmvxavleryfyakendwrbslcavlqkerrnvpuzhdgwzuyorxzbkzhxhpbvkflgxouvaavxrdzsjlgrmogzvlhhdidldsxqhrqlryaanffhxnutcycnczuedtrwcnfiqrtoafvdfnfhxhyjivzalozrbrajboecfyalisxxanduzraqdrbzsbkobaieqpzcawrunxucypqyjnmrlrlivrrwwhdpekeelsphhunzbhkkejvqfopjsuholutgmtnleqdrntbqgrobnuhqpdkbjtikijkdiwqvnxgajaaqgswrdamzv"

# r = longest_palindrome6(s)
# e = "vaav"
# # puts r.inspect
# puts r == e


# s = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

# r = longest_palindrome6(s)
# e = r
# # puts r.inspect
# puts r == e

# s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

# r = longest_palindrome6(s)
# # puts r.inspect
# e = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
# puts r == e