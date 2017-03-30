require 'top-n/min_heap'

module TopN

    def TopN.read_nums_from_file(path, max_size)
       min_heap = MinHeap.new()
       
       # return empty heap if max_size is 0 (doesn't need to parse file)
       return min_heap if max_size == 0 

       # Open and stream target file, line-by-line
       File.open(path, "r") do |f|
       f.each_line { | line |
          begin
             # fetch and clean line from start/trailling whitespaces
             num_str = line.strip

             # skip line if string does not represent a number
             next unless num_str.is_number?

             # cast string into number
             num = num_str.to_i

             # take minimun element in the heap (the root element)
             minimun = min_heap.peek
                
             if minimun.nil? or num > minimun or ((min_heap.size - 1) < max_size) then
                # let's not forget the min_heap will contain 'nil' as starting element, so we should decrement it's size by 1
                min_heap.pop if (min_heap.size - 1) == max_size

                # insert element in the heap 
                min_heap << num
             end
          rescue
             # skip errors related to number formatting
          end
       }
       end
       
       return min_heap
    end

    def TopN.print_heap(heap)
       # prints the heap, from the biggest element to the smallest 
       result = []
       result.replace(heap.elements)
       result.shift
       result.sort { |x,y| y <=> x }
    end
     
end

class String

  # add helper method to string class: check if it can represents a number
  def is_number?
     true if Float(self) rescue false
  end

end

