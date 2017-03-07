class Node
	attr_accessor :val, :parent, :left, :right
	def initialize(value, parent, left=nil, right=nil)
		@val = value
		@left = left
		@right = right
		@parent = parent
	end

	#adds an item in an appropriate place on the tree
	def add(item)
		#there must be a better way to do this
		if @val == nil
			@val = item
		elsif @val >= item
			if @left == nil
				@left = Node.new(item, self)
			else
				@left.add(item)
			end
		else
			if @right == nil
				@right = Node.new(item, self)
			else
				@right.add(item)
			end
		end
	end

	def to_s
		l = @left.val if @left
		r = @right.val if @right
		"Node with #{@val} (descendants #{l}, #{r})"
	end

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
				puts "Stacking #{node.left}"
			end
			if node.right
				stack += [node.right]
				puts "Stacking #{node.right}"
			end 
		end

		return result 
	end

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

def make_tree(arr)
	root = Node.new(nil, nil)
	arr.each do |item|
		root.add(item)			
	end
	return root
end


t = make_tree([11, 1, 12, 4, 3, 2, 7])
puts t.show_tree
#puts "Found #{t.breadth_first_search(0)}"
# puts "Found #{t.breadth_first_search(3)}"
# puts "Found #{t.breadth_first_search(11)}"
# puts "Found #{t.depth_first_search(0)}"
# puts "Found #{t.depth_first_search(3)}"
# puts "Found #{t.depth_first_search(11)}"
puts "Found #{t.dfs_rec(0)}"
puts "Found #{t.dfs_rec(3)}"
puts "Found #{t.dfs_rec(11)}"