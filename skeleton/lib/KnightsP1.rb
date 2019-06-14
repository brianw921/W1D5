require_relative "PolyTreeNode"


# class KnightPathFinder
#   def self.valid_moves(pos) #8 poss moves
#   end

#   def initialize(kpf)
#     kpf = KnightPathFinder.new([0,0])
#     @root_node = [0,0]
#     self.build_move_tree
#     @considered_positions = [[0,0]]
#   end

#   def considered_positions
#     self 
#   end

#   #  def build_move_tree
#   #   self.move_
#   #     self.new_move_positions
#   #     root.bfs
#   #   end

#   # def find_path(pos)
        
#   # end

#   def new_move_positions(pos)
#     KnightPathFinder.valid_moves
#     @considered_positions
#   end

# end

class KnightPathFinder
  attr_accessor :root_node
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    self.build_move_tree
    @considered_positions = [@rootnode]
  end

  # def build_move_tree

  # end
  def self.valid_moves(pos) #less than 7 #pos is [x, x]
    pos[0] <= 7 && pos[1] <= 7
  end

  def new_move_positions(pos) #filters. then adds remaining to considered and returns them
    r = []
    r << [pos[0] + 1, pos[1] + 2]
    r << [pos[0] + 2, pos[1] + 1]
    r << [pos[0] + 2, pos[1] - 1]
    r << [pos[0] + 1, pos[1] - 2]
    r << [pos[0] -1, pos[1] - 2]
    r << [pos[0] -2, pos[1] - 1]
    r << [pos[0] -2, pos[1] + 1]
    r << [pos[0] -1, pos[1] + 2]
    r = r.select {|el| KnightPathFinder.valid_moves(el) }
    r = r.select {|el| !@considered_positions.include?(el)}
  end   
end
if__FILE__ == $PROGRAM_NAME
kpf = KnightPathFinder([0, 0])

kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
end