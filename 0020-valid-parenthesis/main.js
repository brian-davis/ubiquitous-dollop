function isValid(s) {
  if (s.length <= 1) { return false; }
  var leftParens  = ["{", "[", "("];
  var rightParens = ["}", "]", ")"];
  var allParens = s.split('');
  var stack = [];
  while (allParens.length > 0) {
    var e = allParens.shift();
    rIndex = rightParens.indexOf(e);
    if (rIndex != -1 && stack[stack.length - 1] === leftParens[rIndex]) {
      stack.pop();
    } else {
      stack.push(e);
    }
  }
  return (stack.length === 0)
}

e1 = "()"
console.log(isValid(e1) === true)

e2 = "()[]{}"
console.log(isValid(e2) === true)

e3 = "(]"
console.log(isValid(e3) === false)

e4 = "([])"
console.log(isValid(e4) === true)

e5 = "([]){[()[]]}"
console.log(isValid(e5) === true)

e6 = "}"
console.log(isValid(e6) === false)

e7 = "(){}}{"
console.log(isValid(e7) === false)

e8 = "([)]"
console.log(isValid(e8) === false)

e9 = ")(){}"
console.log(isValid(e9) === false)