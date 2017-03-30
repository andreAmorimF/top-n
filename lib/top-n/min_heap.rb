
class MinHeap
  
  attr_reader :elements

  def initialize
    @elements = [nil]
  end

  def <<(element)
    # new element go to the end of the list
    @elements << element

    # bubble up the element that we just added
    bubble_up(@elements.size - 1)
  end

  alias_method :push, :<<

  def pop
    # exchange the root with the last element
    size = elements.size - 1
    @elements[1], @elements[size] = @elements[size], @elements[1]
    
    # remove the last element of the list
    min = @elements.pop
    
    # and make sure the tree is ordered again
    sink_down(1)
    return min
  end

  def peek
    @elements[1]
  end

  def size
    @elements.size
  end

  private
  
    def bubble_up(index)
        # get position of parent in the heap
        parent_index = (index / 2)

        # if parent is smaller or heap is too small in height, don't need to continue
        return if index <= 1 or @elements[parent_index] <= @elements[index]

        # exchange element with parent otherwise
        @elements[index], @elements[parent_index] = @elements[parent_index], @elements[index]

        # go up in the heap
        bubble_up(parent_index)
    end

    def sink_down(index)
        child_index = (index * 2)

        # stop if we reach the bottom of the tree
        return if child_index > @elements.size - 1
        
        # make sure we get the smallest child. NOTE: last element can be an only child
        not_last_element = child_index < @elements.size - 1
        left_element = @elements[child_index]
        right_element = @elements[child_index + 1]
        child_index += 1 if not_last_element && right_element < left_element
        
        # there is no need to continue if the parent element is already smaller then its children
        return if @elements[index] <= @elements[child_index]
        
        @elements[index], @elements[child_index] = @elements[child_index], @elements[index]
        
        # repeat the process until we reach a point where the parent is smaller than its children
        sink_down(child_index)
    end
 
end

