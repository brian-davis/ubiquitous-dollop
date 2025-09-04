package main

import (
	"fmt"
	"sort"
)

type ListNode struct {
  Val int
  Next *ListNode
}

func getLinks(node *ListNode) []int {
	result := []int{}
	for node != nil {
		result = append(result, node.Val)
		node = node.Next
	}
	return result
}

func setLinks(arr []int, node *ListNode) {
	e, arr := arr[0], arr[1:len(arr)] // shift
	node.Val = e // first
	for len(arr) > 0 {
		nextVal := arr[0]
		arr = arr[1:len(arr)] // shift

		node.Next = &ListNode { Val: nextVal }
		node = node.Next
	}
	// side effect, no return
}

// beats 58%
func mergeKLists(lists []*ListNode) *ListNode {
	if len(lists) == 0 {
		return nil
	}

	newLinks := []int{}
	for i := 0; i < len(lists); i++ {
		e := lists[i] // LinkNode
		if e != nil {
			ll := getLinks(e)
			for j := 0; j < len(ll); j++ {
				ee := ll[j]
				newLinks = append(newLinks, ee)
			}
		}
	}
	sort.Ints(newLinks) // mutates
	if len(newLinks) > 0 {
		result := &ListNode{}

		setLinks(newLinks, result)

		return result
	} else {
		return nil
	}
}

func main() {
	ln1 := &ListNode{Val: 1, Next: &ListNode{Val: 4, Next: &ListNode{Val: 5}}}
	ln2 := &ListNode{Val: 1, Next: &ListNode{Val: 3, Next: &ListNode{Val: 4}}}
	ln3 := &ListNode{Val: 2, Next: &ListNode{Val: 6}}

	e := []*ListNode{ln1, ln2, ln3}

	r := mergeKLists(e)

	fmt.Println(getLinks(r))
}