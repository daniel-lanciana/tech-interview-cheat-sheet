###########################################################
### Dummy data for testing
###########################################################

class Node
  attr_accessor :value, :left, :right

  def initialize(value, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end

node_root = Node.new(4, Node.new(5, Node.new(9), Node.new(7)), Node.new(1, Node.new(2)))

# Represents associations between nodes (e.g. node 1 has an edge to node 3 and 5)
adj_matrix = [
    [0, 0, 1, 0, 1, 0],
    [0, 0, 1, 0, 0, 1],
    [0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 1, 1],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0]
]

sorted_array = [1,2,3,4,5,6,7,8,9]
unordered_array = [4,2,8,6,9,1,7,3]

###########################################################
### Searches
###########################################################

# DFS and BFS inputs types are either: node objects, adjacency matrix

#
# DFS (recursion, which is just a stack). To handle circular reference infinite loops, keep track of visited nodes.
#
# 1. Traverse all left nodes
# 2. Traverse all right nodes
# 3. Return true if target value found, false if no more children
# 4. Compare left and right, resolve any non-false value
#
def node_depth_first_search(node, target)
  return true if node.value == target
  return false if node.left.nil? and node.right.nil?

  # Select and return a non-nil value between left and right child nodes
  node_depth_first_search(node.left, target) if node.left ||
      node_depth_first_search(node.right, target) if node.right
end

# p node_depth_first_search node_root, 5

#
# DFS (adjacency matrix). Stack is LIFO (Last In First Out).
#
# 1. Add the starting node to the stack
# 2. While nodes in the stack, pop the last node and check if found or stack empty
# 3. Select all child nodes and push to end of stack
def adj_matrix_depth_first_search(adj_matrix, starting_node=0, target)
  node_stack = [starting_node]

  loop do
    # Pop the last element added off the stack
    curr_node = node_stack.pop

    return false if curr_node == nil
    return true if curr_node == target

    # Select children positions of node by checking the 1’s in the adjacency matrix
    children = (0..adj_matrix.length - 1).to_a.select do |i|
      adj_matrix[curr_node][i] == 1
    end

    # Add children to top of the stack
    node_stack = node_stack + children
  end
end

# p adj_matrix_depth_first_search adj_matrix, 2

#
# BFS (adjacency matrix). Same as DFS solution except uses a queue (LIFO) instead of stack.
#
# 1. Add the starting node to the queue
# 2. While nodes in the queue, pop the last node and check if found or stack empty
# 3. Select all child nodes and enqueue to beginning of queue
def adj_matrix_breadth_first_search(adj_matrix, starting_node=0, target)
  node_queue = [starting_node]

  loop do
    # Shift the first element from the queue
    curr_node = node_queue.shift

    return false if curr_node == nil
    return true if curr_node == target

    # Select children positions of node by checking the 1’s in the adjacency matrix
    children = (0..adj_matrix.length - 1).to_a.select do |i|
      adj_matrix[curr_node][i] == 1
    end

    # Add children to the end of queue
    node_queue = node_queue + children
  end
end

# p adj_matrix_breadth_first_search adj_matrix, 2

# Name: Binary Search
# Time Complexity: O(N log N)
# Requirements: Array must be sorted
# Notes: Ruby has inbuilt implementation: arr.bsearch { |x| x > 2 }
#
# 1. Take midpoint of array and return position if target value
# 2. If lower, run again using upper half of array (via low/high positions)
# 3. If higher, run again using lower half of array (via low/high positions)
def binary_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) >> 1

    # Returns -1 if target is lower than current node, 0 if match, 1 if greater
    case target <=> arr[mid]
      when 1
        low = mid + 1
      when -1
        high = mid - 1
      else
        return mid
    end
  end
end

# p binary_search sorted_array, 2

###########################################################
### Data Structures
###########################################################


# def build_tree(array, *indices)
#   array.sort.uniq!
#   mid = (array.length-1)/2
#   first_element = indices[0]
#   last_element = indices[1]
#
#   if !first_element.nil? && first_element >last_element
#     return nil
#   end
#
#   root = Node.new(array[mid])
#   root.left = build_tree(array[0..mid-1], 0, mid-1)
#   root.right = build_tree(array[mid+1..-1], mid+1, array.length-1)
#
#   return root
# end
#

#
# Given a word, how to find all anagrams in a dictionary > ruby has permutations helper! N! permutations is huge, alt is to extract dictionary words of same length, sort alphabetically then compare with input word sorted. to produce permutations, recursively
#
# # heaps algorithm
# def perms (array, n = array.size-1)
#   #case to jump off from recursion and return a permutation
#   if  n == 0
#     p array
#     return array
#     #else dig dipper
#   else
#     for i in 0..n do
#       perms(array, n-1)
#       if (n-1) % 2 == 1
#         array[1], array[n] = array[n], array[1]
#       else
#         array[i], array[n] = array[n], array[i]
#       end
#     end
#   end
# end
#
# def most_repeated(str)
#   map = Hash.new(0)
#
#   str.each_char do |char|
#     map[char] = map[char] += 1
#     # result = char if map[char] > count
#   end
#
#   map.max_by{ |key,value| value }.first
# end
#
# # p most_repeated('adjksuuldsnajkdsa')
#
# # take an array of sorted numbers and return each number squared and sorted. Be sure to account for negative numbers.
# def square_numbers(numbers)
#   zero_index = numbers.bsearch_index {|x| x >= 0}
#   negatives = numbers.slice!(0, zero_index)
#
#   neg_sqr = negatives.map{ |number| number.abs**2 }.reverse
#   pos_sqr = numbers.map{ |number| number**2 }
#
#   # mergesort two sorted lists
#   merge(neg_sqr, pos_sqr)
# end
#
# def merge(left, right)
#   if left.empty?
#     right
#   elsif right.empty?
#     left
#   elsif left.first < right.first
#     [left.first] + merge(left[1..left.length], right)
#   else
#     [right.first] + merge(left, right[1..right.length])
#   end
# end
#
# # merge sort
# def mergesort(list)
#   return list if list.size <= 1
#   mid = list.size / 2
#   left = list [0,mid]
#   right = list [mid, list.size]
#   merge(mergesort(left),mergesort(right))
# end
#
# def merge(left,right)
#   sorted = []
#   until left.empty? || right.empty?
#     if left.first < right.first
#       sorted << left.shift
#     else
#       sorted << right.shift
#     end
#   end
#   sorted.concat(left).concat(right)
# end
#
# # quick sort
# def quicksort(arr, first, last)
#   if first < last
#     p_index = partition(arr, first, last)
#     quicksort(arr, first, p_index - 1)
#     quicksort(arr, p_index + 1, last)
#   end
#
#   arr
# end
#
# def partition(arr, first, last)
#   # first select one element from the list, can be any element.
#   # rearrange the list so all elements less than pivot are left of it, elements greater than pivot are right of it.
#   pivot = arr[last]
#   p_index = first
#
#   i = first
#   while i < last
#     if arr[i] <= pivot
#       temp = arr[i]
#       arr[i] = arr[p_index]
#       arr[p_index] = temp
#       p_index += 1
#     end
#     i += 1
#   end
#   temp = arr[p_index]
#   arr[p_index] = pivot
#   arr[last] = temp
#   return p_index
# end