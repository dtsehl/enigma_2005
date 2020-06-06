require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_it_can_sum_key_and_offset
    shift = Shift.new
    key = Key.new
    offset = Offset.new
    shift.combine(key, offset)
    assert_equal 3, shift.a_shift
    assert_equal 2, shift.b_shift
    assert_equal 4, shift.c_shift
    assert_equal 5, shift.d_shift
  end

end
