require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new("040895", "02715")
    assert_instance_of Shift, shift
  end

  def test_it_can_generate_keys
    shift = Shift.new("040895")
    assert_equal 5, shift.keys.count
  end

  def test_it_can_create_offsets
    shift = Shift.new("040895", "02715")
    assert_equal "1025", shift.create_offset("040895")
  end

  def test_it_can_square_a_date
    shift = Shift.new("040895", "02715")
    assert_equal 1672401025, shift.square("040895")
  end

  def test_it_can_get_last_4_digits_of_date
    shift = Shift.new("040895", "02715")
    assert_equal "0895", shift.last_four("040895")
  end

  def test_it_can_make_final_shift
    shift = Shift.new("040895", "02715")

    assert_equal 3, shift.final_shift[0]
    assert_equal 27, shift.final_shift[1]
    assert_equal 73, shift.final_shift[2]
    assert_equal 20, shift.final_shift[3]
  end

end
