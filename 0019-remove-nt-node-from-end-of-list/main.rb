require "benchmark"

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}

# beats 3%
def remove_nth_from_end1(head, n)
  _head = head
  vals = []
  while head
    vals.push head.val
    head = head.next
  end

  head = _head # reset

  result_head = nil
  _result_head = nil

  n_i = vals.length - n

  for i in (0...vals.length) do
    next if i == n_i
    v = vals[i]
    if result_head
      result_head.next = ListNode.new(v)
      result_head = result_head.next
    else
      result_head = ListNode.new(v) # copy
      _result_head = result_head
    end
  end

  return _result_head
end

# beats 100%
def remove_nth_from_end2(head, n)
  flat_list = []

  while head do
    flat_list.push(head)
    head = head.next
  end

  if (flat_list.length - n) == 0
    flat_list.shift
  else
    a = flat_list[(n * -1) - 1]
    b = flat_list[n * -1]
    a.next = b.next
  end
  _head = flat_list.first

  return _head
end

# a = [1,2,3,4,5]
b = 2
n = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
r = remove_nth_from_end2(n, b)
_r = []
while r
  _r.push r.val
  r = r.next
end
puts _r.inspect
e = [1,2,3,5]
puts _r == e

# a = [1]
b = 1
n = ListNode.new(1)
r = remove_nth_from_end2(n, b)
_r = []
while r
  _r.push r.val
  r = r.next
end
puts _r.inspect
e = []
puts _r == e

# a = [1,2]
b = 1
n = ListNode.new(1, ListNode.new(2))
r = remove_nth_from_end2(n, b)
# binding.irb
_r = []
while r
  _r.push r.val
  r = r.next
end
puts _r.inspect
e = [1]
puts _r == e

# a = [1,2,3]
b = 3
n = ListNode.new(1, ListNode.new(2, ListNode.new(3)))
r = remove_nth_from_end2(n, b)
_r = []
while r
  _r.push r.val
  r = r.next
end
puts _r.inspect
e = [2,3]
puts _r == e

# a = [1,2]
b = 2
n = ListNode.new(1, ListNode.new(2))
r = remove_nth_from_end2(n, b)
_r = []
while r
  _r.push r.val
  r = r.next
end
puts _r.inspect
e = [2]
puts _r == e

Benchmark.bm do |x|
  n = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))

  x.report("v1") {
    remove_nth_from_end1(n, 2)
  }

  x.report("v2") {
    remove_nth_from_end2(n, 2)
  }
end