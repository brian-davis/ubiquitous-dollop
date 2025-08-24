package main
import (
	"fmt"
	"strings"
)

// beats 44%
func convert(s string, numRows int) string {
	if numRows <= 1 {
		return s
	}

	rows := make([]string, numRows) // default ""
	rowIndex := 0
	increment := 1

	for _, c := range s {
		rows[rowIndex] = fmt.Sprintf("%s%c", rows[rowIndex], c) // append rune to string
		rowIndex += increment
		if rowIndex == (numRows - 1) || rowIndex == 0 {
			increment *= -1
		}
	}

	result := strings.Join(rows, "")

	return result
}

func main() {
	r := convert("PAYPALISHIRING", 3)
	e := "PAHNAPLSIIGYIR"
	fmt.Println(r == e)

	r = convert("PAYPALISHIRING", 4)
	e = "PINALSIGYAHRPI"
	fmt.Println(r == e)

	r = convert("AB", 1)
	e = "AB"
	fmt.Println(r == e)

	r = convert("ABC", 1)
	e = "ABC"
	fmt.Println(r == e)

	r = convert("ABC", 2)
	e = "ACB"
	fmt.Println(r == e)

	r = convert("ABCD", 2)
	e = "ACBD"
	fmt.Println(r == e)

	r = convert("ABCDE", 2)
	e = "ACEBD"
	fmt.Println(r == e)

	r = convert("ABCDE", 3)
	e = "AEBDC"
	fmt.Println(r == e)
}