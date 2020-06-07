require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_start_up
    enigma = Enigma.new
    enigma.startup(key = Key.new, "040895", shift = Shift.new)
    assert_equal Integer, shift.a_shift.class
    enigma.startup("02715", "040895", shift = Shift.new)
    assert_equal Integer, shift.b_shift.class
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

  def test_it_can_encrypt_message
    enigma = Enigma.new
    expected =  {
                   encryption: "keder ohulw",
                   key: "02715",
                   date: "040895"
                }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

end
