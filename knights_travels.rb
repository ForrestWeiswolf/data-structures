class TreeNode
	attr_accessor :val, :parent, :descendants
	def initialize(val = nil, parent = nil, descendants = [])
		@val = val
		@parent = parent
		@descendants = descendants
	end

	def to_s
		parent_val = @parent.val if @parent
		"Node with #{@val} (descendants #{@descendants.to_s}, parent #{parent_val})"
	end

	def each_leaf
		#turned out to not need this
		unless @descendants.size > 0
			yield(self)
		else
			@descendants.each do |descendant|
				descendants.each_leaf do |l|
					yield(l)
				end
			end
		end
	end

	#returns an array containing the ancestry of self, starting with the root of the tree and ending with self
	def path_to
		result = [self]
		result = @parent.path_to + result if @parent
		return result
	end
end

def knight_moves(from, to)
	result = nil
	paths = TreeNode.new(from)
	queue = [paths]

	queue.each do |node|
		#puts "Checking #{node}"
		if node.val == to
			result = node
			break
		else
			next_positions(node.val).each do |position|
				descendant = TreeNode.new(position, node)
				node.descendants << descendant
				queue << descendant
			end
		end
	end

	result = result.path_to
	return result.map { |node| node.val}
end

#lists the positions a knight can move to from a given square
def next_positions(pos)
	result = []
	moves = [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
	moves.each do |move|
		possibility = [pos[0] + move[0], pos[1] + move[1]]
		if possibility[0].between?(0, 7) && possibility[1].between?(0, 7)
			result << possibility
		end
	end
	return result
end

knight_moves([3,3],[4,3]).each{ |move| puts move.to_s}