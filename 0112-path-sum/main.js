function TreeNode(val, left, right) {
  this.val = (val===undefined ? 0 : val)
  this.left = (left===undefined ? null : left)
  this.right = (right===undefined ? null : right)
}

var pathSums = function(root, memo) {
  memo ||= 0;
  let paths = [];
  if (!root) {
    return paths;
  }

  memo += root.val;

  if (root.left === null && root.right === null) {
    paths.push(memo);
    return paths;
  }

  if (root.left !== null) {
    paths = paths.concat(pathSums(root.left, memo))
  }

  if (root.right !== null) {
    paths = paths.concat(pathSums(root.right, memo))
  }

  return paths;
}

var hasPathSum = function(root, targetSum) {
  let r = pathSums(root);
  // console.log(r);
  let i = r.indexOf(targetSum);
  return i !== -1
};

// [
//   5,
//   4,        8,
//   11,null, 13,4,
//   7,2,null,null,null,1
// ]
let e1 = new TreeNode(
  5,
  new TreeNode(
    4,
    new TreeNode(
      11,
      new TreeNode(7),
      new TreeNode(2),
    ),
  ),
  new TreeNode(
    8,
    new TreeNode(13),
    new TreeNode(
      4,
      null,
      new TreeNode(1)
    ),
  )
);

console.log(
  hasPathSum(e1, 27)
);
console.log(
  hasPathSum(e1, 18)
);
console.log(
  hasPathSum(e1, 22)
);
console.log(
  hasPathSum(e1, 26)
);

console.log(
  hasPathSum(e1, 1000)
); // false