module Shiftable

  def encrypt_string(message, shift)
    accum = []
    message.downcase.chars.each_with_index do |letter, position|
      if !@letters_array.include?(letter)
        accum << letter
      else
        accum << @letters_array[(@letters_array.index(letter) + shift.final_shift.first) % 27]
        shift.final_shift.rotate!(1)
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
        accum << @letters_array[(@letters_array.index(letter) - shift.final_shift.first) % 27]
        shift.final_shift.rotate!(1)
      end
    end
    accum.join
  end

end
