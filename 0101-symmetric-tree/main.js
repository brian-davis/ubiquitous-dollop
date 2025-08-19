function TreeNode(val, left, right) {
  this.val = (val===undefined ? 0 : val)
  this.left = (left===undefined ? null : left)
  this.right = (right===undefined ? null : right)
}

function buildTree(arr) {
  let rows = [];
  let currentRow = [];

  for (i = 0; i < arr.length; i++) {
    let e = arr[i];
    let newNode;
    if (e) {
      newNode = new TreeNode(e)
    } else {
      newNode = null
    }

    currentRow.push(newNode);
    prevRow = rows[rows.length - 1];

    if (!prevRow) {
      // root
      rows.push(currentRow);
      currentRow = [];
      continue;
    }

    let parentNodeindex = ~~((currentRow.length-1)/2) // integer division quotient
    let lR = (currentRow.length - 1) % 2; // remainder

    let parentNode = prevRow.filter(e => e !== null)[parentNodeindex];

    if (newNode && lR === 0) {
      parentNode.left = newNode;
    } else if (newNode && lR === 1) {
      parentNode.right = newNode;
    }

    if (currentRow.length == 2 * prevRow.length || (i == arr.length -1)) {
      rows.push(currentRow);
      currentRow = [];
    }
  }

  // console.log(rows);
  let root = rows.flat(Infinity)[0] || null;
  // console.log(root);
  return root;
}

function mirrorTree(root) {
  if (!root) {
    return null;
  }

  let newNode = new TreeNode(root.val, mirrorTree(root.right), mirrorTree(root.left));
  return newNode;
}

function compareTrees(a, b) {
  return (
    (!a && !b) ||
    !(!a && b || a && !b) &&
    (a.val === b.val) &&
    (compareTrees(a.left, b.left)) &&
    (compareTrees(a.right, b.right))
  )
}

var isSymmetric = function(root) {
  return compareTrees(root, mirrorTree(root))
};

let e1arr = []
let e1 = buildTree(e1arr);
// console.log(e1);
let r1 = isSymmetric(e1);
console.log(r1);

let e2arr = [1]
let e2 = buildTree(e2arr);
// console.log(e2);
let r2 = isSymmetric(e2);
console.log(r2);

let e3arr = [1,2]
let e3 = buildTree(e2arr);
// console.log(e2);
let r3 = isSymmetric(e2);
console.log(r3);

let e4arr = [1,2,2]
let e4 = buildTree(e2arr);
let r4= isSymmetric(e4);
console.log(r4);

let e5arr = [1,2,2,3,4,4,3]
let e5 = buildTree(e2arr);
let r5= isSymmetric(e5);
console.log(r5);

let e6arr = [1,2,2,3,4,3,4]
let e6 = buildTree(e6arr);
let r6= isSymmetric(e6);
console.log(r6);

let e7arr = [1,2,2,null,3,null,3]
let e7 = buildTree(e7arr);
let r7= isSymmetric(e7);
console.log(r7);
