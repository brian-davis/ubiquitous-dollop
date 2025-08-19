require "benchmark"

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  result = ""
  shortest_length = strs.min_by { |str| str.length }.length
  (0).upto(shortest_length) do |i|
    common = strs.map { |str| str[i] }
    if common.uniq.size > 1
      break
    else
      result += common[0]
    end
  end
  return result
end

def longest_common_prefix2(strs)
  compare_str = strs.min_by { |str| str.length }
  compare_str.length.downto(0) do |i|
    compare_str = compare_str[0..i]
    return compare_str if strs.all? { |str| str.start_with?(compare_str) }
  end
  return ""
end

# strs = ["flower","flow","flight"]
# # puts longest_common_prefix(strs)
# # puts longest_common_prefix2(strs)

# # strs = ["dog", "racecar", "car"]
# # puts longest_common_prefix(strs)
# # puts longest_common_prefix2(strs)

# Benchmark.bm do |x|
#   x.report("v1") {
#     longest_common_prefix(strs)
#   }
#   x.report("v2") {
#     longest_common_prefix2(strs)
#   }
# end