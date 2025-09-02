require "benchmark"

def valid_parens(str)
  stack = []
  left = "("
  right = ")"
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
  # binary string of length 2n starting with 0 after rjust, ending in 1
  maxval = 4 ** n / 2 - 1
  (1..maxval).step(2) # all end in 1, odd
    .map { |e| e.to_s(2) }
    .select { |s| s.count("1") == n }
    .map { |e| e.rjust(n * 2, "0") } # all start with 0
    .map { |s| s.gsub("0", "(").gsub("1", ")") }
    .select { |s| valid_parens(s) }
end

r1 = generate_parenthesis1(1)
r2 = generate_parenthesis2(1)
e = ["()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort

r1 = generate_parenthesis1(2)
r2 = generate_parenthesis2(2)
e = ["(())", "()()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort

r1 = generate_parenthesis1(3)
r2 = generate_parenthesis2(3)
e = ["((()))","(()())","(())()","()(())","()()()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort

r1 = generate_parenthesis1(4)
r2 = generate_parenthesis2(4)
e = ["(((())))","((()()))","((())())","((()))()","(()(()))","(()()())","(()())()","(())(())","(())()()","()((()))","()(()())","()(())()","()()(())","()()()()"]
puts e - r1 == [] && e - r2 == [] && r1.sort == r2.sort

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
end