require "benchmark"


Benchmark.bm do |x|
  # faster
  x.report("v1") {
    a = []
    ('a'..'z').each do |c|
      a.unshift(c)
    end
    r = a.join
    puts r
  }

  x.report("v2") {
    a = []
    ('a'..'z').each do |c|
      a.push(c)
    end
    r = a.reverse.join
    puts r
  }
end