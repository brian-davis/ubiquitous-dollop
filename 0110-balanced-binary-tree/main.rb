# Definition for a binary tree node.
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

def depth(root)
  return 0 if root.nil?
  left_depth = depth(root.left)
  right_depth = depth(root.right)
  if left_depth == -1 || right_depth == -1 || (left_depth - right_depth).abs > 1
    return -1
  end
  return [left_depth, right_depth].max + 1
end

def is_balanced(root)
  depth(root) >= 0
end

# e0 = build_tree([])
# r = is_balanced(e0)
# # p r
# puts r == true ? "PASS" : "FAIL" # expected true

# e1 = build_tree([1])
# r = is_balanced(e1)
# # p r
# puts r == true ? "PASS" : "FAIL" # expected true

# e2 = build_tree([1, 2])
# r = is_balanced(e2)
# # p r
# puts r == true ? "PASS" : "FAIL" # expected true

# e3 = build_tree([1, 2, 3])
# r = is_balanced(e3)
# # p r
# puts r == true ? "PASS" : "FAIL" # expected true


# ef1 = build_tree([2,1,3,0,7,9,1,2,nil, 1,0, nil,nil, 8,8,nil,nil,nil,nil,7])
# #         2
# #      /       \
# #     1         3
# #    / \       /  \
# #   0   7     9    1
# #  /   / \        / \
# # 2   1   0      8   8
# #        /
# #       7
# r = is_balanced(ef1)
# # p r
# puts r == true ? "PASS" : "FAIL" # expected true

# ef2 = build_tree([1,2,3,4,nil,nil,nil,5])
# #        1
# #      /   \
# #     2     3
# #    /
# #   4
# #  /
# # 5
# r = is_balanced(ef2)
# # p r
# puts r == false ? "PASS" : "FAIL" # expected false

# ef3 = build_tree([1,2,2,3,3,nil,nil,4,4])
# #       1
# #      / \
# #     2   2
# #    / \
# #   3   3
# #  / \
# # 4   4
# r = is_balanced(ef3)
# # p r
# puts r == false ? "PASS" : "FAIL" # expected false