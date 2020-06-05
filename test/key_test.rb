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

  # def test_it_can_have_A_through_D_keys
  #   key = Key.new
  #   key.stub(:numbers).returns([0, 1, 2, 3, 4])
  #   assert_equal [0, 1, 2, 3, 4], key.numbers
  # end

end
