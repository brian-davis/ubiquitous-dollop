# slow: won't scale to worst-cast scenario (huge array input)
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

# TODO: unsolved
def max_profit(prices)
  max_gains = 0
  verticals = prices.sort_by { |i| -i }.uniq

  verticals.each do |v|
    v_max_gains = 0
    max = v
    max_indexes = prices.each.with_object([]).with_index { |(e, a), i| a.push(i) if e == max }
    max_indexes.each do |max_i|
      max_i_max_gains = 0
      pre_min = prices[0...max_i].min

      max_i_max_gains += max - pre_min if pre_min

      post_max = prices[max_i+1..-1].max

      if post_max
        post_max_i = prices[max_i+1..-1].index(post_max) + max_i # TODO find all
        post_min = prices[max_i+1..post_max_i].min
        if post_min
          post_min_i = prices[max_i+1..post_max_i].index(post_min) + max_i # TODO find all
          max_i_max_gains += post_max - post_min if post_max_i > post_min_i
        end
      end
      v_max_gains = [v_max_gains, max_i_max_gains].max
    end

    max_gains = [max_gains, v_max_gains].max
  end

  return max_gains
end

e1 = [3,3,5,0,0,3,1,4]
#             b s b s
r1 = max_profit(e1)
puts r1
puts r1 == 6

e2 = [1,2,3,4,5]
r2 = max_profit(e2)
puts r2
puts r2 == 4

e3 = [7,6,4,3,1]
r3 = max_profit(e3)
puts r3
puts r3 == 0

e4 = [1,2,4,2,5,7,2,4,9,0]
r4 = max_profit(e4)
puts r4
puts r4 == 13

e5 = [2,1,2,0,1]
#       b s b s
r5 = max_profit(e5)
puts r5
puts r5 == 2

e6 = [3,2,6,5,0,3]
r6 = max_profit(e6)
puts r6
puts r6 == 2