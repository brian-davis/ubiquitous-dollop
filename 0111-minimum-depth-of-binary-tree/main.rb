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

    parent_node_index = prev_row.index { |e| e && e.left.nil? || e && e.right.nil? }
    parent_node = prev_row[parent_node_index]
    # l_r = parent_node.left.nil? ? 0 : 1
    l_r = (current_row.length - 1) % 2

    if new_node && l_r == 0
      parent_node.left = new_node
    elsif new_node && l_r == 1
      parent_node.right = new_node
    end

    if parent_node == prev_row[-1] && l_r == 1
      rows << current_row
      current_row = []
    end
  end


  root = rows.flatten[0]
  return root
end

def min_depth(root)
  return 0 if root.nil?
  if root.left.nil?
    min_depth(root.right) + 1
  elsif root.right.nil?
    min_depth(root.left) + 1
  else
    [min_depth(root.left), min_depth(root.right)].min + 1
  end
end

# e1 = build_tree([3,9,20,nil,nil,15,7])
# #    3
# #   / \
# #  9   20
# #      / \
# #     15  7
# r = min_depth(e1)
# p r
# p r == 2

# e2 = build_tree([2,nil,3,nil,4,nil,5,nil,6])
# #   2
# #    \
# #     3
# #      \
# #       4
# #        \
# #         5
# #          \
# #           6
# r =  min_depth(e2)
# p r
# p r == 5