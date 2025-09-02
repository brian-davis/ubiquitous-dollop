require "benchmark"

def valid_parens(str, bin_style=false)
  stack = []
  left = bin_style ? "0" : "("
  right = bin_style ? "1" : ")"
  counter = 1

  str.each_char do |c|
    if c == left
      stack.push(counter)
    elsif c == right
      return false unless stack.pop
    end
  end
  return false unless stack.empty?
  true
end

# time out
def generate_parenthesis1(n)
  seed = "()" * n
  seed.chars.permutation(n*2).map(&:join).uniq.select { |str| valid_parens(str) }
end

# beats 5%
def generate_parenthesis2(n)
  minval = 2 ** n - 1 # inclusive
  # maxval = 4 ** n / 2 - 1 # max by place value
  maxval = (4 ** n) / 3 # max by observation
  r = (minval..maxval).step(2) # all end in 1, odd
    .map { |e| e.to_s(2) }
    .select { |s| s.count("1") == n }
    .map { |e| e.rjust(n * 2, "0") } # all start with 0; faster than sprintf
    .select { |s| valid_parens(s, true) }
    .map { |s| s.gsub("0", "(").gsub("1", ")") }
  r
end

# slower
def generate_parenthesis3(n)
  minval = 2 ** n - 1 # inclusive
  maxval = (4 ** n) / 3 # max by observation
  formatter =  "%0#{2 * n}b"
  r = (minval..maxval).step(2) # all end in 1, odd
    .map { |e| formatter % e }
    .select { |s| s.count("0") == s.count("1") }
    .map { |s| s.gsub("0", "(").gsub("1", ")") }
    .select { |s| valid_parens(s) }

  r
end

r1 = generate_parenthesis1(1)
r2 = generate_parenthesis3(1)
e = ["()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort
# [1]

r1 = generate_parenthesis1(2)
r2 = generate_parenthesis3(2)
e = ["(())", "()()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort
# [3, 5]

r1 = generate_parenthesis1(3)
r2 = generate_parenthesis3(3)
e = ["((()))","(()())","(())()","()(())","()()()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort
# [7, 11, 13,      19, 21]
#    9       15 17

r1 = generate_parenthesis1(4)
r2 = generate_parenthesis3(4)
e = ["(((())))","((()()))","((())())","((()))()","(()(()))","(()()())","(()())()","(())(())","(())()()","()((()))","()(()())","()(())()","()()(())","()()()()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort
# [15, 23, 27, 29, 39, 43, 45, 51, 53, 71, 75, 77, 83, 85]

r2 = generate_parenthesis3(5)
# [31, 47, 55, 59, 61, 79, 87, 91, 93, 103, 107, 109, 115, 117, 143, 151, 155, 157, 167, 171, 173, 179, 181, 199, 203, 205, 211, 213, 271, 279, 283, 285, 295, 299, 301, 307, 309, 327, 331, 333, 339, 341]


Benchmark.bm do |x|
  x.report("v1") {
    10.times {
      generate_parenthesis1(4)
    }
  }

  x.report("v2") {
    10.times {
      generate_parenthesis2(4)
    }
  }

  x.report("v3") {
    10.times {
      generate_parenthesis3(4)
    }
  }
end