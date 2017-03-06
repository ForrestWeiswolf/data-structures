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
		stack = []
		puts "Checking #{self}"
		if @val == item
			return self
		else
			puts "Stacking #{@left}" if @left
			stack = [@left] + stack if @left
			puts "Stacking #{@right}" if @right
			stack = [@right] + stack if @right
			stack.each do |node|
				puts "#{node} from stack..."
				return node.breadth_first_search(item)
			end
		end
		return nil
	end

	def dfs_rec(item)
		result = false
		if @val == item
			return self
		else
			[@left, @right].each do |side|
				found = dfs_rec(side) if side
				return found if found
			end
		end
	end
end

def make_tree(arr)
	root = Node.new(nil, nil)
	arr.each do |item|
		root.add(item)			
	end
	return root
end


t = make_tree([11, 1, 12, 4, 3, 7])
puts t.show_tree
puts "Found #{t.breadth_first_search(0)}"
puts "Found #{t.breadth_first_search(3)}"
puts "Found #{t.breadth_first_search(11)}"
#puts "Found #{t.depth_first_search(0)}"
#puts "Found #{t.depth_first_search(3)}"
#puts "Found #{t.depth_first_search(11)}"



#puts t.depth_first_search(-15)
#puts t.dfs_rec(3)