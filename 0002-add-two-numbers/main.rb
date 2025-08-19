# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  l1_vals = []
  l2_vals = []

  node = l1
  loop do
    l1_vals.unshift(node.val)
    node = node.next
    break if node.nil?
  end

  node = l2
  loop do
    l2_vals.unshift(node.val)
    node = node.next
    break if node.nil?
  end

  l1_int = l1_vals.join.to_i
  l2_int = l2_vals.join.to_i
  sum = l1_int + l2_int

  digits = sum.to_s.chars.reverse
  n = nil
  digits.each do |c|
    if n.nil?
      n = ListNode.new(c.to_i)
    else
      tmp = n
      until n.next.nil?
        n = n.next
      end
      n.next = ListNode.new(c.to_i)
      n = tmp
    end
  end
  return n
end

l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))

r = add_two_numbers(l1, l2)