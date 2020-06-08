module Shiftable

  def encrypt_string(message, shift)
    accum = []
    message.downcase.chars.each_with_index do |letter, position|
      if !@letters_array.include?(letter)
        accum << letter
      else
        accum << @letters_array[(@letters_array.index(letter) + shift.numbers.first) % 27]
        shift.numbers.rotate!(1)
      end
    end
    accum.join
  end

  def decrypt_string(message, shift)
    accum = []
    message.chars.each_with_index do |letter, position|
      if !@letters_array.include?(letter)
        accum << letter
      else
        accum << @letters_array[(@letters_array.index(letter) - shift.numbers.first) % 27]
        shift.numbers.rotate!(1)
      end
    end
    accum.join
  end

end
