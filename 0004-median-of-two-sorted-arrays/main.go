package main
import (
	"fmt"
	"sort"
)

func findMedianSortedArrays(nums1 []int, nums2 []int) float64 {
	merged := append(nums1, nums2...)
	sort.Ints(merged) // mutates

	if len(merged) % 2 == 1 {
		middleIndex := len(merged) / 2
		return float64(merged[middleIndex])
	} else {
		middleRIndex := len(merged) / 2
		middleLIndex := (len(merged) / 2) - 1
		middle2mean := float64(merged[middleRIndex] + merged[middleLIndex]) / 2.0
		return float64(middle2mean)
	}
}

func main() {
	nums1 := []int{1,3}
	nums2 := []int{2}
	r := findMedianSortedArrays(nums1, nums2)
	fmt.Println(r)
	fmt.Println(r == 2)

	nums1 = []int{1,2}
	nums2 = []int{3,4}
	r = findMedianSortedArrays(nums1, nums2)
	fmt.Println(r)
	fmt.Println(r == 2.5)
}