var maxDepth = function(root) {
  if (!root) {
    return 0;
  }
  let ldepth = maxDepth(root.left);
  let rdepth = maxDepth(root.right);
  let lrMax = Math.max(ldepth, rdepth) + 1;
  return lrMax;
};