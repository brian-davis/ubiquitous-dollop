// beats 82%
var convert = function(s, numRows) {
  if (numRows <= 1) {
    return s;
  }

  let rows = new Array(numRows);
  rows.fill("");
  let rowIndex = 0;
  let increment = 1 // down
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    rows[rowIndex] += c;
    rowIndex += increment;
    if (rowIndex === (numRows - 1) || rowIndex === 0) {
      increment *= -1 // toggle
    }
  }
  return rows.join("");
};

r = convert("PAYPALISHIRING", 3)
console.log(r == "PAHNAPLSIIGYIR")