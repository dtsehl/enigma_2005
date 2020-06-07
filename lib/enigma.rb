require './lib/shift'

class Enigma

  def initialize
    @letters_array = ("a".."z").to_a << " "
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

  def encrypt_string(message, shift)
    accum = []
    message.downcase.chars.each_with_index do |letter, position|
      if !@letters_array.include?(letter)
        accum << letter
      elsif position == 0 || position % 4 == 0
        place = (@letters_array.index(letter) + shift.a_shift) % 27
        accum << @letters_array[place]
      elsif position == 1 || position % 4 == 1
        place = (@letters_array.index(letter) + shift.b_shift) % 27
        accum << @letters_array[place]
      elsif position == 2 || position % 4 == 2
        place = (@letters_array.index(letter) + shift.c_shift) % 27
        accum << @letters_array[place]
      elsif position == 3 || position % 4 == 3
        place = (@letters_array.index(letter) + shift.d_shift) % 27
        accum << @letters_array[place]
      end
    end
    accum.join
  end

  def decrypt_string(message, shift)
    accum = []
    message.downcase.chars.each_with_index do |letter, position|
      if !@letters_array.include?(letter)
        accum << letter
      elsif position == 0 || position % 4 == 0
        place = (@letters_array.index(letter) - shift.a_shift) % 27
        accum << @letters_array[place]
      elsif position == 1 || position % 4 == 1
        place = (@letters_array.index(letter) - shift.b_shift) % 27
        accum << @letters_array[place]
      elsif position == 2 || position % 4 == 2
        place = (@letters_array.index(letter) - shift.c_shift) % 27
        accum << @letters_array[place]
      elsif position == 3 || position % 4 == 3
        place = (@letters_array.index(letter) - shift.d_shift) % 27
        accum << @letters_array[place]
      end
    end
    accum.join
  end

  def encrypt(message, key = Key.new, date = Date.today.strftime("%d%m%y"))
    shift = Shift.new
    startup(key, date, shift)
    encrypt_string(message, shift)
  end

end
