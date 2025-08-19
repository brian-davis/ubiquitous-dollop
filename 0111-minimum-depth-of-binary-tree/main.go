func minDepth(root *TreeNode) int {
	if root == nil {
		return 0
	}

	if root.Left == nil {
		return minDepth(root.Right) + 1
	} else if root.Right == nil {
			return minDepth(root.Left) + 1
	} else {
		var lrMin int
		lDepth := minDepth(root.Left)
		rDepth := minDepth(root.Right)
		if lDepth <= rDepth {
			lrMin = lDepth
		} else {
			lrMin = rDepth
		}

		lrMin += 1
		return lrMin
	}
}