class Node
	attr_accessor :val, :parent, :left, :right
	def initialize(value, parent, left=nil, right=nil)
		@val = value
		@left = left
		@right = right
		@parent = parent
	end

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
		"Node with #{@val}"
	end

	def show_tree
	 	"#{@val}(#{self.left.to_s}) (#{self.right.to_s})"
	end

	def breadth_first_search(item)
		queue = []
		result = nil
		if @val = item
			result = self
		else
			queue += @left if @left
			queue += @right if @right
			queue.each do |node|
				result = node.breadth_first_search(item)
			end
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


t = make_tree([11, 1, 1, 3, 2, 2, 0, -12, -15, -9])
puts t.breadth_first_search(-9)