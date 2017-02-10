class LinkedList
	def initialize
		@head = Node.new()
	end

	def append(data)
	end

	def prepend(data)
		@head = Node.new(data, @head)
	end

	def size
		count = 0
		self.each do |i|
			count += 1
		end
		return count
	end

	def head
		return @head
	end

	def tail
	end

	def at(_index)
		# node = @head
		# (_index - 1).times do
		# 	node = node.next_node
		# end
		# return node
	end

	def pop
	end

	def contains?(data)
	end

	def find(data)
	end

	def to_s
		str = ""
		self.each do |node_data|
			str += "( #{node_data} ) -> "
		end
		str += "nil"
		return str
	end

	def each
		node = @head
		while node.next_node
			yield(node.data)
			node = node.next_node
		end
		yield(node.data) 
	end
end

class Node
	attr_accessor :data, :next_node
	def initialize(data = nil, next_node = nil)
		@data = data
		@next_node = next_node
	end
end


l = LinkedList.new()
puts l.to_s
#l.append("A")
#puts l.to_s
# l.append("A")
# puts l.to_s
l.prepend("B")
puts l.to_s
puts l.size