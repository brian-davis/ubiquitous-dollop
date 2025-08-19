// simple method
function isPalindrome(x) {
  var str = String(x);
  var reversedStr = str.split('').reverse().join('');
  var r = (str === reversedStr);
  return r
}

// TODO: v2

// // remainder method
// function isPalindrome(x) {
//   var reverseX = 0;
//   var num = x;
//   while (num > 0) {
//     var rem = num % 10;
//     reverseX = reverseX * 10 + rem;
//     num = ~~(-num/10) // integer division quotient
//   }
//   if (x != reverseX) { return false }
//   return true
// }

// console.log(isPalindrome(121));