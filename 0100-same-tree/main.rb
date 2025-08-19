# https://leetcode.com/problems/same-tree/

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def build_tree(arr)
  rows = []
  current_row = []

  arr.each.with_index do |e, i|
    new_node = e.nil? ? e : TreeNode.new(e)
    current_row << new_node

    prev_row = rows[-1]
    if prev_row.nil?
      # root
      rows << current_row
      current_row = []
      next
    end

    parent_node_index, l_r = (current_row.length - 1).divmod(2)

    # >> _parent_node_i = prev_row.index { |e| e && e.left.nil? || e.right.nil? }
    # => 0

    parent_node = prev_row.compact[parent_node_index]

    if new_node && l_r == 0
      parent_node.left = new_node
    elsif new_node && l_r == 1
      parent_node.right = new_node
    end

    if current_row.length == 2 * prev_row.length || (i == arr.length - 1)
      rows << current_row
      current_row = []
    end
  end


  root = rows.flatten[0]
  return root
end

def is_same_tree(p, q)
  p.nil? && q.nil? ||
  !(p.nil? && q || p && q.nil?) &&
  p.val == q.val &&
  is_same_tree(p.left, q.left) &&
  is_same_tree(p.right, q.right)
end

# e1arr = []
# e1 = build_tree(e1arr)
# p is_symmetric(e1) == true ? "PASS" : "FAIL"

# e2arr = [1]
# e2 = build_tree(e2arr)
# p is_symmetric(e2) == true ? "PASS" : "FAIL"

# e2barr = [1, 2]
# e2b = build_tree(e2barr)
# p is_symmetric(e2b) == false ? "PASS" : "FAIL"

# e3arr = [1,2,2]
# e3 = build_tree(e3arr)
# p is_symmetric(e3) == true ? "PASS" : "FAIL"

# e4arr = [1,2,2,3,4,4,3]
# e4 = build_tree(e4arr)
# p is_symmetric(e4) == true ? "PASS" : "FAIL"

# e4barr = [1,2,2,3,4,3,4]
# e4b = build_tree(e4barr)
# p is_symmetric(e4b) == false ? "PASS" : "FAIL"

# e5arr = [1,2,2,nil,3,nil,3]
# e5 = build_tree(e5arr)
# p is_symmetric(e5) == false ? "PASS" : "FAIL"