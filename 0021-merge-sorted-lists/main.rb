# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  result = nil
  head = nil
  until list1.nil? && list2.nil? do
    selected_val = nil

    if (list1.nil? && list2) || ((list2&.val && list1&.val) && (list2.val <= list1.val))
      selected_val = list2.val
      list2 = list2.next
    elsif (list2.nil? && list1) || ((list1&.val && list2&.val) && (list1.val <= list2.val))
      selected_val = list1.val
      list1 = list1.next
    end

    if result
      result.next = ListNode.new(selected_val)
      result = result.next
    else
      head = result = ListNode.new(selected_val)
    end

  end
  return head
end

ep1 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
ep2 = ListNode.new(1, ListNode.new(3, ListNode.new(4)))
r = merge_two_lists(ep1, ep2)
loop do
  print r.val
  r = r.next
  break if r.nil?
end
# 112344
puts
ep1 = ListNode.new(5)
ep2 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
r = merge_two_lists(ep1, ep2)
loop do
  print r.val
  r = r.next
  break if r.nil?
end

# 1245