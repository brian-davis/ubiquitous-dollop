function ListNode(val, next) {
  this.val = (val===undefined ? 0 : val)
  this.next = (next===undefined ? null : next)
}

// beats 100%
var removeNthFromEnd = function(head, n) {
  let flatList = [];
  while (head) {
    flatList.push(head);
    head = head.next;
  }

  console.log("flatList", flatList)

  if (flatList.length - n === 0) {
    console.log("flatList.length - n === 0")

    flatList.shift()
  } else {
    let a = flatList[flatList.length - n - 1];
    console.log("a", a);

    let b = flatList[flatList.length - n];
    console.log("b", b);

    a.next = b.next;
  }

  console.log("flatList", flatList)

  return flatList[0] || null;
};

// let a = [1,2,3,4,5];
// let b = 2;
// let n = new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(5)))));

let a = [1];
let b = 1;
let n = new ListNode(1);

let r = removeNthFromEnd(n, b);
console.log("r", r);