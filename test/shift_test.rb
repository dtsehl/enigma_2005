require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  # def test_it_exists
  #   shift = Shift.new
  #   assert_instance_of Shift, shift
  # end

  def test_it_can_combine_key_and_offset
    shift = Shift.new("040895", "02715")

    assert_equal 3, shift.final_shift[0]
    assert_equal 27, shift.final_shift[1]
    assert_equal 73, shift.final_shift[2]
    assert_equal 20, shift.final_shift[3]
  end

  # def test_it_can_combine_key_and_offset_with_given_key
  #   shift = Shift.new
  #   key = Key.new
  #   key.assign_key("02715")
  #   offset = Offset.new("040895")
  #   offset.find_offset
  #   offset.assign_offset
  #
  #   shift.combine(key, offset)
  #
  #   assert_equal 3, shift.numbers[0]
  #   assert_equal 27, shift.numbers[1]
  #   assert_equal 73, shift.numbers[2]
  #   assert_equal 20, shift.numbers[3]
  # end

end
