var removeDuplicates = function(nums) {
  let uniqCounter = 0;
  for (let i = 0; i < nums.length; i++) {
    let _current = nums[i];
    let _prev = nums[i - 1];
    if (i === 0 || _current != _prev) {
      nums[uniqCounter] = _current;
      uniqCounter += 1;
    }
  }
  return uniqCounter;
};