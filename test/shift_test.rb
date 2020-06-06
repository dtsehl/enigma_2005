require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_it_can_combine_key_and_offset
    shift = Shift.new
    key = Key.new
    key.instance_variable_set("@numbers", [0, 1, 2, 3, 4])
    key.assign_key
    offset = Offset.new("103030")
    offset.find_offset
    offset.assign_offset

    shift.combine(key, offset)

    assert_equal 1, shift.a_shift
    assert_equal 21, shift.b_shift
    assert_equal 23, shift.c_shift
    assert_equal 34, shift.d_shift
  end

end
