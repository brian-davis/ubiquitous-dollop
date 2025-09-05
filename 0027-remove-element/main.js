// @param {number[]} nums
// @param {number} val
// @return {number}

// beats 100%
var removeElement = function(nums, val) {
  let count = 0;
  for (let i = 0; i < nums.length; i++) {
    let e = nums[i];
    if (e === val || e === null) {
      let rest = nums.slice((i + 1), nums.length)
      let j = null;
      for (let ii = 0; ii < rest.length; ii++) {
        let ee = rest[ii];
        if (ee !== null && ee !== val) {
          j = ii;
          break;
        }
      }
      if (j != null) {
        let nextVal = nums[i + j + 1];
        nums[i] = nextVal;
        nums[i + j + 1] = null;
        count += 1;
      } else if (i === nums.length - 1) {
        nums[i] = null;
      } else {
        // next
      }
    } else {
      count += 1;
    }
  }
  return count;
};

// let nums = [0,1,2,2,3,0,4,2];
// let val = 2;
// let r = removeElement(nums, val)
// console.log(r == 5)


let nums = [3,2,2,3];
let val = 3;
let r = removeElement(nums, val)
console.log(r == 2)