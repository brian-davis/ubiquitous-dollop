/**
 * @param {number[]} digits
 * @return {number[]}
 */
var plusOne = function(digits) {
  let result = [];
  let carry = 1;
  for (i = digits.length - 1; i >=0; i--) {
    let dd = digits[i];
    dd = dd + carry;
    carry = ~~(dd/10)  // integer division quotient
    dd = dd % 10;
    result.unshift(dd)
  }
  if (carry > 0) { result.unshift(carry) }
  return result;
};

// const e1 = [1,2,3];
// console.log(plusOne(e1));

// const e2 = [4,3,2,1];
// console.log(plusOne(e2));

// const e3 = [9];
// console.log(plusOne(e3));

// const e4 = [9,9,9];
// console.log(plusOne(e4));