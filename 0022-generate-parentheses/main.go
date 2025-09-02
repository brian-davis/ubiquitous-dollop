package main

import (
	"fmt"
	"math"
	"strings"
	"strconv"
)

func validParens(s string) bool {
	stack := []int{}
	left := "("
	right := ")"
	counter := 1

	for i := 0; i < len(s); i++ {
		c := s[i:i+1]
		var pop int
		if c == left {
			stack = append(stack, counter)
		} else if c == right {
			if len(stack) == 0 {
				return false
			}
			pop, stack = stack[len(stack)-1], stack[:len(stack)-1]
			if pop != counter {
				return false
			}
		}
	}
	if len(stack) > 0 {
		return false
	}
	return true
}

// beats 5%
func generateParenthesis(n int) []string {
	minVal := int(math.Pow(2, float64(n))) - 1
	maxVal := int(math.Pow(4, float64(n) )) / 3;
	_range := []int{}
	for i := minVal; i <= maxVal; i += 2 {
		_range = append(_range, i)
	}

	binaries := []string{}
	for _, e := range(_range) {
		b := strconv.FormatInt(int64(e), 2)
		b = strings.Repeat("0", ((n * 2) - len(b))) + b // left pad
		binaries = append(binaries, b)
	}

	filter_count := []string{}
	for _, e := range(binaries) {
		if strings.Count(e, "0") == strings.Count(e, "1") {
			filter_count = append(filter_count, e)
		}
	}

	map_replace := []string{}
	for _, e := range(filter_count) {
		e = strings.ReplaceAll(e, "0", "(")
		e = strings.ReplaceAll(e, "1", ")")
		map_replace = append(map_replace, e)
	}

	filter_valid := []string{}
	for _, e := range(map_replace) {
		if validParens(e) {
			filter_valid = append(filter_valid, e)
		}
	}

	return filter_valid
}

func main() {
	fmt.Println(generateParenthesis(4))
}