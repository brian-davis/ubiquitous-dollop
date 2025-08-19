package main

import (
	"fmt"
	"regexp"
)

func lengthOfLastWord(s string) int {
	re := regexp.MustCompile(`\W`)
	split := re.Split(s, -1)
	words := []string{}
	for i := range split {
		e := split[i]
		if len(e) > 0 {
			words = append(words, split[i])
		}
	}

	lastWord := words[len(words) - 1]
	wordLength := len(lastWord)

	return wordLength
}

func main() {
	e1 := "Hello World"
	fmt.Println(lengthOfLastWord(e1))

	e2 := "   fly me   to   the moon  "
	fmt.Println(lengthOfLastWord(e2))
}
