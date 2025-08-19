require 'benchmark'

def max_profit(prices)
  max_gains = 0
  0.upto(prices.length - 1) do |i|
    (i+1).upto(prices.length - 1) do |j|
      a = prices[i..j]
      b = prices[j+1..-1]
      # puts "a: #{a}; b: #{b}"
      gains = [a, b].map do |arr|
        if (arr.length <= 1)
          0
        else
          first = arr.shift
          rmax = arr.max
          rmax - first
        end
      end
      # puts "gains: #{gains}; sum: #{gains.sum}"
      max_gains = [max_gains, gains.sum].max
      # puts
    end
    # puts
  end
  # puts "max_gains: #{max_gains}"
  return max_gains
end

# same algo as v1, no allocated arrays
def max_profit2(prices)
  max_gains = 0
  0.upto(prices.length - 1) do |i|
    (i+1).upto(prices.length - 1) do |j|
      a_gains = begin
        first = prices[i]
        rmax = 0
        (i+1).upto(j) do |ii|
          c = prices[ii]
          rmax = c if c > rmax
        end
        rmax - first
      end

      b_gains = if (j + 1 >= prices.length - 1)
        0
      else
        first = prices[j + 1]
        rmax = 0
        (j + 2).upto(prices.length - 1) do |jj|
          c = prices[jj]
          rmax = c if c > rmax
        end
        rmax - first
      end
      max_gains = [max_gains, (a_gains + b_gains)].max
    end
  end
  return max_gains
end

# e1 = [3,3,5,0,0,3,1,4]
# r1 = max_profit(e1)
# puts r1
# puts r1 == 6

# e2 = [1,2,3,4,5]
# r2 = max_profit(e2)
# puts r2
# puts r2 == 4

# e3 = [7,6,4,3,1]
# r3 = max_profit(e3)
# puts r3
# puts r3 == 0

# e4 = [1,2,4,2,5,7,2,4,9,0]
# r4 = max_profit(e4)
# puts r4
# puts r4 == 13

be = [1,2,4,2,5,7,2,4,9,0]
Benchmark.bm do |x|
  x.report("v1") {
    10.times { max_profit(be) }
  }

  x.report("v2") {
    10.times { max_profit2(be) }
  }
end

#         user     system      total        real
# v1  0.000345   0.000010   0.000355 (  0.000350)
# v2  0.000206   0.000000   0.000206 (  0.000206)