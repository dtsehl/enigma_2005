require './lib/shift'
require './module/shiftable'

class Enigma
  include Shiftable

  def initialize
    @letters_array = ("a".."z").to_a << " "
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def startup(key, date, shift)
    if key.class == Key
      key.generate
      key.assign_key
      offset = Offset.new(date)
      offset.find_offset
      offset.assign_offset
      shift.combine(key, offset)
    else
      current_key = Key.new
      current_key.assign_key(key)
      offset = Offset.new(date)
      offset.find_offset
      offset.assign_offset
      shift.combine(current_key, offset)
    end
  end

  def encrypt(message, key = Key.new, date = todays_date)
    encrypted_message = {}
    shift = Shift.new
    startup(key, date, shift)
    key = key.numbers.join if key.class == Key
    encrypted_message[:encryption] = encrypt_string(message, shift)
    encrypted_message[:key] = key
    encrypted_message[:date] = date
    encrypted_message
  end

  def decrypt(message, key = Key.new, date = todays_date)
    decrypted_message = {}
    shift = Shift.new
    startup(key, date, shift)
    decrypted_message[:decryption] = decrypt_string(message, shift)
    decrypted_message[:key] = key
    decrypted_message[:date] = date
    decrypted_message
  end

end
