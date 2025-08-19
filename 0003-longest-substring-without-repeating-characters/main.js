var lengthOfLongestSubstring = function(s) {
  var charCount = {};
  var currentChars = [];
  var maxLength = 0;
  var sc = s.split('');
  for (var i = 0; i < sc.length; i++) {
    var c = sc[i];
    if (charCount[c]) {

      // var ci = currentChars.indexOf[c];
      // console.log("ci: ", ci); // undefined WTF
      var ci = 0
      for (var k = 0; k < currentChars.length; k++) {
        var kc = currentChars[k];
        if (kc === c) {
          ci = k;
          break;
        }
      }

      var _currentChars = currentChars.slice((ci + 1)); // until end
      var _prevChars = currentChars.slice(0, (ci + 1)); // include ci
      var _prevL = _prevChars.length;
      maxLength = Math.max(maxLength, _prevL, currentChars.length);
      currentChars = _currentChars;
      for (var j = 0; j < _prevChars.length; j++) {
        var pcc = _prevChars[j];
        delete charCount[pcc];
      }
    }
    charCount[c] = 1;
    currentChars.push(c);
  }
  maxLength = Math.max(maxLength, currentChars.length);
  if (maxLength === 0) {
    return s.length;
  } else {
    return maxLength;
  }
};

let e489 = "bbtablud";
let r489 = lengthOfLongestSubstring(e489);
console.log(r489);
console.log(r489 === 6);

let e357 = "abcb"
let r357 = lengthOfLongestSubstring(e357);
console.log( r357);
console.log( r357 === 3);

e408 = "dvdf";
r408 = lengthOfLongestSubstring(e408);
console.log( r408);
console.log( r408 === 3);

e1b = "zbexrampetvhqnddjeqvuygpnkazqfrpjvoaxdpcwmjobmskskfojnewxgxnnofwltwjwnnvbwjckdmeouuzhyvhg";
r1b = lengthOfLongestSubstring(e1b);
console.log( r1b);
console.log( r1b === 13);

// e0 = "abcde";
// r0 = lengthOfLongestSubstring(e0);
// console.log( r0);
// console.log( r0 === 5);

// e1 = "abcabcbb";
// r1 = lengthOfLongestSubstring(e1);
// console.log( r1);
// console.log( r1 === 3);

// e3 = "pwwkew";
// r3 = lengthOfLongestSubstring(e3);
// console.log( r3);
// console.log( r3 === 3);

// e4 = "aab";
// r4 = lengthOfLongestSubstring(e4);
// console.log( r4);
// console.log( r4 === 2);

// e2 = "bbbbb";
// r2 = lengthOfLongestSubstring(e2);
// console.log( r2);
// console.log( r2 === 1);