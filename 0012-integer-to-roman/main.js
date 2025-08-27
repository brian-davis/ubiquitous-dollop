// beats 11%
var intToRoman = function(num) {
  let result = [];
  let romans = {
    1000: "M",
    500:  "D",
    100:  "C",
    50:   "L",
    10:   "X",
    5:    "V",
    1:    "I"
  };

  rkeys = [1,5,10,50,100,500,1000];

  let nextKV = function(k) {
    let i = rkeys.indexOf(k);
    let _k = rkeys[i + 1];
    let v = romans[_k];
    return [_k, v];
  }

  let decimalPlaces = [];
  let i = 0;
  while (true) {
    if (decimalPlaces[0] && decimalPlaces[0] >= num) {
      break;
    }
    let dp = Math.pow(10, i)
    decimalPlaces.unshift(dp)
    i += 1
  }

  numByPlace = [];
  while (num > 0) {
    let d = decimalPlaces.find((dp) => { return (num >= dp) })
    let a = ~~(num / d)
    num = num % d
    numByPlace.push([a, d])
  }

  numByPlace.forEach(([n, decimalPlace]) => {
    let rv = romans[rkeys.find((rk) => {return (rk == decimalPlace) })]
    let [a, b] = nextKV(decimalPlace);
    let c = romans[decimalPlace];
    let str = "";
    if (n <= 3) {
      for (let j = 0; j < n; j++) {
        str += rv;
      }
      result.push(str)
    } else if (n == 4) {
      str = `${c}${b}`
      result.push(str)
    } else if (n == 5) {
      str = `${b}`
      result.push(str)
    } else if (n == 9) {
      [a, b] = nextKV(a); // skip over 5/50/500
      str = `${c}${b}`
      result.push(str)
    } else {
      // 6,7,8
      let diff = n - 5;
      str = b
      for (let j = 0; j < diff; j++) {
        str += c;
      }
      result.push(str)
    }
  })

  let resultStr = result.join("");
  return resultStr;
};

let a = 3749;
let r = intToRoman(a);
console.log(r);
let e = "MMMDCCXLIX";
console.log(r == e);

a = 58;
r = intToRoman(a);
console.log(r);
e = "LVIII";
console.log(r == e);

a = 100;
r = intToRoman(a);
console.log(r);
e = "C";
console.log(r == e);

a = 10;
r = intToRoman(a);
console.log(r);
e = "X";
console.log(r == e);