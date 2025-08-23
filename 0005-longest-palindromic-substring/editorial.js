// https://leetcode.com/problems/longest-palindromic-substring/solutions/3598120/longest-palindromic-substring/?page=3

// from Leetcode editorial
var longestPalindrome = function (s) {
    let check = function (i, j) {
        let left = i;
        let right = j - 1;

        while (left < right) {
            if (s.charAt(left) !== s.charAt(right)) {
                return false;
            }

            left++;
            right--;
        }

        return true;
    };

    for (let length = s.length; length > 0; length--) {
        for (let start = 0; start <= s.length - length; start++) {
            if (check(start, start + length)) {
                return s.substring(start, start + length);
            }
        }
    }

    return "";
};

// DP

var longestPalindrome = function (s) {
    let n = s.length;
    let dp = Array.from({ length: n }, () => new Array(n).fill(false));
    let ans = [0, 0];

    for (let i = 0; i < n; i++) {
        dp[i][i] = true;
    }

    for (let i = 0; i < n - 1; i++) {
        if (s[i] === s[i + 1]) {
            dp[i][i + 1] = true;
            ans = [i, i + 1];
        }
    }

    for (let diff = 2; diff < n; diff++) {
        for (let i = 0; i < n - diff; i++) {
            let j = i + diff;
            if (s[i] === s[j] && dp[i + 1][j - 1]) {
                dp[i][j] = true;
                ans = [i, j];
            }
        }
    }

    let i = ans[0];
    let j = ans[1];
    return s.slice(i, j + 1);
};


var longestPalindrome = function (s) {
    function expand(i, j) {
        let left = i;
        let right = j;

        while (left >= 0 && right < s.length && s[left] === s[right]) {
            left--;
            right++;
        }

        return s.slice(left + 1, right);
    }

    let ans = "";

    for (let i = 0; i < s.length; i++) {
        let odd = expand(i, i);
        if (odd.length > ans.length) {
            ans = odd;
        }

        let even = expand(i, i + 1);
        if (even.length > ans.length) {
            ans = even;
        }
    }

    return ans;
};