require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_string
    enigma = Enigma.new
    assert_equal "keder ohulw", enigma.encrypt("hello world", "02715", "040895")
  end

end
