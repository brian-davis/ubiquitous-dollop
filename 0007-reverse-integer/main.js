// From python algorithm editorial: https://leetcode.com/problems/reverse-integer/editorial/?page=3
var reverse = function(x) {
  let sign = x < 0 ? -1 : 1;
  let rev = 0;
  x = Math.abs(x);
  while (x != 0) {
    let mod = (x % 10);
    x = (x - mod) / 10;
    rev = (rev * 10) + mod;
    max = (Math.pow(2, 31) - 1);
    if (rev > max) {
      return 0;
    }
  }
  return sign * rev;
};

let a = 123
let r = reverse(a)
let e = 321
console.log(r)
console.log(r === e)

a = -123
r = reverse(a)
e = -321
console.log(r)
console.log(r === e)



