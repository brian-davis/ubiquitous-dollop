
package main
import ("fmt")
import ("math")
// From python algorithm editorial: https://leetcode.com/problems/reverse-integer/editorial/?page=3
func reverse(x int) int {
	sign := 1
	if x < 0 {
		sign = -1
	}
	rev := 0
	x = int(math.Abs(float64(x)))
	for x != 0 {
		mod := x % 10
		x = (x - mod) / 10
		rev = (rev * 10) + mod
		_max := int(math.Pow(2, 31) - 1)
		if rev > _max {
			return 0
		}
	}
	return sign * rev
}

func main() {
	a := 123
	r := reverse(a)
	e := 321
	fmt.Println(r == e)

	a = -123
	r = reverse(a)
	e = -321
	fmt.Println(r == e)
}