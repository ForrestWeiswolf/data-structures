class LinkedList
	def initialize()
		@head = nil
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
		return self.at(self.size-1)
	end

	def at(_index)
		if @head
			node = @head
			(_index).times do
				node = node.next_node
			end
			return node
		end
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
		if @head
			node = @head
			while node.next_node
				yield(node.data)
				node = node.next_node
			end
			yield(node.data) 
		end
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
# l.append("A")
# puts l.to_s
l.prepend("C")
l.prepend("B")
l.prepend("A")
puts l.to_s
puts l.size
puts l.at(1).data
puts l.tail.data