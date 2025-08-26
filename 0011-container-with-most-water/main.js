// top-down algo,beats 5%
var maxArea = function(heights) {
  let heightIndexes = {};
  for (let i = 0; i < heights.length; i++) {
    let height = heights[i];
    if (!heightIndexes[height]) {
      heightIndexes[height] = []
    }
    heightIndexes[height].push(i);
  }
  // console.log("heightIndexes", heightIndexes);

  let maxHeight =  Math.max(...heights);
  // console.log("maxHeight", maxHeight);

  let maxVol = 0;
  let leftBound;
  let rightBound;

  for (let height = maxHeight; height >= 0; height--) {
    // console.log("height", height);
    let heightVal = heightIndexes[height];
    // console.log("heightVal", heightVal);
    if (heightVal) {
      let levelLeftBound = Math.min(...heightVal);
      let levelRightBound = Math.max(...heightVal);
      // console.log("levelLeftBound", levelLeftBound);
      // console.log("levelRightBound", levelRightBound);

      // JS: 0 is falsy!
      if (leftBound === undefined) {
        leftBound = levelLeftBound;
      }
      if (rightBound === undefined) {
        rightBound = levelRightBound;
      }

      rightBound = Math.max(levelRightBound, rightBound);
      leftBound = Math.min(levelLeftBound, leftBound);

      // console.log("rightBound", rightBound);
      // console.log("leftBound", leftBound);

      let width = rightBound - leftBound;
      // console.log("width", width);
      let vol = width * height;
      // console.log("vol", vol);

      maxVol = Math.max(maxVol, vol)
      // console.log("maxVol", maxVol);
    }
  }

  return maxVol;
}

// let a = [1,8,6,2,5,4,8,3,7]
// let r = maxArea(a)
// let e = 49
// console.log(r)
// console.log(r == e)

// a = [1,1]
// r = maxArea(a)
// e = 1
// console.log(r)
// console.log(r == e)

a = [2,1]
r = maxArea(a)
e = 1
console.log(r)
console.log(r == e)

// heightIndexes { '1': [ 1 ], '2': [ 0 ] }
// maxHeight 2
// height 2
// heightVal [ 0 ]
// levelLeftBound 0
// levelRightBound 0
// leftBound 0
// rightBound 0
// rightBound 0
// leftBound 0
// width 0
// vol 0
// maxVol 0
// height 1
// heightVal [ 1 ]
// levelLeftBound 1
// levelRightBound 1

// leftBound 1 <<<< 0 is falsy!

// rightBound 1
// rightBound 1
// leftBound 1
// width 0
// vol 0
// maxVol 0
// height 0
// heightVal undefined
// 0
// false

