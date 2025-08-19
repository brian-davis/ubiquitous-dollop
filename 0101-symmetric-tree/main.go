// https://leetcode.com/problems/symmetric-tree/submissions/1610882129/

package main

import ("fmt")

type TreeNode struct {
  Val int // 0
  Left *TreeNode // nil
  Right *TreeNode // nil
}

func mirrorTree(root *TreeNode) *TreeNode {
	newNode := TreeNode{
		Val: root.Val,
	}
	if root.Right != nil {
		newNode.Left = mirrorTree(root.Right)
	}
	if root.Left != nil {
		newNode.Right = mirrorTree(root.Left)
	}
	return &newNode
}

func compareTrees(a *TreeNode, b *TreeNode) bool {
	if (a == nil && b == nil) {
		return true
	}
	if (a == nil && b != nil || a != nil && b == nil) {
		return false
	}

	if (a.Val == b.Val) {
		leftCompare := compareTrees(a.Left, b.Left)
		rightCompare := compareTrees(a.Right, b.Right)
		return leftCompare && rightCompare
	} else {
		return false
	}
}

func isSymmetric(root *TreeNode) bool {
	m := mirrorTree(root)
	r := compareTrees(root, m)
	return r
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

	r := isSymmetric(&e1)
	fmt.Println(r)
}