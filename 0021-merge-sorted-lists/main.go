package main
import ("fmt")

type ListNode struct {
  Val int
  Next *ListNode
}

func mergeTwoLists(list1 *ListNode, list2 *ListNode) *ListNode {
  var result *ListNode
	var head *ListNode
	var newNode *ListNode
	for {
		if list1 == nil && list2 == nil {
			break
		} else if list1 == nil && list2 != nil {
			if result != nil {
				result.Next = &ListNode{
					Val: list2.Val,
				}
				result = result.Next
			} else {
				result = &ListNode{
					Val: list2.Val,
				}
				head = result
			}
      list2 = list2.Next
		} else if list2 == nil && list1 != nil {
			if result != nil {
				result.Next = &ListNode{
					Val: list1.Val,
				}
				result = result.Next
			} else {
				result = &ListNode{
					Val: list1.Val,
				}
				head = result
			}
      list1 = list1.Next
  	} else if list1.Val <= list2.Val {
			if result != nil {
				newNode = &ListNode{
					Val: list1.Val,
				}
				result.Next = newNode
				result = result.Next // fix
			} else {
				result = &ListNode{
					Val: list1.Val,
				}
				head = result
			}
			list1 = list1.Next // fix
		} else if list2.Val <= list1.Val {
			if result != nil {
				result.Next = &ListNode{
					Val: list2.Val,
				}
				result = result.Next
			} else {
				result = &ListNode{
					Val: list2.Val,
				}
				head = result
			}
      list2 = list2.Next
		}
	}
	return head
}

func main () {
	ep1 := ListNode{
		Val: 1,
	}

	ep2 := ListNode{
		Val: 2,
	}

	ep3 := ListNode{
		Val: 4,
	}

  ep2.Next = &ep3
	ep1.Next = &ep2

	ep4 := ListNode{
		Val: 1,
	}

	ep5 := ListNode{
		Val: 3,
	}

	ep6 := ListNode{
		Val: 4,
	}

	ep5.Next = &ep6
	ep4.Next = &ep5

	r := mergeTwoLists(&ep1, &ep4)
	fmt.Println("-------")
	for r != nil {
		fmt.Println(r.Val)
		r = r.Next
	}
}