require "benchmark"

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  # convenience
  def inspector
    r = []
    current = self.dup
    r << current.val
    while current.next
      current = current.next
      r << current.val
    end
    r
  end
end

# slow
def delete_duplicates(head)
  return unless head
  result = ListNode.new(head.val)
  loop do
    last = result
    until last.next.nil?
      last = last.next
    end

    head = head.next
    break if head.nil?
    if head.val != last.val
      last.next = ListNode.new(head.val)
    end

    break if head.next.nil?
  end
  result
end

# Input: head = [1,1,2]
# Output: [1,2]

# e1 = ListNode.new(1, ListNode.new(1, ListNode.new(2)))
# p e1.inspector

# r1 = delete_duplicates(e1)
# p r1.inspector

# e2 = ListNode.new(1, ListNode.new(1, ListNode.new(2, ListNode.new(2, ListNode.new(3)))))
# p e2.inspector

# r2 = delete_duplicates(e2)
# p r2.inspector
# p r2.inspector == [1,2,3]

# beats 8%
def delete_duplicates2(head)
  return unless head
  return head unless head.next
  prev_node = head
  current_node = head.next
  loop do
    break if current_node.nil?
    unless current_node.val == prev_node.val
      prev_node = current_node
    end
    current_node = current_node.next
    prev_node.next = current_node
  end
  head
end

# e1 = ListNode.new(1, ListNode.new(1, ListNode.new(2)))
# p e1.inspector
# r1 = delete_duplicates2(e1)
# p r1.inspector
# p r1.inspector == [1,2]

# # e2 = ListNode.new(1, ListNode.new(1, ListNode.new(2, ListNode.new(2, ListNode.new(3)))))
# r2 = delete_duplicates2(e2)
# p e2.inspector
# p r2.inspector
# p r2.inspector == [1,2,3]

# e3 = ListNode.new(1, ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(3)))))
# p e3.inspector
# r3 = delete_duplicates2(e3)
# p r3.inspector
# p r3.inspector == [1,2,3]

# Benchmark.bm do |x|
#   x.report("v1") {
#     r1 = delete_duplicates(e3)
#   }

#   x.report("v2") {
#     r2 = delete_duplicates2(e3)
#   }
# end