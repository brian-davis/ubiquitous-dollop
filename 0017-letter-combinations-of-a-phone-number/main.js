// passes, beats %10
var letterCombinations = function(digits) {
  if (digits === "") {
    return [];
  }
  const letters = {
    0: [],
    1: [],
    2: ['a', 'b', 'c'],
    3: ['d', 'e', 'f'],
    4: ['g', 'h', 'i'],
    5: ['j', 'k', 'l'],
    6: ['m', 'n', 'o'],
    7: ['p', 'q', 'r', 's'],
    8: ['t', 'u', 'v'],
    9: ['w', 'x', 'y', 'z']
  };
  let sets = digits.split('').map((d) => letters[d]);
  console.log('sets', sets.length)
  if (sets.length === 1) {
    return sets[0];
  }
  // https://stackoverflow.com/questions/12303989/cartesian-product-of-multiple-arrays-in-javascript#43053803
  const cartesian = (...a) => a.reduce((a, b) => a.flatMap(d => b.map(e => [d, e].flat())));

  let r = cartesian(...sets).map((e) => e.join(""));
  // console.log('r', r);
  return r;
};

var r = letterCombinations("2");
console.log(r)