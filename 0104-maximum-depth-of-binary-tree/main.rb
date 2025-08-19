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

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?
  [max_depth(root.left), max_depth(root.right)].max + 1
end

e1 = build_tree([3,9,20,nil,nil,15,7])
p max_depth(e1) == 3

e2 = build_tree([1,nil,2])
p max_depth(e2) == 2