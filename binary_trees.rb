class Node
	attr_accessor :val, :parent, :left, :right
	def initialize(value, parent, left=nil, right=nil)
		@val = value
		@left = left
		@right = right
		@parent = parent
	end

	#creates a string with the node's value and the values of its direct descendants
	def to_s
		l = @left.val if @left
		r = @right.val if @right
		"Node with #{@val} (descendants #{l}, #{r})"
	end

	#creates a string showing the tree in the form root (left_subtree) root (right_subtree)
	def show_tree
		result = "#{@val}"
		[@left, @right].each do |subtree|
			if subtree
				result += " (#{subtree.show_tree})"
			else
				result += " (nil)"
			end
		end
		return result
	end

	#returns a descendant of this node containing the passed item as it's val, 
	#or nil if there isn't one, using breadth first search
	def breadth_first_search(item)
		queue = [self]
		result = nil

		queue.each do |node|
			#puts "Checking #{node}"

			if node.val == item
				result = node
				break
			end
			if node.left
				queue << node.left
				#puts "Enqueuing #{node.left}"
			end
			if node.right
				queue << node.right 
				#puts "Enqueuing #{node.right}"
			end 
		end

		return result 
	end

	#returns a descendant of this node containing the passed item as it's val, 
	#or nil if there isn't one, using depth first search
	def depth_first_search(item)
		#not DRY
		stack = [self]
		result = nil

		while stack[-1] do 
			node = stack[-1]
			stack.pop
			#puts "Checking #{node}"

			if node.val == item
				result = node
				break
			end
			if node.left
				stack += [node.left]
				#puts "Stacking #{node.left}"
			end
			if node.right
				stack += [node.right]
				#puts "Stacking #{node.right}"
			end 
		end

		return result 
	end

	#returns a descendant of this node containing the passed item as it's val, 
	#or nil if there isn't one, using a recursive depth first search algorithm
	def dfs_rec(item)
		#puts "checking #{self}"
		if @val == item
			result = self
		else
			result = @left.dfs_rec(item) if @left && !result
			result = @right.dfs_rec(item) if @right && !result
		end

		return result
	end
end

class BinarySearchTree < Node
	#converts an array to a binary tree
	def initialize(arr=[])
		parent
		arr.each do |item|
			self.add(item)			
		end
	end
	
	#adds an item in an appropriate place on the tree
	def add(item)
		#refactor this and binary_search to use some kind of binary search by condition method?
		if @val == nil
			@val = item
		elsif @val >= item
			if @left == nil
				@left = BinarySearchTree.new()
				@left.val = item
				@left.parent = self
			else
				@left.add(item)
			end
		else
			if @right == nil
				@right = BinarySearchTree.new()
				@right.val = item
				@right.parent = self
			else
				@right.add(item)
			end
		end
	end

	def binary_search(item)
		#puts "Checking #{self}"
		if @val == item
			return self
		elsif @val >= item && @left
			#puts "going left"
			return @left.binary_search(item)
		elsif @val <= item && @right
			#puts "going right"
			return @right.binary_search(item)
		else
			return nil
		end
	end	
end


t = BinarySearchTree.new([11, 1, 12, 4, 3, 2, 7])
puts t.show_tree
# puts "Found #{t.breadth_first_search(0)}"
# puts "Found #{t.breadth_first_search(3)}"
# puts "Found #{t.breadth_first_search(12)}"
# puts "Found #{t.depth_first_search(0)}"
# puts "Found #{t.depth_first_search(3)}"
# puts "Found #{t.depth_first_search(12)}"
# puts "Found #{t.dfs_rec(0)}"
# puts "Found #{t.dfs_rec(3)}"
# puts "Found #{t.dfs_rec(12)}"
# puts "Found #{t.binary_search(0)}"
# puts "Found #{t.binary_search(3)}"
# puts "Found #{t.binary_search(12)}"