class Tree
	attr_accessor :val, :descendants
	def initialize(val = nil, descendants = [])
		@val = val
		@descendants = descendants
	end

	def to_s
		"Node with #{@val} (descendants #{@descendants.to_s})"
	end

	def each_leaf
		unless @descendants.size > 0
			yield(self)
		else
			@descendants.each do |descendant|
				descendant.each_leaf do |l|
					yield(l)
				end
			end
		end
	end
end

def knight_moves(from, to)
	paths = Tree.new(from)
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

t = Tree.new(1, [Tree.new(3, [Tree.new(1), Tree.new(5)]), Tree.new(12)])
t.each_leaf do |l|
	puts l
end