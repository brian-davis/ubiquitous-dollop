func removeDuplicates(nums []int) int {
  uniqCounter := 0
	for i := 0; i < len(nums); i++ {
		_current := nums[i]
		_prev := -1 // dummy
        if i > 0 {
		  _prev = nums[i - 1]
		}

		if i == 0 || _current != _prev {
			nums[uniqCounter] = _current;
			uniqCounter += 1
		}
	}
	return uniqCounter
}