package main
import ("fmt")

type TreeNode struct {
  Val int // 0
  Left *TreeNode // nil
  Right *TreeNode // nil
}

func pathSums(root *TreeNode, memo int) []int {
	var paths []int
	if root == nil {
		return paths
	}
	memo = memo + root.Val
	if root.Left == nil && root.Right == nil {
		paths = append(paths, memo)
		return paths
	}
	if root.Left != nil {
		leftPathSums := pathSums(root.Left, memo)
		for l_i := 0; l_i < len(leftPathSums); l_i++ {
			paths = append(paths, leftPathSums[l_i])
		}
  }
  if root.Right != nil {
		rightPathSums := pathSums(root.Right, memo)
		for r_i := 0; r_i < len(rightPathSums); r_i++ {
			paths = append(paths, rightPathSums[r_i])
		}
  }
	return paths
}

func hasPathSum(root *TreeNode, targetSum int) bool {
	r := pathSums(root, 0) // no default arguments
	for i := 0; i < len(r); i++ {
		if r[i] == targetSum {
			return true
		}
	}
	return false
}

func main() {
	//  [
	// 	1,
	// 	2,         2,
	// 	3,    3,null,null,
	// 	4,4
	//  ]

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

	r  := hasPathSum(&e1, 10)
	fmt.Println(r)
}
