// beats 100%

package main

import (
	"fmt"
	"strings"
	"strconv"
)

// NextIndex sets ix to the lexicographically next value,
// such that for each i>0, 0 <= ix[i] < lens(i).
// https://stackoverflow.com/questions/29002724/implement-ruby-style-cartesian-produc
func NextIndex(ix []int, lens func(i int) int) {
    for j := len(ix) - 1; j >= 0; j-- {
        ix[j]++
        if j == 0 || ix[j] < lens(j) {
            return
        }
        ix[j] = 0
    }
}

func letterCombinations(digits string) []string {
	result := []string{}
	if (len(digits) == 0) {
		return result
	}

	letters := map[int][]string {
		0: []string{},
		1: []string{},
		2: []string{"a","b","c"},
		3: []string{"d","e","f"},
		4: []string{"g","h","i"},
		5: []string{"j","k","l"},
		6: []string{"m","n","o"},
		7: []string{"p","q","r", "s"},
		8: []string{"t","u","v"},
		9: []string{"w","x","y", "z"},
	}
	fmt.Println(letters);
	_digits := strings.Split(digits, "")
	fmt.Println(_digits);

	//
	digitsMap := make([][]string, len(_digits))
	for j, e := range(_digits) {
		i, _ := strconv.Atoi(e)
		ival := letters[i]
		fmt.Println(ival)
		digitsMap[j] = ival
	}

	// https://stackoverflow.com/questions/29002724/implement-ruby-style-cartesian-produc
	lens := func(i int) int { return len(digitsMap[i]) }
	for ix := make([]int, len(digitsMap)); ix[0] < lens(0); NextIndex(ix, lens) {
		var r []string
		for j, k := range ix {
			r = append(r, digitsMap[j][k])
		}
		result = append(result, strings.Join(r, ""))
	}

	return result
}

func main() {
	r := letterCombinations("23")
	fmt.Println(r)
}