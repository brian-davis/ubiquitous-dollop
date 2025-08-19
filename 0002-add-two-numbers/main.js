function ListNode(val, next) {
  this.val = (val===undefined ? 0 : val)
  this.next = (next===undefined ? null : next)
}

var addTwoNumbers = function(l1, l2) {
  let l1_vals = [];
  let l2_vals = [];

  let node = l1;
  while (node) {
    l1_vals.unshift(node.val);
    node = node.next;
  }

  node = l2;
  while (node) {
    l2_vals.unshift(node.val);
    node = node.next;
  }

  l1_int = BigInt(l1_vals.join(''));
  l2_int = BigInt(l2_vals.join(''));

  // console.log(l1_int);
  // console.log(l2_int);

  let sum = l1_int + l2_int;

  // console.log(sum);

  let digits = sum.toString().split('').reverse();
  // console.log(digits);
  let n = null;

  for (let i = 0; i < digits.length; i++) {
    let c = digits[i];
    if (n === null) {
      n = new ListNode(Number(c));
    } else {
      let tmp = n;
      while (n.next) {
        n = n.next;
      }
      n.next = new ListNode(Number(c));
      n = tmp;
    }
  }
  return n;
};

// let l1 = new ListNode(2, new ListNode(4, new ListNode(3)));
// let l2 = new ListNode(5, new ListNode(6, new ListNode(4)));
// let r1 = addTwoNumbers(l1, l2);

let l1 = new ListNode(1, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(0, new ListNode(1)))))))))))))))))))))))))))))))
let l2 = new ListNode(5, new ListNode(6, new ListNode(4)));
let r2 = addTwoNumbers(l1, l2);

console.log(r2);
