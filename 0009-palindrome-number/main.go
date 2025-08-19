package main

import (
	"fmt"
	"strconv"
)

// https://stackoverflow.com/a/4965535/21928926
func reverse(s string) (result string) {
  for _,v := range s {
    result = string(v) + result
  }
  return
}

// bool default is false
func isPalindrome(x int) bool {
	str := strconv.Itoa(x);
	r := str == reverse(str);
	return r;
}

func main() {
	fmt.Println(isPalindrome(121));
}
