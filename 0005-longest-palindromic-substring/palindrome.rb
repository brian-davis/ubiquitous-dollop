require "benchmark"

def palindrome?(str)
  str == str.reverse
end

def palindrome2?(str)
  half = str.length / 2
  front = if half.even?
    str[0..(half - 1)]
  else
    str[0..(half)]
  end
  # puts front
  back = str[half..-1]
  # puts back
  front.reverse == back
end

def palindrome3?(str)
  0.upto(str.length/2) do |i|
    return false unless str[i] == str[-1 * (i + 1)]
  end
  true
end

def palindrome4?(str)
  (str.length / 2 - 1).downto(0) do |i|
    a = str[i]
    b = str[-1 * (i + 1)]
    # puts "a: #{a}; b: #{b}"
    return false unless a == b
  end
  true
end

def palindrome5?(str)
  reversed = ""
  (str.length - 1).downto(0).each do |i|
    reversed << str[i]
  end
  reversed == str
end

puts !palindrome5?("abcdefghijklmnopqrstuvwxyz")
puts
puts palindrome5?("racecar")
puts
puts palindrome5?("bob")
puts
puts palindrome5?("boob")

Benchmark.bm do |x|
  strs = ["a", "bb", "ccc", "dddd", "eeeee", "ffffff", "ggggggg", "hhhhhhhh"]

  x.report("palindrome?") {
    100.times {
      palindrome?(strs.sample)
    }
  }

  x.report("palindrome2?") {
    100.times {
      palindrome2?(strs.sample)
    }
  }

  x.report("palindrome3?") {
    100.times {
      palindrome3?(strs.sample)
    }
  }

  x.report("palindrome4?") {
    100.times {
      palindrome4?(strs.sample)
    }
  }

  x.report("palindrome5?") {
    100.times {
      palindrome5?(strs.sample)
    }
  }
end