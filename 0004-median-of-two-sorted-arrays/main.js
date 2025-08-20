function compareNumbers(a, b) {
  return Number(a) - Number(b);
}

var findMedianSortedArrays = function(nums1, nums2) {
  let merged = [...nums1, ...nums2].sort(compareNumbers);
  console.log(merged)
  if (merged.length % 2 == 1) {
    // odd
    middleIndex = ~~(merged.length/2); // integer division
    console.log(middleIndex);
    let r = merged[middleIndex];
    console.log(r);
    return (r);
  } else {
    // even
    middleRIndex = merged.length / 2;
    middleLIndex = (merged.length / 2) - 1;
    return (merged[middleRIndex] + merged[middleLIndex]) / 2.0;
  }
};

// let = nums1 = [1,3];
// let nums2 = [2];
// let r = findMedianSortedArrays(nums1, nums2);
// console.log(r);
// console.log(r == 2.0);

// let nums1 = [1,2];
// let nums2 = [3,4];
// let r = findMedianSortedArrays(nums1, nums2);
// console.log(r == 2.5);

// let nums1 = [2,2,4,4];
// let nums2 = [2,2,2,4,4]
// ler r = findMedianSortedArrays(nums1, nums2)
// console.log(r == 2.0);

let = nums1 = [1,2,3,4,5];
let = nums2 = [6,7,8,9,10,11,12,13,14,15,16,17];
let r = findMedianSortedArrays(nums1, nums2)
console.log(r);
console.log(r == 9);