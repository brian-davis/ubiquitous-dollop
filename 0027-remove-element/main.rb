# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}

# beats 100%
def remove_element(nums, val)
  # nums.delete(val)
  # nums.length

  count = 0
  for i in (0...nums.length)
    e = nums[i]
    if e == val || e.nil?
      j = nums[(i + 1)...nums.length].index { |f| !f.nil? && f != val }
      if j
        nextval = nums[i + j + 1]
        nums[i] = nextval; nums[i + j + 1] = nil
        count += 1
      elsif i == nums.length - 1
        nums[i] = nil
      else
        # next
      end
    else
      count += 1
    end
  end
  count
end

nums = [0,1,2,2,3,0,4,2]
val = 2
p remove_element(nums, val) == 5

nums = [3,2,2,3]
val = 3
p remove_element(nums, val) == 2