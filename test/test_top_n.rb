require "top-n"
require "test/unit"

class TestTopN < Test::Unit::TestCase

    def test_load_example_file
        heap = TopN.read_nums_from_file("#{__dir__}/resources/test.txt", 5)
        
        assert_equal([nil, 122, 345, 2847, 3214, 578], heap.elements)
    end

    def test_print_top_4
        heap = TopN.read_nums_from_file("#{__dir__}/resources/test.txt", 4)
        result = TopN.print_heap(heap)

        assert_equal([3214, 2847, 578, 345], result)
    end

    def test_print_top_1
        heap = TopN.read_nums_from_file("#{__dir__}/resources/test.txt", 1)
        result = TopN.print_heap(heap)

        assert_equal([3214], result)
    end

    def test_print_top_0
        heap = TopN.read_nums_from_file("#{__dir__}/resources/test.txt", 0)
        result = TopN.print_heap(heap)

        assert_equal([], result)
    end

    def test_print_top_billion
        heap = TopN.read_nums_from_file("#{__dir__}/resources/test.txt", 1000000000)
        result = TopN.print_heap(heap)

        assert_equal([3214, 2847, 578, 345, 122, 27, 12, 4, 2, 1], result)
    end

end
