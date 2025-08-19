package main

import (
	"fmt"
)

func plusOne(digits []int) []int {
  var result []int
	carry := 1
	for i := (len(digits) - 1); i >= 0; i-- {
		dd := digits[i]
		dd = dd + carry
		carry = dd / 10 // integer division quotient
		dd = dd % 10
		result = append([]int{dd}, result...) // unshift
	}

	if carry > 0 {
		result = append([]int{carry}, result...) // unshift
	}

	return result
}

func main() {
	e1 := []int{1,2,3}
	fmt.Println(plusOne(e1))

	e2 := []int{4,3,2,1}
	fmt.Println(plusOne(e2))

	e3 := []int{9}
	fmt.Println(plusOne(e3))

	e4 := []int{9,9,9}
	fmt.Println(plusOne(e4))
}