require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_string
    enigma = Enigma.new
    shift = Shift.new
    key = Key.new
    key.assign_key("02715")
    offset = Offset.new("040895")
    offset.find_offset
    offset.assign_offset
    shift.combine(key, offset)

    assert_equal "keder ohulw", enigma.encrypt_string("hello world", shift)
  end

  def test_it_can_encrypt_nonstandard_string
    enigma = Enigma.new
    shift = Shift.new
    key = Key.new
    key.generate
    key.assign_key("02715")
    offset = Offset.new("040895")
    offset.find_offset
    offset.assign_offset
    shift.combine(key, offset)

    assert_equal "zoo;ci'fcaslwragj!", enigma.encrypt_string("Wow; I'm a string!", shift)
  end

  def test_it_can_decrypt_string
    enigma = Enigma.new
    shift = Shift.new
    key = Key.new
    key.assign_key("02715")
    offset = Offset.new("040895")
    offset.find_offset
    offset.assign_offset
    shift.combine(key, offset)

    assert_equal "hello world", enigma.decrypt_string("keder ohulw", shift)
  end

  def test_it_can_decrypt_nonstandard_string
    enigma = Enigma.new
    shift = Shift.new
    key = Key.new
    key.assign_key("02715")
    offset = Offset.new("040895")
    offset.find_offset
    offset.assign_offset
    shift.combine(key, offset)

    assert_equal "wow; i'm a string!", enigma.decrypt_string("zoo;ci'fcaslwragj!", shift)
  end

end
