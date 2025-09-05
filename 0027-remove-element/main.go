package main
import ("fmt")

// beats 100%
func removeElement(nums []int, val int) int {
  count := 0
	for i := 0; i < len(nums); i++ {
		e := nums[i]

		// 0 <= nums[i] <= 50
		// -1 is nil
		if e == val || e == -1 {
			rest := nums[(i + 1):len(nums)]

			nextValIndex := -1
			out:
			for ii := 0; ii < len(rest); ii++ {
				ee := rest[ii]
				if ee != -1 && ee != val {
					nextValIndex = ii
					break out
				}
			}

			if nextValIndex != -1 {
				nextVal := nums[i + nextValIndex + 1]
				nums[i] = nextVal
				nums[i + nextValIndex + 1] = -1 // nil
				count += 1
			} else if i == len(nums) - 1 {
				nums[i] = -1
			} else {
				// next
			}
		} else {
			count += 1
		}
	}
	return count
}

func main () {
	nums := []int{3,2,2,3};
	val := 3;
	r := removeElement(nums, val)
	fmt.Println(r == 2)
}