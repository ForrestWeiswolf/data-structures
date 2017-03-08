def knight_moves(from, to)
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

next_positions([0, 0]).each { |e|  puts e.to_s}