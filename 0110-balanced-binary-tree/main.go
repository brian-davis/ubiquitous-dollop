package main

import ("fmt")
import ("math")


type TreeNode struct {
  Val int // 0
  Left *TreeNode // nil
  Right *TreeNode // nil
}

func depth(root *TreeNode) int {
	if root == nil {
		return 0
	}

	left_depth := float64(depth(root.Left))
	right_depth := float64(depth(root.Right))
	abs_diff := math.Abs(left_depth - right_depth)
	if left_depth == -1 || right_depth == -1 || abs_diff > 1 {
		return -1
	}

	node_depth := math.Max(left_depth, right_depth) + 1
	return int(node_depth)
}

func isBalanced(root *TreeNode) bool {
	d := depth(root)
	return d >= 0
}

func main() {
	 // [1,2,2,3,3,null,null,4,4]

	e1 := TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val: 2,
			Left: &TreeNode{
				Val: 3,
				Left: &TreeNode{Val: 4},
				Right: &TreeNode{Val: 4},
			},
			Right: &TreeNode{
				Val: 3,
			},
		},
		Right: &TreeNode{
			Val: 2,
		},
	}

	r  := isBalanced(&e1)

	fmt.Println(r)
}

