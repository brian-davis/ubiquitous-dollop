package main
import ("fmt")

type ListNode struct {
  Val int
  Next *ListNode
}

// beats 100%
func removeNthFromEnd(head *ListNode, n int) *ListNode {
	// fmt.Println("n: ", n)
	_head := head

	flatListLen := 0
	for head != nil {
		flatListLen += 1
		head = head.Next
	}
	flatList := make([]*ListNode, flatListLen)

	// fmt.Println("flatList: ", flatList)

	head = _head // reset

	i := 0
	for head != nil {
		flatList[i] = head
		head = head.Next
		i++
	}

	fmt.Println("flatList: ", flatList)

	flatList2 := make([]*ListNode, flatListLen)

	if flatListLen - n == 0 {
		// copy all except first
		for i := 1; i < len(flatList); i++ {
			flatList2[i - 1] = flatList[i]
		}
	} else {
		// copy all
		for i := 0; i < flatListLen; i++ {
			flatList2[i] = flatList[i]
		}
		a := flatList2[flatListLen - n - 1]
		b := flatList2[flatListLen - n]
		a.Next = b.Next
	}

	return flatList2[0]
}

func main() {
	e1 := &ListNode{Val: 1, Next: &ListNode{Val: 2, Next: &ListNode{Val: 3, Next: &ListNode{Val: 4, Next: &ListNode{Val: 5}}}}}

	r := removeNthFromEnd(e1, 2)

	fmt.Println(r.Val)
	fmt.Println(r.Next.Val)
	fmt.Println(r.Next.Next.Val)
	fmt.Println(r.Next.Next.Next.Val)


	e2 := &ListNode{Val: 1}
	r = removeNthFromEnd(e2, 1)
	fmt.Println(r == nil)
}