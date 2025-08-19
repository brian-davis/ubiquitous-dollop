/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var deleteDuplicates = function(head) {
  if (!head) {
    return null;
  }
  if (!head.next) {
    return head;
  }
  let prevNode = head;
  let currentNode = head.next;

  do {
    if (currentNode.val !== prevNode.val) {
      prevNode = currentNode;
    }
    currentNode = currentNode.next;
    prevNode.next = currentNode;
  } while (currentNode);

  return head;
};