class LinkedList
	def initialize()
		@head = nil
	end

	def append(data)
		self.tail.next_node = Node.new(data)
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
		return self.at(-1)
	end

	def at(_index)
		if @head
			_index = self.size + _index if _index < 0

			node = @head
			(_index).times do
				node = node.next_node
			end
			return node
		end
	end

	def pop
		tail = self.tail
		self.at(-2).next_node = nil
		return tail
	end

	def contains?(data)
		self.find(data) ? true : false
	end

	def find(data)
		self.each_with_index do |node_data, _index|
			return _index if node_data == data
		end
		return false
	end

	def to_s
		str = ""
		self.each do |node_data|
			str += "( #{node_data} ) -> "
		end
		str += "nil"
		return str
	end

	def each_with_index
		if @head
			_index = 0
			node = @head
			while node.next_node
				yield(node.data, _index)
				_index += 1
				node = node.next_node
			end
			yield(node.data, _index) 
		end
	end

	def each
		self.each_with_index do |node_data, index|
			yield(node_data)
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
l.prepend("B")
l.prepend("A")
puts l.to_s
l.append("C")
puts l.to_s
puts "Size = #{l.size}"
puts "At 1: #{l.at(1).data}"
puts "At -2: #{l.at(-2).data}"
puts "Tail: #{l.tail.data}"
puts "Contains 'A': #{l.contains?('A')}"
puts "Contains 'R': #{l.contains?('R')}"
puts "'B' at: #{l.find('B')}"
puts "'S' at: #{l.find('S')}"
l.pop
puts "Pop!"
puts l.to_s
