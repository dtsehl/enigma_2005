require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset
  end

  def test_it_can_have_a_date_set
    offset = Offset.new("103030")
    assert_equal "103030", offset.date
  end

  def test_its_date_defaults_to_today_with_no_arg
    offset = Offset.new
    assert_equal Date.today.strftime("%d%m%y"), offset.date
  end

  def test_it_can_find_four_digit_offset
    offset = Offset.new("103030")
    assert_equal "0900", offset.find_offset
  end

  def test_it_can_assign_and_have_A_through_D_keys
    offset = Offset.new("103030")
    offset.find_offset
    offset.assign_offset
    assert_equal "0", offset.a_offset
    assert_equal "9", offset.b_offset
    assert_equal "0", offset.c_offset
    assert_equal "0", offset.d_offset
  end

end
