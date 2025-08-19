class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# temporary
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

    # parent_node_index = prev_row.index { |e| e && e.left.nil? || e && e.right.nil? }
    # l_r = parent_node.left.nil? ? 0 : 1
    parent_node_index, l_r = (current_row.length - 1).divmod(2)
    parent_node = prev_row.compact[parent_node_index]
    # binding.irb if e == 1
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

# v2
def path_sums(root, memo = 0)
  paths = []
  return paths if root.nil?

  memo += root.val

  if root.left.nil? && root.right.nil?
    paths.push(memo)
    return paths
  end

  if root.left
    paths += path_sums(root.left, memo)
  end

  if root.right
    paths += path_sums(root.right, memo)
  end

  paths
end

def has_path_sum(root, target_sum)
  r = path_sums(root)
  return r.include?(target_sum)
end

# e2 = build_tree([])
# p r =  has_path_sum(e2, 0)  == false ? "PASS" : "FAIL"

# e2 = build_tree([])
# p r =  has_path_sum(e2, -1) == false ? "PASS" : "FAIL"

# en = build_tree([1,-2,-3,1,3,-2,nil,-1])
# #         1
# #     -2     -3
# #    1  3  -2   nil
# # -1
# #
# # 1 + -2 + 1 + -1 = -1
# # 1 + -2 + 3      = 2
# # 1 + -3 + -2     = -4

# p r =  has_path_sum(en, -1) == true ? "PASS" : "FAIL"
# p r =  has_path_sum(en, 2)  == true ? "PASS" : "FAIL"
# p r =  has_path_sum(en, -4) == true ? "PASS" : "FAIL"
# p r =  has_path_sum(en, 0)  == false ? "PASS" : "FAIL"

# e1 = build_tree([
#     5,
#     4,8,
#     11,nil,13,4,
#     7,2,nil,nil,nil,1
#   ])
# #       5
# #      /     \
# #     4         8
# #    /    \         / \
# #   11    n      13  4
# #  /  \   /  \    /  \  \
# # 7    2  n  n    n  n    1

# # >> 5+4+11+7 # => 27 # .max
# # >> 5+4+11+2 # => 22
# # >> 5+8+13 # => 26
# # >> 5+8+4+1 # => 18 # .min

# p r = has_path_sum(e1, 27) == true ? "PASS" : "FAIL" # true
# p r = has_path_sum(e1, 22) == true ? "PASS" : "FAIL" # true
# p r = has_path_sum(e1, 26) == true ? "PASS" : "FAIL" # true
# p r = has_path_sum(e1, 18) == true ? "PASS" : "FAIL" # true
# p r = has_path_sum(e1, 9)  == false ? "PASS" : "FAIL" # false