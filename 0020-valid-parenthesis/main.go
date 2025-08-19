package main

import ("fmt")
import ("strings")

func indexOf(strs []string, e string) int {
  for i, v := range strs {
		if v == e {
			return i
		}
	}
	return -1
}

func isValid(s string) bool {
  if len(s) <= 1 { return false }
	leftParens := []string{"{", "[", "("}
	rightParens := []string{"}", "]", ")"}
	allParens := strings.Split(s, "")
	var stack []string
	var e string
	var stackLast string
	for len(allParens) > 0 {
		e, allParens = allParens[0], allParens[1:len(allParens)]
    rIndex := indexOf(rightParens, e) // shift
		if len(stack) == 0 {
			stackLast = "NULL"
		} else {
			stackLast =  stack[len(stack) - 1]
		}

		if rIndex != -1 && stackLast == leftParens[rIndex] {
			stack = stack[0:len(stack)-1] // pop
  	} else {
			stack = append(stack, e) // push
		}
	}
	return len(stack) == 0
}

func main() {
	// e1 := "()"
	// fmt.Println(isValid(e1)) // true

	// e2 := "()[]{}"
	// fmt.Println(isValid(e2)) // true

	// e3 := "(]"
	// fmt.Println(isValid(e3)) // false

	// e4 := "([])"
	// fmt.Println(isValid(e4)) // true

	// e5 := "([]){[()[]]}"
	// fmt.Println(isValid(e5)) // true

	// e6 := "}"
	// fmt.Println(isValid(e6)) // false

	// e7 := "(){}}{"
	// fmt.Println(isValid(e7)) // false

	// e8 := "([)]"
	// fmt.Println(isValid(e8)) // false

	// e9 := ")(){}"
	// fmt.Println(isValid(e9)) // false

	e10 := "(])"
	fmt.Println(isValid(e10)) // false
}