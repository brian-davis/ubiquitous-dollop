// JavaScript program to check if a tree is height-balanced or not
// Using Bottom Up Recursion

class Node {
    constructor(d) {
        this.data = d;
        this.left = null;
        this.right = null;
    }
}

// https://www.geeksforgeeks.org/how-to-determine-if-a-binary-tree-is-balanced/
// https://www.geeksforgeeks.org/balanced-binary-tree/

var depth = function(root) {
  if (root === null) {
    return 0;
  }

  const left_depth = depth(root.left);
  const right_depth = depth(root.right);
  const invalid = -1;
  const is_invalid = (
    left_depth == invalid ||
    right_depth == invalid ||
    Math.abs(left_depth - right_depth) > 1
  );

  if (is_invalid)  {
    return invalid;
  }

  node_depth = Math.max(...[left_depth, right_depth]) + 1;
  return node_depth;
}

var isBalanced = function(root) {
  return depth(root) >= 0
};