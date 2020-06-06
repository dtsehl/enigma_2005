require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_it_can_generate_5_numbers
    key = Key.new
    key.generate
    assert_equal 5, key.numbers.count
  end

  def test_it_can_assign_and_have_A_through_D_keys
    key = Key.new
    key.instance_variable_set("@numbers", [0, 1, 2, 3, 4])
    key.assign_key
    assert_equal "01", key.a_key
    assert_equal "12", key.b_key
    assert_equal "23", key.c_key
    assert_equal "34", key.d_key
  end

end
