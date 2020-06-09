module Shiftable

  def encrypt_string(message, shift)
    message.downcase.chars.reduce([]) do |ary, letter|
      if !@letters_hash.keys.include?(letter)
        ary << letter
      elsif (@letters_hash[letter] + shift.final_shift.first) % 27 == 0
        ary << letter
        shift.final_shift.rotate!(1)
      else
        ary << @letters_hash.key((@letters_hash[letter[0]] + shift.final_shift.first) % 27)
        shift.final_shift.rotate!(1)
      end
      ary
    end.join
  end

  def decrypt_string(message, shift)
    message.chars.reduce([]) do |ary, letter|
      if !@letters_hash.keys.include?(letter)
        ary << letter
      elsif (@letters_hash[letter] - shift.final_shift.first) % 27 == 0
        ary << letter
        shift.final_shift.rotate!(1)
      else
        ary << @letters_hash.key((@letters_hash[letter] - shift.final_shift.first) % 27)
        shift.final_shift.rotate!(1)
      end
      ary
    end.join
  end

end
