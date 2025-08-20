def find_median_sorted_arrays(nums1, nums2)
  merged = (nums1 + nums2).sort
  # mean = merged.sum / merged.length.to_f
  if merged.length.odd?
    middle_i = merged.length / 2
    return merged[middle_i]
  else
    middle_r_i = merged.length / 2
    middle_l_i = (merged.length / 2) - 1
    return (merged[middle_r_i] + merged[middle_l_i]) / 2.0
  end
end

nums1 = [1,3]
nums2 = [2]
r = find_median_sorted_arrays(nums1, nums2)
puts r == 2.0

# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.

nums1 = [1,2]
nums2 = [3,4]
r = find_median_sorted_arrays(nums1, nums2)
puts r == 2.5

# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

nums1 = [2,2,4,4]
nums2 = [2,2,2,4,4]
r = find_median_sorted_arrays(nums1, nums2)
puts r == 2.0