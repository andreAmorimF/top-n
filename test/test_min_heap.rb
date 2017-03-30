require "top-n/min_heap"
require "test/unit"


class TestMinHeap < Test::Unit::TestCase 

    def test_element_swap_on_push
        heap = MinHeap.new()
        
        heap << 11
        assert_equal([nil, 11], heap.elements)

        # After push, new smaller element must go to the top
        heap << 2
        assert_equal([nil, 2, 11], heap.elements)
    end

    def test_heap_state_on_push_in_random_order
        heap = MinHeap.new()
        heap << 11
        heap << 2
        heap << 9
        heap << 13
        heap << 8
        heap << 7
        heap << 4
        heap << 16

        # All child nodes (2*i, 2*i + 1) must be smaller than its parent
        assert_equal([nil, 2, 8, 4, 13, 11, 9, 7, 16], heap.elements)
    end 

    def test_pop_element_swap
        heap = MinHeap.new()
        heap << 11
        heap << 2
        heap << 3 
        assert_equal([nil, 2, 11, 3], heap.elements)

        # After pop, next smaller element must go to the top
        heap.pop
        assert_equal([nil, 3, 11], heap.elements)
    end 

    def test_pop_maintain_total_order
        heap = MinHeap.new()
        heap << 11
        heap << 2
        heap << 9
        heap << 13
        heap << 8
        heap << 7
        heap << 4
        heap << 16
 
        # pop must always return the next smaller element until the heap is empty
        assert_equal(2, heap.pop)
        assert_equal(4, heap.pop)
        assert_equal(7, heap.pop)
        assert_equal(8, heap.pop)
        assert_equal(9, heap.pop)
        assert_equal(11, heap.pop)
        assert_equal(13, heap.pop)
        assert_equal(16, heap.pop)
        assert_equal(nil, heap.pop)
    end

    def test_pop_empty
        heap = MinHeap.new()

        assert_equal(nil, heap.pop)
        # poping again will also return new
        assert_equal(nil, heap.pop)
    end

    def test_push_pop_duplicate_elements
        heap = MinHeap.new()
        heap << 11
        heap << 2
        heap << 3
        heap << 23
        heap << 2

        # In this case the duplicated element will be direct child from the equivalent num 
        assert_equal([nil, 2, 2, 3, 23, 11], heap.elements)

        # After pop, only the root element will be removed
        heap.pop
        assert_equal([nil, 2, 11, 3, 23], heap.elements)
    end

    def test_peek_not_remove_smallest
        heap = MinHeap.new()
        heap << 5
        heap << 1
        heap << 3

        # peek will not remove root element (it will be treated again by 'pop')
        assert_equal(1, heap.peek)
        assert_equal(1, heap.pop)
    end

end
