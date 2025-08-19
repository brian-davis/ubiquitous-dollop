// JavaScript program to check if a tree is height-balanced or not
// Using Bottom Up Recursion

class Node {
    constructor(d) {
        this.data = d;
        this.left = null;
        this.right = null;
    }
}

// Function that returns the height of the tree if the tree is balanced
// Otherwise it returns -1
function isBalancedRec(root) {
    // Base case: Height of empty tree is zero
    if (root === null)
        return 0;

    // Find Heights of left and right subtrees
    let lHeight = isBalancedRec(root.left);
    let rHeight = isBalancedRec(root.right);

    // If either of the subtrees are unbalanced or the absolute difference
    // of their heights is greater than 1, return -1
    if (lHeight === -1 || rHeight === -1 || Math.abs(lHeight - rHeight) > 1)
        return -1;

    // Return the height of the tree
    return Math.max(lHeight, rHeight) + 1;
}

// Function to check if the tree is height balanced
function isBalanced(root) {
    return isBalancedRec(root) > 0;
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