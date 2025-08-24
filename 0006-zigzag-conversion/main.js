// beats 60%
var convert = function(s, numRows) {
  if (numRows <= 1) {
    return s;
  }

  let gridLength = s.length + (numRows - (s.length % numRows));
  let str = s.padEnd(gridLength);
  let rows = new Array(numRows);
  rows.fill("");
  let rowIndex = 0;
  let increment = 1 // down
  for (let i = 0; i < str.length; i++) {
    let c = str[i];
    rows[rowIndex] += c;
    rowIndex += increment;
    if (rowIndex === (numRows - 1) || rowIndex === 0) {
      increment *= -1 // toggle
    }
  }
  let trimmed = rows.map((row) => row.trim());
  let joined = trimmed.join("");
  return joined;
};

r = convert("PAYPALISHIRING", 3)
console.log(r == "PAHNAPLSIIGYIR")