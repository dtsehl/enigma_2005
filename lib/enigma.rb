require './lib/shift'
require './module/shiftable'
require 'date'

class Enigma
  include Shiftable

  attr_reader :letters_hash

  def initialize
    @letters_hash = (("a".."z").to_a << " ").each_with_index.map{ |letter, index| [letter, index + 1] }.to_h
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = nil, date = todays_date)
    encrypted_message = {}
    shift = Shift.new(date, key)
    encrypted_message[:encryption] = encrypt_string(message, shift)
    encrypted_message[:key] = shift.keys.join
    encrypted_message[:date] = date
    encrypted_message
  end

  def decrypt(message, key = nil, date = todays_date)
    decrypted_message = {}
    shift = Shift.new(date, key)
    decrypted_message[:decryption] = decrypt_string(message, shift)
    decrypted_message[:key] = shift.keys.join
    decrypted_message[:date] = date
    decrypted_message
  end

end
