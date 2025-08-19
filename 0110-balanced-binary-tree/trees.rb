class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# def build_tree(arr)
#   rows = []
#   current_row = []

#   arr.each.with_index do |e, i|
#     new_node = e.nil? ? e : TreeNode.new(e)
#     current_row << new_node

#     prev_row = rows[-1]
#     if prev_row.nil?
#       # root
#       rows << current_row
#       current_row = []
#       next
#     end

#     parent_node_index = prev_row.index { |e| e && e.left.nil? || e && e.right.nil? }
#     parent_node = prev_row[parent_node_index]
#     # l_r = parent_node.left.nil? ? 0 : 1
#     l_r = (current_row.length - 1) % 2

#     if new_node && l_r == 0
#       parent_node.left = new_node
#     elsif new_node && l_r == 1
#       parent_node.right = new_node
#     end

#     if parent_node == prev_row[-1] && l_r == 1
#       rows << current_row
#       current_row = []
#     end
#   end


#   root = rows.flatten[0]
#   return root
# end

# TODO: try recursion
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


def build_tree2(arr, val = nil)
  # val ||= arr.shift # initial

  # val ||= arr.shift
  # if val
  #   node = TreeNode.new(val)
  #   l_val = arr.shift
  #   r_val = arr.shift
  # end
  # # binding.irb
  # node.left = build_tree2(arr, l_val) if l_val
  # node.right = build_tree2(arr, r_val) if r_val
  # node

  rows =
end


def copy_tree(root)
  return if root.nil?
  TreeNode.new(root.val, copy_tree(root.left), copy_tree(root.right))
end

def build_node_list(root, return_vals = true)
  rows = []
  loop do
    prev_row = rows[-1]
    if !prev_row
      # root
      current_row = [root]
      rows << current_row
    else
      current_row = prev_row.map { |n| [n&.left, n&.right] }.flatten
      break if current_row.compact.empty?
      rows << current_row
    end
  end

  rows = rows.flatten
  if return_vals
    rows = rows.map { |n| n&.val }
  end

  while (rows.length > 0 && rows[-1].nil?) do
    rows = rows[0...-1]
  end
  rows
end

# brute force
def l_r_balance(root)
  traversals_left = depth_traversals(root&.left)
  traversals_right = depth_traversals(root&.right)
  a, b = [traversals_left, traversals_right].map do |tt|
    tt.map { |arr| arr.length }.max || 0
  end
  (a - b).abs <= 1
end

# balanced depth
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

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?
  [max_depth(root.left), max_depth(root.right)].max + 1
end

# # TODO try recursion, as in path_sums
# def depth_traversals(root)
#   traversals = []
#   current_traversal = []
#   current_node = copy_tree(root)
#   turns = [:root]
#   while current_node do
#     current_traversal.unshift(current_node)
#     if current_node.left
#       current_node = current_node.left
#       turns.unshift(:left)
#     elsif current_node.right
#       current_node = current_node.right
#       turns.unshift(:right)
#     else
#       # puts
#       # puts "backtrack"
#       traversals.push(current_traversal.dup)
#       # puts "traversals: #{traversals.map { |t| t.map { |e| e&.val } }}"

#       until current_traversal[0].nil? || current_traversal[0].right
#         # puts "loop current_traversal[0]: #{current_traversal[0]&.val}"
#         current_traversal.shift
#         current_turn = turns.shift
#       end

#       current_node = current_traversal.shift
#       # puts "rewind shifted current_node: #{current_node&.val}"
#       # puts "current turn: #{current_turn}"
#       if current_turn == :left
#         current_node.left = nil
#       elsif current_turn == :right
#         prev_node = current_traversal.shift
#         # puts "prev_node: #{prev_node.val}"
#         prev_turn = turns.shift
#         # puts "prev_turn: #{prev_turn}"

#         if prev_turn == :left
#           prev_node.left = nil
#           # puts "prev_node left nil"
#         elsif prev_turn == :right
#           while prev_node #&& (prev_turn == :right || prev_turn == :root)
#             if turns == [:root] && prev_turn == :left
#               # puts "root"

#               # cross to right side
#               prev_node.left = nil
#               break
#             else
#               prev_node.right = nil
#               # puts "prev_node right nil"
#               prev_node = current_traversal.shift
#               prev_turn = turns.shift
#               # puts "rewind (right)"
#               # puts "prev_node: #{prev_node&.val}"
#               # puts "prev_turn: #{prev_turn}"
#             end

#           end
#         end
#         current_node = prev_node
#       end
#     end
#   end
#   traversals
# end

def depth_traversals_td(root, memo = [])
  # puts
  # puts root&.val
  # puts memo.inspect
  memo.unshift(root.val)

  if root.left
    depth_traversals_td(root.left, memo)
  elsif root.right
    depth_traversals_td(root.right, memo)
  end

  # binding.irb
  return memo
end


def path_sums(root, memo = 0)
  paths = []
  return paths if root.nil?
  memo += root.val

  if root&.left.nil? && root&.right.nil?
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
  p r
  return r.include?(target_sum)
end


# e1 = build_tree2([1, 2, 2, 3])

e1 = build_tree2([
  5,
  4,8,
  11,nil,13,4,
  7,2,nil,nil,nil,1
])
#            5
#      /          \
#     4              8
#    /    \         / \
#   11    n       13   4
#  /  \          /  \  / \
# 7    2         n  n  n  1
binding.irb

# >> 0.upto(4) do |i|
#   ?>   l = i
#   ?>   range = (2 ** l - 1)...((2 ** l) - 1 + (2 ** l))
#   ?>   puts "i: #{i} arr: #{arr[range]}"
#   ?>   end
#   i: 0 arr: [1]
#   i: 1 arr: [2, 3]
#   i: 2 arr: [4, 5, 6, 7]
#   i: 3 arr: [8, 9, 10, 11, 12, 13, 14, 15]
#   i: 4 arr: [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]

