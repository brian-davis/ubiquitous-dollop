// Algorithm 3, based off of Leetcode (editorial)[https://leetcode.com/problems/longest-palindromic-substring/solutions/3598120/longest-palindromic-substring/?page=3]

var longestPalindrome = function(s) {
  var expand = function(left, right) {
    while (left >= 0 && right < s.length && s[left] === s[right]) {
      left--;
      right++;
    }
    return s.slice((left + 1), right);
  }

  let ans = "";

  for (let i = 0; i < s.length; i++) {
    let odd = expand(i, i);
    if (odd.length > ans.length) {
      ans = odd;
    }
    let even = expand(i, i + 1)
    if (even.length > ans.length) {
      ans = even;
    }
  }

  return ans;
};

// let s = "abbcdef";
// let r = longestPalindrome(s);
// let e = "bb";
// console.log(e);
// console.log(r === e);


// s = "racecar";
// r = longestPalindrome(s);
// e = "racecar";
// console.log(e);
// console.log(r === e);