
function ListNode(val, next) {
  this.val = (val===undefined ? 0 : val)
  this.next = (next===undefined ? null : next)
}


var mergeTwoLists = function(list1, list2) {
  if (!list1 && !list2) { return null; }
  let result;
  let head;
  while (true) {
    if (!list1 && list2) {
      if (result) {
        result.next = new ListNode(list2.val)
        result = result.next
      } else {
        head = result = new ListNode(list2.val)
      }
      list2 = list2.next
    } else if (!list2 && list1) {
      if (result) {
        result.next = new ListNode(list1.val)
        result = result.next
      } else {
        head = result = new ListNode(list1.val)
      }
      list1 = list1.next
    } else if (list1.val <= list2.val) {
      if (result) {
        result.next = new ListNode(list1.val)
        result = result.next
      } else {
        head = result = new ListNode(list1.val)
      }
      list1 = list1.next
    } else if (list2.val <= list1.val) {
      if (result) {
        result.next = new ListNode(list2.val)
        result = result.next
      } else {
        head = result = new ListNode(list2.val)
      }
      list2 = list2.next
    }

    if (!list1 && !list2) {
      break;
    }
  }
  return head;
};

// let ep1 = new ListNode(1, new ListNode(2, new ListNode(4)))
// let ep2 = new ListNode(1, new ListNode(3, new ListNode(4)))


// list1 = [-10, -9, -6, -4, 1, 9, 9]
// list2 = [-5,  -3,  0,  7, 8, 8]

let ep1 = new ListNode(-10, new ListNode(-9, new ListNode(-6, new ListNode(-4, new ListNode(1, new ListNode(9, new ListNode(9)))))))
let ep2 = new ListNode(-5, new ListNode(-3, new ListNode(0, new ListNode(7, new ListNode(8, new ListNode(8))))))

let r = mergeTwoLists(ep1, ep2)
while (true) {
  console.log(r.val);
  r = r.next;
  if (!r) {
    break;
  }
}