require "byebug"
class PolyTreeNode
  # attr_accessor :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if node != nil && @parent != node 

      node.children << self 
      @parent.children.delete(self) unless @parent == nil
      @parent = node
       

    elsif node == nil && @parent            
      @parent = node 
    else 
      @parent == node
    end

  end

  def add_child(node)
    node.parent = self
    @children << node unless @children.include?(node)
  end 
  
  def remove_child(node)
    if @children.include?(node)
      node.parent = nil
      @children.delete(node)
    else
      raise "not a child`"
    end
  end 




  def bfs(target)
    
    queue = [self]
   
    until queue.empty? 
      value_shift = queue.shift
      return value_shift if value_shift.value == target 
      value_shift.children.each do |child|
        queue << child
      end
    end
    nil
  end


  def dfs(target)
    return self if self.value == target
      self.children.each do |child|
        apple = child.dfs(target)
        return apple if apple != nil
      end
    return nil 
  end

  
end