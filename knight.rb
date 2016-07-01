
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

all_m = knight_allmoves([0,0])

all_m.each do |node|
  print "parent = #{node.parent} positin = #{node.position}"
  puts
end

puts all_m.size

#---------------------------------------------- tools
#n = Node.new("root", [3,3])

#print "marked= #{marked}"
#puts
