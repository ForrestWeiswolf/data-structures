class Node
	attr_accessor :val, :left, :right, :parent
	def initialize(value, left, right, parent)
		@val = value
		@left = left
		@right = right
		@parent = parent
	end	
end
