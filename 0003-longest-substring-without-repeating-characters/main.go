package main

import (
	"fmt"
	"strings"
)

func indexOf(slice []string, candidate string) int {
	for index, c := range slice {
		if c == candidate {
			return index
		}
	}
	return -1
}

func lengthOfLongestSubstring(s string) int {
	currentChars := []string{} // slice, no fixed length
	charCount := make(map[string]int)
	maxLength := 0
	sc := strings.Split(s, "")

	for i := 0; i < len(sc); i++ {
		c := sc[i]
		// fmt.Println(c)
		_, exists := charCount[c]
		if (exists) {
			// fmt.Println("c present")
			ci := indexOf(currentChars, c)
			// fmt.Println("ci: ", ci)

			postChars := currentChars[(ci + 1):] // until end
			// fmt.Println("postChars", postChars)
			preChars := currentChars[0:(ci + 1)] // include ci
			// fmt.Println("preChars", preChars)
			preLen := len(preChars)
			// fmt.Println("preLen", preLen)

			maxLength = max(maxLength, preLen, len(currentChars))
			currentChars = postChars

			for _, c := range preChars {
				delete(charCount, c)
			}
		}
		charCount[c] = 1
    currentChars = append(currentChars, c)
		// fmt.Println("currentChars", currentChars)
	}

	maxLength = max(maxLength, len(currentChars))
	if (maxLength == 0) {
		return len(s)
	} else {
		return maxLength
	}
}

func main() {
	e489 := "bbtablud";
	r489 := lengthOfLongestSubstring(e489);
	fmt.Println(r489);
	fmt.Println(r489 == 6);

	e357 := "abcb"
	r357 := lengthOfLongestSubstring(e357);
	fmt.Println(r357);
	fmt.Println(r357 == 3);

	e408 := "dvdf";
	r408 := lengthOfLongestSubstring(e408);
	fmt.Println(r408);
	fmt.Println(r408 == 3);

	e1b := "zbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwltwjwnnvbwjckdmeouuzhyvhg";
	r1b := lengthOfLongestSubstring(e1b);
	fmt.Println(r1b);
	fmt.Println(r1b == 13);
}