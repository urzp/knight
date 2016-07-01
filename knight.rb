
class Node
  attr_accessor :position, :parent

  def initialize(parent, position)
    @parent = parent
    @position = position
  end

  def pos_x()
    @position[0]
  end

  def pos_y()
    @position[1]
  end

  def move(derect)
    pos_x = @position[0] + derect[0]
    pos_y = @position[1] + derect[1]
    return [pos_x, pos_y]
  end
end

def knight_moves(start, finish)
  derections = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  queue = []
  marked = []
  start_node = Node.new("root",start)
  queue << start_node
  marked << start_node

  while !queue.empty?
    node_q = queue.shift

    derections.each do |derect|
      node = Node.new( node_q.position, node_q.move(derect) )

      if valid?(node, marked)
        queue << node
        marked << node
      end

      if node.position == finish
        return back_trak(node, marked)
      end
    end

  end

end

def back_trak(node, marked)
  route = []
  while node.parent != "root"
    marked.each do |bak_node|
      if node.parent == bak_node.position
        route << node
        node = bak_node
        break
      end
    end
  end
  return route
end

def knight_allmoves(start)
  derections = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  queue = []
  marked = []
  start_node = Node.new("root",start)
  queue << start_node
  marked << start_node

  while !queue.empty?
    node_q = queue.shift
    #puts "parent = #{node_q.parent} positin = #{node_q.position}"

    derections.each do |derect|
      node = Node.new( node_q.position, node_q.move(derect) )
      if valid?(node, marked)
        queue << node
        marked << node
      end
    end
  end
  return marked
end

def valid?(node, marked)
  if node.pos_x.between?(0,8) and node.pos_y.between?(0,8)
    return true if marked.all?{ |node_m| node_m.position != node.position }
  end
end





route = knight_moves([3,3],[8,8])

route.each do |node|
  print "parent = #{node.parent} positin = #{node.position}"
  puts
end

puts route.size

#---------------------------------------------- tools
#n = Node.new("root", [3,3])

#print "marked= #{marked}"
#puts
