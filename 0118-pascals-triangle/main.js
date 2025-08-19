var generate = function(numRows) {
  let result = [];
  for (let i = 0; i < numRows; i++) {
    let newRow = [];
    let prevRow = result[i - 1]; // undefined
    for (let j = 0; j <= i; j++) {
      if (j === 0 || j === i) {
        newRow.push(1);
      } else if (prevRow) {
        newRow.push(prevRow[j - 1] + prevRow[j]);
      }
    }
    result.push(newRow);
  }
  return result;
}

// console.log(generate(6))