# 21. Merge Two Sorted Lists
# You are given the heads of two sorted linked lists list1 and list2.
# Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
# Return the head of the merged linked list.

# Example 1:
# Input: list1 = [1,2,4], list2 = [1,3,4]
# Output: [1,1,2,3,4,4]

# Example 2:
# Input: list1 = [], list2 = []
# Output: []

# Example 3:
# Input: list1 = [], list2 = [0]
# Output: [0]

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

# def merge_two_lists(list1, list2)
#   result = nil
#   head = nil
#   until list1.nil? && list2.nil? do
#     if list1.nil? && list2
#       if result
#         result.next = ListNode.new(list2.val)
#         result = result.next
#       else
#         head = result = ListNode.new(list2.val)
#       end
#       list2 = list2.next
#     elsif list2.nil? && list1
#       if result
#         result.next = ListNode.new(list1.val)
#         result = result.next
#       else
#         head = result = ListNode.new(list1.val)
#       end
#       list1 = list1.next
#     elsif list1.val <= list2.val
#       if result
#         result.next = ListNode.new(list1.val)
#         result = result.next
#       else
#         head = result = ListNode.new(list1.val)
#       end
#       list1 = list1.next
#     elsif list2.val <= list1.val
#       if result
#         result.next = ListNode.new(list2.val)
#         result = result.next
#       else
#         head = result = ListNode.new(list2.val)
#       end
#       list2 = list2.next
#     end
#   end
#   return head
# end

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