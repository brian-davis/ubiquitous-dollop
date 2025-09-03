class ListNode
  attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def get_links
    result = []
    _self = self.dup
    while _self
      result.push(_self.val)
      _self = _self.next
    end
    result
  end

  # mutates
  def set_links!(arr)
    return if arr.empty?
    _self = self # not .dup
    _self.val = arr.shift
    while (next_val = arr.shift)
      _self.next = ListNode.new(next_val)
      _self = _self.next
    end
    return self
  end

  def ==(other)
    self.get_links == other.get_links
  end
end

# beats 81%
def merge_k_lists(lists)
  result = ListNode.new
  new_links = lists.compact.map(&:get_links).flatten.sort
  return if new_links.length == 0
  result.set_links!(new_links)
  return result
end

lists = [
  ListNode.new(1, ListNode.new(4, ListNode.new(5))),
  ListNode.new(1, ListNode.new(3, ListNode.new(4))),
  ListNode.new(2, ListNode.new(6))
]

r = merge_k_lists(lists)
e = ListNode.new(1, ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(4, ListNode.new(5, ListNode.new(6))))))))

puts "e: #{e.get_links}"
puts "r: #{r.get_links}"

puts r == e