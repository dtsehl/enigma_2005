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
    assert_equal Array, shift.numbers.class
    enigma.startup("02715", "040895", shift = Shift.new)
    assert_equal 3, shift.numbers.first
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

    assert_equal "bsm;oo'qqpfwjforx!", enigma.encrypt("Wow; I'm a string!", "02715" "040895")[:encryption]
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

    assert_equal "hello, world!", enigma.decrypt("keder, ohulw!", "02715", "040895")[:decryption]
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

  def test_it_can_decrypt_message
    enigma = Enigma.new
    expected =  {
                   decryption: "hello world",
                   key: "02715",
                   date: "040895"
                }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_key_only_and_todays_date_at_Jun_7_2020
    skip
    enigma = Enigma.new
    expected =  {
                   encryption: "nib udmcxpu",
                   key: "02715",
                   date: "070620"
                }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_with_key_only_and_todays_date_at_Jun_7_2020
    skip
    enigma = Enigma.new
    expected_encryption =  {
                   encryption: "nib udmcxpu",
                   key: "02715",
                   date: "070620"
                }
    expected_decryption =  {
                   decryption: "hello world",
                   key: "02715",
                   date: "070620"
                }
    assert_equal expected_decryption, enigma.decrypt(expected_encryption[:encryption], "02715")
  end

  def test_it_can_encrypt_with_only_message_no_key
    skip
    enigma = Enigma.new
    expected =  {
                   encryption: "nib udmcxpu",
                   key: "02715",
                   date: "070620"
                }
    assert_equal expected, enigma.encrypt("hello world")
  end

end
