
class Knight
  attr_accessor :position

  def initialize(x = 1, y = 1)
    @position = {x: x, y: y}
  end
end

def knight_moves(start, finish)
  return route
end

class Node
  attr_accessor :parent, :position
  
  def initialize(parent, position = nil)
    @parent = parent
	@position = position
  end
end

def knight_allmoves(start)
  derection = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  queue = []
  marked = []
  #start_node = Node.new("root",start}
  marked << start_node
  queue << start_node
  

  
  #while !queue.empty?
    node_q = queue.shift
	
    
	
    derection.each do |der| 
	  
	  position_x = node_q.position[0] + der[0]
	  position_y = node_q.position[1] + der[1]
	  
      #node = Node.new (node_q.position,)
      print "new_node #{new_node}"
	  puts
	  

	  
	  if valid_move?(new_node, marked)
	    marked << new_node[:position]
		queue << new_node
		
		print "queue#{queue}"
		puts
	  end
    end
  
  #end
    


end

def valid_move?(node, marked)
  if node[:position][0].between?(0,8) and node[:position][1].between?(0,8)
    if  marked.all?{ |m_node| m_node != node[:position] }
	  return true
	end
  end
  
end


#knight_allmoves ([3,3])
a = Node.new(1)