package main

import ("fmt")
// import ("math")


type TreeNode struct {
  Val int // 0
  Left *TreeNode // nil
  Right *TreeNode // nil
}

// func maxDepth(root *TreeNode) int {
//   if root == nil {
// 		return 0
// 	}
// 	lDepth := maxDepth(root.Left)
// 	rDepth := maxDepth(root.Right)
// 	lrMax  := int(math.Max(float64(lDepth), float64(rDepth))) + 1
// 	return lrMax
// }

func maxDepth(root *TreeNode) int {
	if root == nil {
		return 0
	}

	lDepth := maxDepth(root.Left)
	rDepth := maxDepth(root.Right)

	var lrMax int
	if lDepth >= rDepth {
		lrMax = lDepth
	} else {
		lrMax = rDepth
	}

	lrMax += 1
	return lrMax
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

	r  := maxDepth(&e1)

	fmt.Println(r)
}

