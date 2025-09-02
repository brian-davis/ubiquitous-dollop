var validParens = function(str, binStyle=false) {
  let stack = [];
  let left = binStyle ? "0" : "(";
  let right = binStyle ? "1" : ")";
  let counter = 1;

  for (let i = 0; i < str.length; i++) {
    let c = str[i];
    if (c === left) {
      stack.push(counter);
    } else if (c === right) {
      let p = stack.pop();
      if (p === undefined) {
        return false;
      }
    }
  }
  if (stack.length > 0) {
    return false;
  }
  return true;
}

// beats 6%
var generateParenthesis = function(n) {
  let minVal = Math.pow(2, n) - 1;
  let maxVal = Math.pow(4, n) / 3;
  let range = [];
  for (let i = minVal; i <= maxVal; i += 2) {
    range.push(i);
  }
  let r = range
    .map((e) => e.toString(2))
    .filter((e) => (e.match(/1/g)||[]).length == n)
    .map((e) => e.padStart(n * 2, "0"))
    .filter((e) => validParens(e, true))
    .map((e) => e.replaceAll("0", "(").replaceAll("1", ")"));

  return r;
};

let r = generateParenthesis(4);
console.log(r)