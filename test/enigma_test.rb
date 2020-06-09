require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_initializes_with_alphabet
    enigma = Enigma.new
    expected = {"a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8, "i"=>9, "j"=>10, "k"=>11, "l"=>12, "m"=>13, "n"=>14, "o"=>15, "p"=>16, "q"=>17, "r"=>18, "s"=>19, "t"=>20, "u"=>21, "v"=>22, "w"=>23, "x"=>24, "y"=>25, "z"=>26, " "=>27}
    assert_equal expected, enigma.letters_hash
  end

  def test_it_can_get_todays_date_jun_8_2020
    skip
    enigma = Enigma.new
    assert_equal "080620", enigma.todays_date
  end

  def test_it_can_encrypt_string
    enigma = Enigma.new
    shift = Shift.new("040895", "02715")
    assert_equal "keder ohulw!", enigma.encrypt_string("hello world!", shift)
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    expected = {
                  encryption: "keder ohulw!",
                  key: "02715",
                  date: "040895"
                }

    assert_equal expected, enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_decrypt_string
    enigma = Enigma.new
    shift = Shift.new("040895", "02715")
    assert_equal "hello world!", enigma.decrypt_string("keder ohulw!", shift)
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    expected = {
                  decryption: "hello world!",
                  key: "02715",
                  date: "040895"
                }

    assert_equal expected, enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_it_can_encrypt_nonstandard_string
    enigma = Enigma.new

    assert_equal "bsm;oe'qmihfzvzbc!", enigma.encrypt("Wow; I'm a string!", "02715" "040895")[:encryption]
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

  def test_it_can_encrypt_with_only_message_no_key_or_date
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
