function ListNode(val, next) {
  this.val = (val===undefined ? 0 : val)
  this.next = (next===undefined ? null : next)
}

var getLinks = function(node) {
  let result = [];
  while (node != null) {
    result.push(node.val);
    node = node.next
  }
  return result;
}

var setLinks = function(arr, node) {
  if (arr.length === 0) {
    return null;
  }
  node.val = arr.shift();
  let nextVal;
  while ((nextVal = arr.shift()) !== undefined) {
    node.next = new ListNode(nextVal);
    node = node.next
  }
  return node;
}

var _equals = function(a, b) {
  let aa = getLinks(a);
  let bb = getLinks(b);
  if (aa.length !== bb.length) {
    return false;
  }

  for (let i = 0; i < aa.length; i++) {
    if (aa[i] !== bb[i]) {
      return false;
    }
  }
  return true;
}

// beats 46%
var mergeKLists = function(lists) {
  if (lists.length == 0) {
    return null;
  }
  let newLinks = [];
  for (let i = 0; i < lists.length; i++) {
    let e = lists[i];
    if (e) {
      let ll = getLinks(e);
      for (let j = 0; j < ll.length; j++) {
        let ee = ll[j];
        newLinks.push(ee)
      }
    }
  }

  if (newLinks.length > 0) {
    newLinks = newLinks.map((e) => { return Number(e) });
    newLinks = newLinks.sort(function(i,j) { return(Number(i) - Number(j)); });
    let result = new ListNode;
    setLinks(newLinks, result);
    return result;
  } else {
    return null;
  }
};


// let a = new ListNode(1, new ListNode(4, new ListNode(5)));
// console.log("a.getLinks", getLinks(a));

// let lists = [
//   new ListNode(1, new ListNode(4, new ListNode(5))),
//   new ListNode(1, new ListNode(3, new ListNode(4))),
//   new ListNode(2, new ListNode(6))
// ]
// let r = mergeKLists(lists);
// let e = new ListNode(1, new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(4, new ListNode(5, new ListNode(6))))))));

// console.log("e: ", getLinks(e));
// console.log("r: ", getLinks(r));
// console.log("_equals(r, e): ", _equals(r, e))

// // [[],[-1,5,11],[],[6,10]]
// let lists = [
//   null,
//   new ListNode(-1, new ListNode(5, new ListNode(11))),
//   null,
//   new ListNode(6, new ListNode(10))
// ]
// let r = mergeKLists(lists);
// console.log("r: ", getLinks(r));

// let lists = [
//   null,
//   new ListNode(1)
// ]
// let r = mergeKLists(lists);
// console.log(r);

// lists = [null]
// r = mergeKLists(lists);
// console.log(r);


// let e = new ListNode(1, new ListNode(1, new ListNode(2, new ListNode(3, new ListNode(4, new ListNode(4, new ListNode(5, new ListNode(6))))))));

// console.log("e: ", getLinks(e));
// console.log("r: ", getLinks(r));
// console.log("_equals(r, e): ", _equals(r, e))


// [[-1,1],[-3,1,4],[-2,-1,0,2]]
let lists = [
  new ListNode(-1, new ListNode(1)),
  new ListNode(-3, new ListNode(1, new ListNode(4))),
  new ListNode(-2, new ListNode(-1, new ListNode(0, new ListNode(2))))
]
let r = mergeKLists(lists);
console.log("r: ", getLinks(r));

// [-3,-2,-1,-1]
// [-3,-2,-1,-1,0,1,1,2,4]