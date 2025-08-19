package main

import ("fmt")

type TreeNode struct {
  Val int // 0
  Left *TreeNode // nil
  Right *TreeNode // nil
}

func isSameTree(p *TreeNode, q *TreeNode) bool {
	if (p == nil && q == nil) {
		return true
	}
	if (p == nil && q != nil || p != nil && q == nil) {
		return false
	}

	if (p.Val == q.Val) {
		leftCompare := isSameTree(p.Left, q.Left)
		rightCompare := isSameTree(p.Right, q.Right)
		return leftCompare && rightCompare
	} else {
		return false
	}
}

// func main() {
// 	 // [1,2,2,3,3,null,null,4,4]

// 	e1 := TreeNode{
// 		Val: 1,
// 		Left: &TreeNode{
// 			Val: 2,
// 			Left: &TreeNode{
// 				Val: 3,
// 				Left: &TreeNode{Val: 4},
// 				Right: &TreeNode{Val: 4},
// 			},
// 			Right: &TreeNode{
// 				Val: 3,
// 			},
// 		},
// 		Right: &TreeNode{
// 			Val: 2,
// 		},
// 	}

// 	r := isSymmetric(&e1)
// 	fmt.Println(r)
// }