package main
import ("fmt")

// Algorithm 3, based off of Leetcode (editorial)[https://leetcode.com/problems/longest-palindromic-substring/solutions/3598120/longest-palindromic-substring/?page=3]
// ported from Javascript
func longestPalindrome(s string) string {
	expand := func(left int, right int) string {
		for left >= 0 && right < len(s) && s[left] == s[right] {
			left--;
			right++;
		}
		sstr := s[(left +1):right]
		return (sstr)
	}

	ans := ""

	for i := 0; i < len(s); i++ {
		odd := expand(i, i)
		if len(odd) > len(ans) {
			ans = odd
		}

		even := expand(i, i + 1)
		if len(even) > len(ans) {
			ans = even
		}
	}

	return ans
}


func main() {
	s := "abbcdef"
	r := longestPalindrome(s)
	e := "bb"
	fmt.Println(e)
	fmt.Println(r == e)

	s = "racecar"
	r = longestPalindrome(s)
	e = "racecar"
	fmt.Println(e)
	fmt.Println(r == e)
}