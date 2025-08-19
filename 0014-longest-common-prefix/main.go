package main

import (
	"fmt"
)

func longestCommonPrefix(strs []string) string {
	shortestLength := 0
	shortestWord := ""
	for i := 0; i < len(strs); i++ {
		str := strs[i]
		strLength := len([]rune(str))
		if strLength < shortestLength || i == 0 {
			shortestLength = strLength
			shortestWord = str
		}
	}
	if shortestLength == 0 {
		return ""
	}
	compareStr := shortestWord
	for i := shortestLength; i > 0; i-- {
		compareStr := compareStr[0:i]
		allMatch := true
		for ii := 0; ii < len(strs); ii++ {
			compareTo := strs[ii][0:i]
			if compareTo != compareStr {
				allMatch = false
				break
			}
		}
		if allMatch {
			return compareStr
		}
	}
	return ""
}

func main() {
	// strs := []string {"flower", "flow", "flight"}

	strs := []string {"", "b"}
	fmt.Println(longestCommonPrefix(strs))
}