package main

import ("fmt")

// func climbStairs(n int) int {
//   fibs := []int{1,1}
// 	for i:= 0; i <= n; i++ {
// 		if i >= len(fibs) {
// 			appFib := fibs[i - 1] + fibs[i - 2]
// 			fibs = append(fibs, appFib)
// 		}
// 	}
// 	return fibs[n]
// }

/**
 * Definition for singly-linked list.
 */

type ListNode struct {
  Val int
  Next *ListNode
}

func deleteDuplicates(head *ListNode) *ListNode {
	if (head == nil || head.Next == nil) {
		return head
	}
	prevNode := head
	currentNode := head.Next
	for (currentNode != nil) {
		if (currentNode.Val != prevNode.Val) {
			prevNode = currentNode
		}
		currentNode = currentNode.Next
		prevNode.Next = currentNode
	}
	return head
}

func main () {
  ln1 := ListNode{Val: 1}
	ln2 := ListNode{Val: 1}
	ln3 := ListNode{Val: 2}

	ln2.Next = &ln3
	ln1.Next = &ln2
	pln := &ln1

	// fmt.Println(ln3.Next)
	r := deleteDuplicates(pln)
	for (r != nil) {
		fmt.Println(r.Val)
		r = r.Next
	}
}