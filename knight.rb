
class Knight
  attr_accessor :position

  def initilaze(x = 1, y = 1)
    @position = {x: x, y: y}
  end
end

def knight_moves(start, finish)
  return route
end

def knight_allmoves(start)
  derection = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]]
  queue = []
  marked = []
  marked << start
  queue << start
  
  
  while !queue.empty?
    node_next = queue.shift
	new_nods = []
	
    derection.each do |der|
      new_nods << [ node_next[0]+der[0], node_next[1]+der[1] ]
    end
  
    new_nods.select! do |node|
      node[0].between?(0,8) and node[1].between?(0,8)   
    end
    #print new_nods
    #puts
  
    new_nods.select! do |node|
      marked.all?{ |m_node| m_node != node }
    end
    marked = marked + new_nods
    queue = queue + new_nods
	#print queue
	#puts
  end
    
	print marked
	puts
	puts marked.size

end



knight_allmoves ([3,3])
