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

def copy_tree(root)
  return if root.nil?
  TreeNode.new(root.val, copy_tree(root.left), copy_tree(root.right))
end

def depth_traversals(root)
  traversals = []
  current_traversal = []
  current_node = copy_tree(root)
  turns = [:root]
  while current_node do
    current_traversal.unshift(current_node)
    if current_node.left
      current_node = current_node.left
      turns.unshift(:left)
    elsif current_node.right
      current_node = current_node.right
      turns.unshift(:right)
    else
      # puts
      # puts "backtrack"
      traversals.push(current_traversal.dup)
      # puts "traversals: #{traversals.map { |t| t.map { |e| e&.val } }}"

      until current_traversal[0].nil? || current_traversal[0].right
        # puts "loop current_traversal[0]: #{current_traversal[0]&.val}"
        current_traversal.shift
        current_turn = turns.shift
      end

      current_node = current_traversal.shift
      # puts "rewind shifted current_node: #{current_node&.val}"
      # puts "current turn: #{current_turn}"
      if current_turn == :left
        current_node.left = nil
      elsif current_turn == :right
        prev_node = current_traversal.shift
        # puts "prev_node: #{prev_node.val}"
        prev_turn = turns.shift
        # puts "prev_turn: #{prev_turn}"

        if prev_turn == :left
          prev_node.left = nil
          # puts "prev_node left nil"
        elsif prev_turn == :right
          while prev_node #&& (prev_turn == :right || prev_turn == :root)
            if turns == [:root] && prev_turn == :left
              # puts "root"

              # cross to right side
              prev_node.left = nil
              break
            else
              prev_node.right = nil
              # puts "prev_node right nil"
              prev_node = current_traversal.shift
              prev_turn = turns.shift
              # puts "rewind (right)"
              # puts "prev_node: #{prev_node&.val}"
              # puts "prev_turn: #{prev_turn}"
            end

          end
        end
        current_node = prev_node
      end
    end
  end
  traversals
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

def balanced_depth(root)
  return 0 if root.nil?
  left_depth = balanced_depth(root.left)
  right_depth = balanced_depth(root.right)
  if left_depth == -1 || right_depth == -1 || (left_depth - right_depth).abs > 1
    return -1
  end
  return [left_depth, right_depth].max + 1
end

def is_balanced(root)
  balanced_depth(root) >= 0
end

def depth(root)
  return 0 if root.nil?
  left_depth = depth(root.left)
  right_depth = depth(root.right)
  return [left_depth, right_depth].max + 1
end

def mirror_tree(root)
  return if root.nil?
  TreeNode.new(root.val, mirror_tree(root.right), mirror_tree(root.left))
end

def compare_trees(a, b)
  a.nil? && b.nil? ||
  !(a.nil? && b || a && b.nil?) &&
  a.val == b.val &&
  compare_trees(a.left, b.left) &&
  compare_trees(a.right, b.right)
end

def is_symmetric(root)
  compare_trees(root, mirror_tree(root))
end